//
//  NSString+X.m
//  KKTools
//
//  Created by zving on 2017/9/6.
//  Copyright © 2017年 KK. All rights reserved.
//

#import "NSString+X.h"

@implementation NSString (X)

- (NSString *)replaceSpecialWhitespace{
    NSMutableString *convertedString = [self mutableCopy];
    CFStringTransform((CFMutableStringRef)convertedString, NULL, kCFStringTransformFullwidthHalfwidth, false);
    return [NSString stringWithString:convertedString];
}
- (NSString *)replaceNormalWhiteSpace{
    NSMutableString *convertedString = [self mutableCopy];
    CFStringTransform((CFMutableStringRef)convertedString, NULL, kCFStringTransformHiraganaKatakana, false);
    return [NSString stringWithString:convertedString];
}

- (BOOL)isEmail{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"];
    return [predicate evaluateWithObject:self];
}
- (BOOL)isPhone{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"];
    return [predicate evaluateWithObject:self];
}
- (BOOL)isPostcode{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"[1-9]\\d{5}(?!\\d)"];
    return [predicate evaluateWithObject:self];
}
- (BOOL)isChinese{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"[\u4e00-\u9fa5]"];
    return [predicate evaluateWithObject:self];
}
- (BOOL)isDate{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"^\\d{4}-\\d{1,2}-\\d{1,2}"];
    return [predicate evaluateWithObject:self];
}
@end
