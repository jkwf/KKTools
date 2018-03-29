//
//  NSArray+Value.m
//  KKTools
//
//  Created by zving on 2017/6/29.
//  Copyright © 2017年 KK. All rights reserved.
//

#import "NSArray+Value.h"

@implementation NSArray (Value)

- (CGFloat)maxValue{
    return [[self valueForKeyPath:@"@max.floatValue"] floatValue];
}
- (CGFloat)minValue{
    return [[self valueForKeyPath:@"@min.floatValue"] floatValue];
}
- (CGFloat)sumValue{
    return [[self valueForKeyPath:@"@sum.floatValue"] floatValue];
}
- (CGFloat)averageValue{
    return [[self valueForKeyPath:@"@avg.floatValue"] floatValue];
}
- (NSArray *)deleteRecurElement{
    return [self valueForKeyPath:@"@distinctUnionOfObjects.self"];
}
- (NSArray *)getRidOf{
    NSSet *set = [NSSet setWithArray:self];
    return set.allObjects;
}
- (NSArray *)getAscendRidOf{
    NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:self];
    return set.array;
}
- (void)sequence{
    [self sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 intValue] > [obj2 intValue]) {
            return NSOrderedDescending;
        }else{
            return NSOrderedAscending;
        }
    }];
}
@end
