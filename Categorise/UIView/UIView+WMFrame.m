//
//  UIView+WMFrame.m
//  CategoryDemo
//
//  Created by Minger on 2019/10/18.
//  Copyright © 2019 Minger. All rights reserved.
//

#import "UIView+WMFrame.h"

@implementation UIView (WMFrame)

- (CGFloat)wm_x {
    return self.frame.origin.x;
}

- (void)setWm_x:(CGFloat)wm_x {
    CGRect newFrame = self.frame;
    newFrame.origin.x = wm_x;
    self.frame = newFrame;
}

- (CGFloat)wm_y {
    return self.frame.origin.y;
}

- (void)setWm_y:(CGFloat)wm_y {
    CGRect newFrame = self.frame;
    newFrame.origin.y = wm_y;
    self.frame = newFrame;
}

- (CGFloat)wm_width {
    return CGRectGetWidth(self.bounds);
}

- (void)setWm_width:(CGFloat)wm_width {
    CGRect newFrame = self.frame;
    newFrame.size.width = wm_width;
    self.frame = newFrame;
}

- (CGFloat)wm_height {
    return CGRectGetHeight(self.bounds);
}

- (void)setWm_height:(CGFloat)wm_height {
    CGRect newFrame = self.frame;
    newFrame.size.height = wm_height;
    self.frame = newFrame;
}

- (CGFloat)wm_top {
    return self.frame.origin.y;
}

- (void)setWm_top:(CGFloat)wm_top {
    CGRect newFrame = self.frame;
    newFrame.origin.y = wm_top;
    self.frame = newFrame;
}


- (CGFloat)wm_bottom {
    
    // bottom 代表的意义为 底部的frame值.
    return CGRectGetMaxY(self.frame);
}

- (void)setWm_bottom:(CGFloat)wm_bottom {
    CGRect newFrame = self.frame;
    newFrame.origin.y = wm_bottom - self.frame.size.height;
    self.frame = newFrame;
}

- (CGFloat)wm_left {
    return self.frame.origin.x;
}

- (void)setWm_left:(CGFloat)wm_left {
    CGRect newFrame = self.frame;
    newFrame.origin.x = wm_left;
    self.frame = newFrame;
}

- (CGFloat)wm_right {
    return CGRectGetMaxX(self.frame);
}

- (void)setWm_right:(CGFloat)wm_right {
    CGRect newFrame = self.frame;
    newFrame.origin.x = wm_right - self.frame.size.width;
    self.frame = newFrame;
}

- (CGFloat)wm_centerX {
    return self.center.x;
}

- (void)setWm_centerX:(CGFloat)wm_centerX {
    CGPoint newCenter = self.center;
    newCenter.x = wm_centerX;
    self.center = newCenter;
}

- (CGFloat)wm_centerY {
    return self.center.y;
}

- (void)setWm_centerY:(CGFloat)wm_centerY {
    CGPoint newCenter = self.center;
    newCenter.y = wm_centerY;
    self.center = newCenter;
}

- (CGPoint)wm_origin {
    return self.frame.origin;
}

- (void)setWm_origin:(CGPoint)wm_origin {
    CGRect newFrame = self.frame;
    newFrame.origin = wm_origin;
    self.frame = newFrame;
}

- (CGSize)wm_size {
    return self.frame.size;
}

- (void)setWm_size:(CGSize)wm_size {
    CGRect newFrame = self.frame;
    newFrame.size = wm_size;
    self.frame = newFrame;
}

@end
