//
//  UIImage+JPCategory.m
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/14.
//

#import "UIImage+JPCategory.h"

@implementation UIImage (JPCategory)

- (UIImage *)stey_cornerImageWithSize:(CGSize)size {
    
    return [self stey_cornerImageWithSize:size cornerRadius:size.width/2.0];
}

- (UIImage *)stey_cornerImageWithSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius {
    
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

- (void)stey_asynCornerImageWithSize:(CGSize)size completion:(void (^)(UIImage *))completion {
    
    [self stey_asynCornerImageWithSize:size cornerRadius:size.width/2.0 completion:completion];
}


- (void)stey_asynCornerImageWithSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius completion:(void (^)(UIImage *))completion {
    
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

- (void)stey_asynRoundImageWithSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius completion:(void (^)(UIImage * _Nonnull))completion {
    
    [self stey_asynRoundImageWithSize:size cornerRadius:cornerRadius borderWidth:2 borderColor:[UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1] completion:completion];
}

- (void)stey_asynRoundImageWithSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor completion:(void (^)(UIImage *))completion {
    
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

@end