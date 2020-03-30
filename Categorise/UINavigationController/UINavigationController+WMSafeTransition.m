//
//  UINavigationController+SafePushPop.m
//  AjMall
//
//  Created by Minger on 2020/3/30.
//  Copyright © 2020 YouXianMing. All rights reserved.
//

#import "UINavigationController+WMSafeTransition.h"
#import "NSObject+swizzledMethod.h"
#import <objc/runtime.h>

@interface UINavigationController()<UINavigationControllerDelegate>

// 是否正在进行转场动画
@property (nonatomic, assign) BOOL wm_isAnimating;

@end

@implementation UINavigationController (WMSafeTransition)

+ (void) load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self wm_siwzzleWithOriginalSEL:@selector(pushViewController:animated:) withSEL:@selector(wm_safePushViewController:animated:)];
        [self wm_siwzzleWithOriginalSEL:@selector(popViewControllerAnimated:) withSEL:@selector(wm_safePopViewControllerAnimated:)];
        [self wm_siwzzleWithOriginalSEL:@selector(popToViewController:animated:) withSEL:@selector(wm_safePopToViewController:animated:)];
        [self wm_siwzzleWithOriginalSEL:@selector(popToRootViewControllerAnimated:) withSEL:@selector(wm_safePopToRootViewControllerAnimated:)];
    });
}


- (BOOL)wm_isAnimating{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setWm_isAnimating:(BOOL)animating {
    objc_setAssociatedObject(self, @selector(wm_isAnimating), @(animating), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)wm_safePushViewController:(UIViewController *)controller animated:(BOOL)animated{
    
    // 如果当前正在跳转动画中,则不响应跳转时间
    if (self.wm_isAnimating) {
        return;
    }
    
    [self wm_safePushViewController:controller animated:animated];
    if (animated) {
        self.wm_isAnimating = YES;
    }
}

- (UIViewController *)wm_safePopViewControllerAnimated:(BOOL)animated{
    // 如果当前正在跳转动画中,则不响应跳转时间
    if (self.wm_isAnimating) {
        return nil;
    }
    
    if(animated) {
        self.wm_isAnimating = YES;
    }
    
    UIViewController *vc = [self wm_safePopViewControllerAnimated:animated];
    if(vc == nil) {
        self.wm_isAnimating = NO;
    }
    return vc;
}


- (NSArray *)wm_safePopToRootViewControllerAnimated:(BOOL)animated {
    if (self.wm_isAnimating) return nil;
    
    if (animated) {
        
        self.wm_isAnimating = YES;
    }
    
    NSArray *viewControllers = [self wm_safePopToRootViewControllerAnimated:animated];
    
    if (viewControllers.count == 0) {
        
        self.wm_isAnimating = NO;
    }
    
    return viewControllers;
}

- (NSArray *)wm_safePopToViewController:(UIViewController *)controller animated:(BOOL)animated {
    if (self.wm_isAnimating) return nil;
    
    if (animated){
        
        self.wm_isAnimating = YES;
    }
    
    NSArray *viewControllers = [self wm_safePopToViewController:controller animated:animated];
    
    if (viewControllers.count == 0) {
        
        self.wm_isAnimating = NO;
    }
    
    return viewControllers;
}



@end


@implementation UIViewController (WMSafeTransitionLock)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
         // 这里对 viewDidAppear 进行方法交换,因为我们要在这里将标志位重置
        [self wm_siwzzleWithOriginalSEL:@selector(viewDidAppear:) withSEL:@selector(wm_safeViewDidAppear:)];
    });
}

- (void)wm_safeViewDidAppear:(BOOL)animated {
    
    // 重置标志位
    self.navigationController.wm_isAnimating = NO;
    
    [self wm_safeViewDidAppear:animated];
    
}

@end
