//
//  NSString+WMPercentEncodingHandle.m
//  CategoryDemo
//
//  Created by Minger on 2020/3/31.
//  Copyright © 2020 Minger. All rights reserved.
//

#import "NSString+WMPercentEncodingHandle.h"

@implementation NSString (WMPercentEncodingHandle)

- (NSString *)simplePercentEncoding {
    
    if (self.length > 0) {
        
        NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
        return [self stringByAddingPercentEncodingWithAllowedCharacters:set];
        
    } else {
        
        return self;
    }
}

- (NSString *)normalPercentEncoding {
    
    if (self.length > 0) {
        
        NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"];
        return [self stringByAddingPercentEncodingWithAllowedCharacters:set];
        
    } else {
        
        return self;
    }
}

- (NSString *)complexPercentEncoding {
    
    if (self.length > 0) {
        
        NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@""];
        return [self stringByAddingPercentEncodingWithAllowedCharacters:set];
        
    } else {
        
        return self;
    }
}

@end
