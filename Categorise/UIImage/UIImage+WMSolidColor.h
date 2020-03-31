//
//  UIImage+WMSolidColor.h
//  CategoryDemo
//
//  Created by Minger on 2020/3/31.
//  Copyright © 2020 Minger. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (WMSolidColor)

+ (UIImage *)wm_imageWithSize:(CGSize)size color:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
