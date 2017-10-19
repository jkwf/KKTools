//
//  KKLabel.h
//  KKTools
//
//  Created by zving on 2017/7/13.
//  Copyright © 2017年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, TextAlignmentType) {
    TextAlignmentTypeLeftTop,
    TextAlignmentTypeRightTop,
    TextAlignmentTypeLeftBottom,
    TextAlignmentTypeRightBottom,
    TextAlignmentTypeTopCenter,
    TextAlignmentTypeBottomCenter,
    TextAlignmentTypeLeft,
    TextAlignmentTypeRight,
    TextAlignmentTypeCenter,
};
@interface KKLabel : UILabel
@property (nonatomic, assign)IBInspectable TextAlignmentType textAlignmentType;
@end
