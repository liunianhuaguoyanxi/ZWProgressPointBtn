//
//  ZWBackGroundProgressPointView.h
//  ZWProgressPointBtn
//
//  Created by 流年划过颜夕 on 2019/1/24.
//  Copyright © 2019年 liunianhuaguoyanxi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWBackGroundProgressPointView : UIButton

@property(assign, nonatomic) CGFloat progressLineWidth;

@property(assign, nonatomic) CGFloat progressRadianSpacing;

@property(assign, nonatomic) NSInteger totalCount;

@property(assign, nonatomic) NSInteger progressCount;

@property(assign, nonatomic) CGFloat radius;

@property (nonatomic, strong) UIColor *pointColor;

@property (nonatomic, strong) UIColor *placeholderColor;

@property (nonatomic, strong) UIColor *spacingColor;
@end

NS_ASSUME_NONNULL_END
