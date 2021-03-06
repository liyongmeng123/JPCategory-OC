//
//  UIButton+JPCategoey.h
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2021/5/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (JPCategory)

/**
 * init button (title/font/titleColor)
 * @param normalTitle
 * @param titleFont
 * @param normalTitleColor
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                                 frame:(CGRect)frame;

/**
 * init button (title/font/titleColor/normalImage)
 * @param normalTitle
 * @param titleFont
 * @param normalTitleColor
 * @param normalImage
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                           normalImage:(UIImage *)normalImage
                                 frame:(CGRect)frame;

/**
 * init button (title/selectedTitle/font/titleColor/selectedTitleColor)
 * @param normalTitle
 * @param selectedTitle
 * @param titleFont
 * @param normalTitleColor
 * @param selectedTitleColor
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                         selectedTitle:(NSString *)selectedTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                    selectedTitleColor:(UIColor *)selectedTitleColor
                                 frame:(CGRect)frame;

/**
 init button (title/font/titleColor/normalImage/selectedImage)

 @param normalTitle normalTitle description
 @param titleFont titleFont description
 @param normalTitleColor normalTitleColor description
 @param normalImage normalImage description
 @param selectedImage
 @param frame frame description
 @return return value description
 */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                           normalImage:(UIImage *)normalImage
                         selectedImage:(UIImage *)selectedImage
                                 frame:(CGRect)frame;

/**
 * init button (normalTitle/selectedTitle/titleFont/normalTitleColor/selectedTitleColor/normalImage/selectedImage)
 * @param normalTitle
 * @param selectedTitle
 * @param titleFont
 * @param normalTitleColor
 * @param selectedTitleColor
 * @param normalImage
 * @param selectedImage
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                         selectedTitle:(NSString *)selectedTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                    selectedTitleColor:(UIColor *)selectedTitleColor
                           normalImage:(UIImage *)normalImage
                         selectedImage:(UIImage *)selectedImage
                                 frame:(CGRect)frame;

/**
 * init button (title/font/titleColor/selectedTitleColor/normalBackgroundImage/selectedBackgroundImage)
 * @param normalTitle
 * @param titleFont
 * @param normalTitleColor
 * @param selectedTitleColor
 * @param normalBackgroundImage
 * @param selectedBackgroundImage
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                    selectedTitleColor:(UIColor *)selectedTitleColor
                 normalBackgroundImage:(UIImage *)normalBackgroundImage
               selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                                 frame:(CGRect)frame;

/**
 * init button (title/selectedTitle/font/titleColor/selectedTitleColor/normalBackgroundImage/selectedBackgroundImage)
 * @param normalTitle
 * @param selectedTitle
 * @param titleFont
 * @param normalTitleColor
 * @param selectedTitleColor
 * @param normalBackgroundImage
 * @param selectedBackgroundImage
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                         selectedTitle:(NSString *)selectedTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                    selectedTitleColor:(UIColor *)selectedTitleColor
                 normalBackgroundImage:(UIImage *)normalBackgroundImage
               selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                                 frame:(CGRect)frame;

/**
 * init button (title/font/titleColor/normalBackgroundImage)
 * @param normalTitle
 * @param titleFont
 * @param normalTitleColor
 * @param normalBackgroundImage
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                 normalBackgroundImage:(UIImage *)normalBackgroundImage
                                 frame:(CGRect)frame;


/**
 * init button (title/font/titleColor/selectedTitleColor)
 * @param normalTitle
 * @param titleFont
 * @param normalTitleColor
 * @param selectedTitleColor
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                    selectedTitleColor:(UIColor *)selectedTitleColor
                                 frame:(CGRect)frame;

/**
 * init button (normalBackgroundImage/selectedBackgroundImage)
 * @param normalBackgroundImage
 * @param selectedBackgroundImage
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalBackgroundImage:(UIImage *)normalBackgroundImage
                         selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                                           frame:(CGRect)frame;

/**
 * init button (normalImage/selectedImage)
 * @param normalImage
 * @param selectedImage
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalImage:(UIImage *)normalImage
                         selectedImage:(UIImage *)selectedImage
                                 frame:(CGRect)frame;

 /**
  * init button ????????????
  * @param normalTitle normal ??????
  * @param selectedTitle selected ??????
  * @param titleFont ??????
  * @param normalTitleColor normal ????????????
  * @param selectedTitleColor selected ????????????
  * @param normalImage normal ??????
  * @param selectedImage selected ??????
  * @param normalBackgroundImage normal ?????????
  * @param selectedBackgroundImage selected ?????????
  * @param frame
  * @return
  */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                         selectedTitle:(NSString *)selectedTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                    selectedTitleColor:(UIColor *)selectedTitleColor
                           normalImage:(UIImage *)normalImage
                         selectedImage:(UIImage *)selectedImage
                 normalBackgroundImage:(UIImage *)normalBackgroundImage
               selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                                 frame:(CGRect)frame;


@end

NS_ASSUME_NONNULL_END
