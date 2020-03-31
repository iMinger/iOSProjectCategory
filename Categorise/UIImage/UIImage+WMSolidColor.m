//
//  UIImage+WMSolidColor.m
//  CategoryDemo
//
//  Created by Minger on 2020/3/31.
//  Copyright © 2020 Minger. All rights reserved.
//

#import "UIImage+WMSolidColor.h"

@implementation UIImage (WMSolidColor)

+ (UIImage *)wm_imageWithSize:(CGSize)size color:(UIColor *)color{
    UIGraphicsBeginImageContextWithOptions(size, 0, [UIScreen mainScreen].scale);
    
    // 颜色填充
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));

    // 从图片上下文中获取 image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭图片上下
    UIGraphicsEndImageContext();
    
    return image;
}

@end
