//
//  UIButton+ImageTitleStyle.h
//  babyfs
//
//  Created by Minger on 2017/9/26.
//  Copyright © 2017年 Minger. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIButtonImageTitleStyle ) {
    UIButtonImageTitleStyleDefault = 0,       //图片在左，文字在右，整体居中。
    UIButtonImageTitleStyleImageLeftTitleRightTotalCenter  = 1,         //图片在左，文字在右，整体居中。
    UIButtonImageTitleStyleImageRightTitleLeftTotalCenter  = 2,     //图片在右，文字在左，整体居中。
    UIButtonImageTitleStyleImageTopTitleBottomTotalCenter  = 3,          //图片在上，文字在下，整体居中。
    UIButtonImageTitleStyleImageBottomTitleTopTotalCenter  = 4,     //图片在下，文字在上，整体居中。
};

@interface UIButton (ImageTitleStyle)

/*
 调整按钮的文本和image的布局，前提是title和image同时存在才会调整。
 padding是调整布局时整个按钮和图文的间隔。
 
 */
-(void)setUIButtonImageTitleStyle:(UIButtonImageTitleStyle)style padding:(CGFloat)padding;

@end
