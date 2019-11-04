//
//  UIView+WMFrame.h
//  CategoryDemo
//
//  Created by Minger on 2019/10/18.
//  Copyright © 2019 Minger. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WMFrame)

@property (nonatomic, assign) CGFloat wm_x;
@property (nonatomic, assign) CGFloat wm_y;
@property (nonatomic, assign) CGFloat wm_width;
@property (nonatomic, assign) CGFloat wm_height;

@property (nonatomic, assign) CGFloat wm_top;
@property (nonatomic, assign) CGFloat wm_bottom;
@property (nonatomic, assign) CGFloat wm_left;
@property (nonatomic, assign) CGFloat wm_right;

@property (nonatomic, assign) CGFloat wm_centerX;
@property (nonatomic, assign) CGFloat wm_centerY;

@property (nonatomic, assign) CGPoint wm_origin;
@property (nonatomic, assign) CGSize  wm_size;

@end

NS_ASSUME_NONNULL_END
