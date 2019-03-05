//
//  ZWProgressPointBtn.m
//  ZWProgressPointBtn
//
//  Created by 流年划过颜夕 on 2019/1/24.
//  Copyright © 2019年 liunianhuaguoyanxi. All rights reserved.
//

#import "ZWProgressPointBtn.h"
#import "ZWBackGroundProgressPointView.h"

@interface ZWProgressPointBtn()

@property (nonatomic, weak) ZWBackGroundProgressPointView *progressView;

@end

@implementation ZWProgressPointBtn

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius=self.frame.size.width/2;
        self.layer.masksToBounds = YES;
        self.layer.shouldRasterize = YES;
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
        
        ZWProgressCenterBtn *centerBtn = [[ZWProgressCenterBtn alloc]initWithFrame:CGRectMake(self.progressLineWidth + self.progressLineWidth/2, self.progressLineWidth + self.progressLineWidth/2, self.frame.size.width-self.progressLineWidth*2 - self.progressLineWidth*2, self.frame.size.height-self.progressLineWidth*2 - self.progressLineWidth*2)];
        [self addSubview:centerBtn];
        self.centerBtn = centerBtn;
    }
    return self;
}
-(void)layoutSubviews
{

    
    if (self.centerBtn) {
        self.centerBtn.frame = CGRectMake(self.progressLineWidth + self.progressLineWidth/2, self.progressLineWidth + self.progressLineWidth/2, self.frame.size.width-self.progressLineWidth*2 - self.progressLineWidth, self.frame.size.height-self.progressLineWidth*2 - self.progressLineWidth);
        self.centerBtn.layer.cornerRadius = self.centerBtn.frame.size.width /2;
        self.centerBtn.layer.masksToBounds = YES;
        self.centerBtn.layer.shouldRasterize = YES;
        self.centerBtn.layer.rasterizationScale = [UIScreen mainScreen].scale;
    }

    if (self.progressView) {
        [self.progressView removeFromSuperview];
    }
    ZWBackGroundProgressPointView *progressView = [[ZWBackGroundProgressPointView alloc]init];
    progressView.frame=CGRectMake(0, 0, self.frame.size.width , self.frame.size.height);
    progressView.backgroundColor = [UIColor clearColor];
    progressView.progressRadianSpacing = self.progressRadianSpacing ;
    progressView.totalCount = self.totalCount;
    progressView.progressCount = self.progressCount;
    progressView.progressLineWidth = self.progressLineWidth;
    progressView.radius = self.frame.size.width/2-self.progressLineWidth;
    progressView.pointColor = self.pointColor;
    progressView.placeholderColor = self.placeholderColor;
    progressView.spacingColor = self.spacingColor;
    progressView.userInteractionEnabled = YES;
    [progressView setNeedsDisplay];
    [progressView addTarget:self action:@selector(clickToDo1) forControlEvents:UIControlEventTouchUpInside];

    self.progressView = progressView;
    [self addSubview:progressView];
    
    [self bringSubviewToFront:self.centerBtn];
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    [super hitTest:point withEvent:event];
    
    
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    CGFloat raidus = self.progressView.frame.size.height >= self.progressView.frame.size.width ?self.progressView.frame.size.width/2 :self.progressView.frame.size.width/2;

        //传入中心点 实时点击点 与半径判断 点击点是否在半径区域内
    BOOL pointInRound =[self touchPointInsideCircle:center radius:raidus targetPoint:point];
    
    if (pointInRound) {
        if (self.centerBtn) {
            self.centerBtn.indexCount = self.indexCount;
            return self.centerBtn;
        } else {
            return  nil;
        }
        
    }else
    {

        return  nil;
    }

    
    return self;
    
    
}


//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    [super hitTest:point withEvent:event];
//
//
//
//    if (CGRectContainsPoint(self.progressView.frame, point)) {
//    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
//        CGFloat raidus = self.centerBtn.frame.size.height >= self.centerBtn.frame.size.width ?self.centerBtn.frame.size.width/2 :self.centerBtn.frame.size.width/2;
        
        //传入中心点 实时点击点 与半径判断 点击点是否在半径区域内
//        BOOL pointInRound =[self touchPointInsideCircle:center radius:raidus targetPoint:point];
//
//        if (pointInRound) {
//            if (self.centerBtn) {
//                return self.centerBtn;
//            } else {
//                return  nil;
//            }
//
//        }else
//        {
//            if (self.progressView) {
//                return self.progressView;
//            } else {
//                return  nil;
//            }
//        }
//        if (self.centerBtn) {
//            return self.centerBtn;
//        } else {
//            return  nil;
//        }
//    }else{
//        return nil;
//    }
//
//    return self;
//
//
//}
- (void)reload
{
    [self layoutSubviews];
}

//用来判断 圆形点击区域
- (BOOL)touchPointInsideCircle:(CGPoint)center radius:(CGFloat)radius targetPoint:(CGPoint)point
{
    CGFloat dist = sqrtf((point.x - center.x) * (point.x - center.x) +
                         (point.y - center.y) * (point.y - center.y));
    return (dist <= radius);
}

-(void)clickToDo1
{
    
    NSLog(@"123123123");
    
}
@end
