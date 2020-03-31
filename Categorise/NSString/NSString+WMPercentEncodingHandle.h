//
//  NSString+WMPercentEncodingHandle.h
//  CategoryDemo
//
//  Created by Minger on 2020/3/31.
//  Copyright © 2020 Minger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WMPercentEncodingHandle)

/// 系统的PercentEncoding(简单模式,不建议使用,因为我们使用这种方式编码之后,将其作为一个参数再拼接到一个 URL上,这个时候解析就有问题了)
- (NSString *)simplePercentEncoding;

/// 除了字母与数字不编码,其他的都编码(普通模式)
- (NSString *)normalPercentEncoding;

/// 所有字符串都编码(复杂模式)
- (NSString *)complexPercentEncoding;

@end
