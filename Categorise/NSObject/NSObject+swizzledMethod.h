//
//  NSObject+swizzledMethod.h
//  AjMall
//
//  Created by Minger on 2019/9/30.
//  Copyright © 2019 Minger. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (swizzledMethod)


// 方法 hook. hook instance object method..
// If we want hook class method,we should through  object_getClass([FOO class]) which is the meta_class  call this method,
+ (void)wm_siwzzleWithOriginalSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL;

@end

NS_ASSUME_NONNULL_END
