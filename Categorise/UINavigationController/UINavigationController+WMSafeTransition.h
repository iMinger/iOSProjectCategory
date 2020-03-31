//
//  UINavigationController+SafePushPop.h
//  AjMall
//
//  Created by Minger on 2020/3/30.
//  Copyright © 2020 Minger. All rights reserved.
// 

/**
 这个分类主要是为了 控制器在跳转的转场动画中再一次进行其他转场,造成 Can't add self as subview 的 crash问题.
 
 在这个分类中,方法交换了  UINavigationController 的 push 和 pop 方法, 在其中检测是否已经处在转场动画当中,如果是,则有新的 push 和 pop 方法则不响应,如果不是,则可以进行操作.
 
 我们在其中添加了一个标志位供检测.那么我们需要在合适的时候重置标志位.我们选择了 viewdidappear 中.所以,对其进行方法交换.添加了重置标志位的操作.
 
 这个类是个保护类,不用直接使用.
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (WMSafeTransition)


@end

NS_ASSUME_NONNULL_END
