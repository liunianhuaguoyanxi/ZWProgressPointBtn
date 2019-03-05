//
//  ZWProgressPointBtn.h
//  ZWProgressPointBtn
//
//  Created by 流年划过颜夕 on 2019/1/24.
//  Copyright © 2019年 liunianhuaguoyanxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWProgressCenterBtn.h"


@interface ZWProgressPointBtn : UIButton



@property(assign, nonatomic) CGFloat progressLineWidth;
/*0-M_PI*/
@property(assign, nonatomic) CGFloat progressRadianSpacing;

@property(assign, nonatomic) NSInteger totalCount;

@property(assign, nonatomic) NSInteger progressCount;

@property (nonatomic, strong) UIColor *pointColor;

@property (nonatomic, strong) UIColor *placeholderColor;

@property (nonatomic, strong) UIColor *spacingColor;

@property (nonatomic, weak)  ZWProgressCenterBtn * centerBtn;

@property(assign, nonatomic) int indexCount;
- (void)reload;

@end


