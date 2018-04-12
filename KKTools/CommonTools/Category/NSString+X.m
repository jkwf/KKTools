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
- (BOOL)isNull{
    if((NSNull *)self == [NSNull null] || self == nil || self == NULL || [self isEqualToString:@""] || [self isEqualToString:@"NULL"] || [self isEqualToString:@"<NULL>"] || [self isEqualToString:@"null"]  || [self isEqualToString:@"<null>"] || [self length] == 0){
        return YES;
    }
    return NO;
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
- (BOOL)isEnglishOrNumber{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[A-Za-z0-9]"];
    return [predicate evaluateWithObject:self];
}
- (BOOL)isHasChinese{
    NSString *match=@"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

#pragma mark----- 字符串处理
- (NSString*)reverseWords {
    NSMutableString *reverString = [NSMutableString stringWithCapacity:self.length];
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences  usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [reverString appendString:substring];
    }];
    return reverString;
}

- (NSString *)transformToPhonetic {
    //将NSString装换成NSMutableString
    NSMutableString *pinyin = [self mutableCopy];
    //将汉字转换为拼音(带音标)
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    
    //去掉拼音的音标
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    
    //返回最近结果
    return pinyin;
}
- (NSString *)capitalFirstLetter{
    NSString *resultStr;
    if (self && self.length > 0) {
        resultStr = [self stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[self substringToIndex:1] capitalizedString]];
    }
    return resultStr;
}

- (NSString *)deleteAllWhiteSpace{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString *)deleteFirstAndLastWhiteSpace{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}
- (NSString *)deleteMoreTypeWhiteSpace{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\s" options:NSRegularExpressionCaseInsensitive error:nil];
    
    return [regex stringByReplacingMatchesInString:self
                                                options:0
                                                  range:NSMakeRange(0, self.length)
                                           withTemplate:@""];
}
#pragma mark---- json串转字典
- (NSDictionary *)jsonStringToDictionary{
    if (self == nil) {
        return nil;
    }
    
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end
