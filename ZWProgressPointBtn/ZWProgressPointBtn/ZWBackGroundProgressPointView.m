//
//  ZWBackGroundProgressPointView.m
//  ZWProgressPointBtn
//
//  Created by 流年划过颜夕 on 2019/1/24.
//  Copyright © 2019年 liunianhuaguoyanxi. All rights reserved.
//

#define kScaleW kScreenWidth/375
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kColor(R,G,B,A) [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]

#import "ZWBackGroundProgressPointView.h"

@implementation ZWBackGroundProgressPointView
/*
center：圆心的坐标
radius：半径
startAngle：起始的弧度
endAngle：圆弧结束的弧度
clockwise：YES为顺时针，No为逆时针
方法里面主要是理解startAngle与endAngle，0Pi就是指圆最右边开始计算的，顺时针依次为M_PI/2,M_PI,M_PI*1.5
 */
- (void)drawRect:(CGRect)rect {

    CGFloat startPoint = - M_PI_2 - self.progressRadianSpacing/2;
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path
     addArcWithCenter:CGPointMake(rect.size.width * 0.5, rect.size.width * 0.5)
     radius:self.radius
     startAngle:startPoint
     endAngle:(2 * M_PI) *_progressCount/_totalCount - M_PI_2 - self.progressRadianSpacing/2
     clockwise:1];
    [path setLineWidth:self.progressLineWidth?self.progressLineWidth:5];
    [self.pointColor?self.pointColor:[UIColor yellowColor] set];
    startPoint = (2 * M_PI) *_progressCount/_totalCount - M_PI_2 - self.progressRadianSpacing/2;
    [path stroke];
    [path closePath];
    
    
    if (_progressCount>= _totalCount) {
        
    }else
    {
    UIBezierPath *placeholderPath = [[UIBezierPath alloc] init];
    [placeholderPath
     addArcWithCenter:CGPointMake(rect.size.width * 0.5, rect.size.width * 0.5)
     radius:self.radius
     startAngle:(2 * M_PI) *_progressCount/_totalCount - M_PI_2 + self.progressRadianSpacing/2
     endAngle: - M_PI_2 - self.progressRadianSpacing/2
     clockwise:1];
    [placeholderPath setLineWidth:self.progressLineWidth?self.progressLineWidth:5];
    [self.placeholderColor?self.placeholderColor:[UIColor redColor] set];
    [placeholderPath stroke];
    [placeholderPath closePath];
    }
    
    for (int i= 0; i < _totalCount; i++) {
        UIBezierPath *spacingPath = [[UIBezierPath alloc] init];
        [spacingPath
         addArcWithCenter:CGPointMake(rect.size.width * 0.5, rect.size.width * 0.5)
         radius:self.radius
         startAngle:(2 * M_PI) *i/_totalCount - M_PI_2 - self.progressRadianSpacing/2
         endAngle: (2 * M_PI) *i/_totalCount - M_PI_2 + self.progressRadianSpacing/2
         clockwise:10];
        [spacingPath setLineWidth:self.progressLineWidth?self.progressLineWidth:5];
        
        [self.spacingColor?self.spacingColor:kColor(128, 128, 128, 1) set];
        
        //        startPoint = startPoint + _progressSpacing *  M_PI;
        [spacingPath stroke];
        [spacingPath closePath];
        
        
        
    }

}
@end
