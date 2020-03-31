//
//  NSObject+swizzledMethod.m
//  AjMall
//
//  Created by Minger on 2019/9/30.
//  Copyright © 2019 Minger. All rights reserved.
//

#import "NSObject+swizzledMethod.h"
#import <objc/runtime.h>


@implementation NSObject (swizzledMethod)


+ (void)wm_siwzzleWithOriginalSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL{
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originalSEL);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSEL);
    BOOL didAddMethod = class_addMethod(class,
                                        originalSEL,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSEL,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
    
}
@end
