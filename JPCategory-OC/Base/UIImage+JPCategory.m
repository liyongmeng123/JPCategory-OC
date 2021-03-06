//
//  UIImage+JPCategory.m
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2021/1/14.
//

#import "UIImage+JPCategory.h"

@implementation UIImage (JPCategory)

+ (UIImage *)jp_imageWithColor:(UIColor *)color {
    
    return [UIImage jp_imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)jp_imageWithColor:(UIColor *)color size:(CGSize)size {
    
    if (color == nil) {
        return nil;
    }
    
    CGRect rect=CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage *)jp_randomColorImageWith:(CGSize)size {
    
    UIColor *randomColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    return [UIImage jp_imageWithColor:randomColor size:size];
}

- (UIImage *)jp_cornerImageWithSize:(CGSize)size {
    
    return [self jp_cornerImageWithSize:size cornerRadius:size.width/2.0];
}

- (UIImage *)jp_cornerImageWithSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius {
    
    //使用绘图 取得上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    
    //绘制范围
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    //使用贝塞尔曲线设置裁切路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    //裁切
    [path addClip];
    
    //将图片重绘到已经裁切过的上下文中
    [self drawInRect:rect];
    
    //取出图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束上下文
    UIGraphicsEndImageContext();
    
    return image;
    
}

- (void)jp_asyncCornerImageWithSize:(CGSize)size completion:(void (^)(UIImage *image))completion {

    [self jp_asyncCornerImageWithSize:size cornerRadius:size.width / 2.0 completion:completion];
}


- (void)jp_asyncCornerImageWithSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius completion:(void (^)(UIImage *cornerImage))completion {
    
    //异步绘制
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        //使用绘图 取得上下文
        UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
        
        //绘制范围
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        
        if (cornerRadius) {
            
            //使用贝塞尔曲线设置裁切路径
            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
            //裁切
            [path addClip];
        }
        
        //将图片重绘到已经裁切过的上下文中
        [self drawInRect:rect];
        
        //取出图片
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        //结束上下文
        UIGraphicsEndImageContext();
        
        //主线程调用block返回图片
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                completion(image);
            }
        });
        
    });
}

- (void)jp_asyncRoundImageWithSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius completion:(void (^)(UIImage *))completion {

    [self jp_asyncRoundImageWithSize:size cornerRadius:cornerRadius borderWidth:2 borderColor:[UIColor colorWithRed:216 / 255.0 green:216 / 255.0 blue:216 / 255.0 alpha:1] completion:completion];
}

- (void)jp_asyncRoundImageWithSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor completion:(void (^)(UIImage *))completion {
    
    //异步绘制
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        //imageSize
        CGSize imageSize = CGSizeMake(size.width, size.height);
        //使用绘图 取得上下文
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
        CGRect imageRect = CGRectMake(0, 0, imageSize.width, imageSize.height);

        //绘制范围
        UIBezierPath *imagePath = [UIBezierPath bezierPathWithRoundedRect:imageRect cornerRadius:cornerRadius];
        //裁切
        [imagePath addClip];
        
        //将图片重绘到已经裁切过的上下文中
        [self drawInRect:imageRect];
        
        [borderColor setStroke];
        imagePath.lineWidth = borderWidth;
        [imagePath stroke];
        //取出图片
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        //结束上下文
        UIGraphicsEndImageContext();
        
        //主线程调用block返回图片
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                completion(image);
            }
        });
        
    });
    
}

- (UIImage *)jp_compress {
    
    return [self jp_compressWithBoundary:1920 smallBoundary:1080 compression:0.5];
}

- (UIImage *)jp_compressWithBoundary:(CGFloat)boundary smallBoundary:(CGFloat)smallBoundary compression:(CGFloat)compression {
    
    CGFloat imageWidth = self.size.width;
    CGFloat imageHeight = self.size.height;
    CGFloat compressWidth = imageWidth;
    CGFloat compressHeight = imageHeight;
    CGSize compressSize = CGSizeMake(compressWidth, compressHeight);
    
    // 如果图片本身的宽高 <= boundary, 则使用图片本身的size
    // 如果宽高有一个 > boundary, 通过宽高比计算目标宽高
    if (imageWidth > boundary || imageHeight > boundary) {
        // 宽高比
        CGFloat scale = MAX(imageWidth, imageHeight) / MIN(imageWidth, imageHeight);
        if (scale <= 2) {
            CGFloat s = MAX(imageWidth, imageHeight) / boundary;
            if (imageWidth > imageHeight) {
                compressWidth = boundary;
                compressHeight = imageHeight / s;
            } else {
                compressHeight = boundary;
                compressWidth = imageWidth / s;
            }
        } else {
            if (MIN(imageWidth, imageHeight) >= boundary) {
                // 图片的最小边 > boundary, 那么将最小边设为 smallBoundary
                CGFloat newBoundary = smallBoundary;
                CGFloat s = MIN(imageWidth, imageHeight) / newBoundary;
                if (imageWidth < imageHeight) {
                    compressWidth = newBoundary;
                    compressHeight = imageHeight / s;
                } else {
                    compressHeight = newBoundary;
                    compressWidth = imageWidth / s;
                }
            }
        }
        compressSize = CGSizeMake(compressWidth, compressHeight);
    }
    
    // 重绘
    UIGraphicsBeginImageContext(compressSize);
    [self drawInRect:CGRectMake(0, 0, compressSize.width, compressSize.height)];
    UIImage *compressImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // 压缩图片
    NSData *imageData = UIImageJPEGRepresentation(compressImage, compression);
    if (imageData.length > 0) {
        return [UIImage imageWithData:imageData];
    }
    
    return self;
}

@end
