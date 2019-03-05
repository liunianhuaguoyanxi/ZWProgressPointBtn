//
//  FirstDemoController.m
//  ZWProgressPointBtn
//
//  Created by 流年划过颜夕 on 2019/3/5.
//  Copyright © 2019年 liunianhuaguoyanxi. All rights reserved.
//

#import "FirstDemoController.h"
#import "ZWProgressPointBtn.h"
#import "math.h"
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
@interface FirstDemoController ()
@property (nonatomic, weak) ZWProgressPointBtn *progressView1;
@property (nonatomic, weak) ZWProgressPointBtn *progressView2;
@property (nonatomic, weak) ZWProgressPointBtn *progressView3;
@property (nonatomic, weak) ZWProgressPointBtn *progressView4;
@end

@implementation FirstDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    ZWProgressPointBtn *progressView1 = [[ZWProgressPointBtn alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 90)/2, self.view.frame.size.height/2-165, 90  , 90)];
    progressView1.indexCount=0;
    [self.view addSubview:progressView1];
    progressView1.progressLineWidth = 5;
    progressView1.progressRadianSpacing = 0.02;
    progressView1.totalCount = 6;
    progressView1.progressCount = 3;
    progressView1.pointColor = RGBCOLOR(238, 188, 90);
    [progressView1.centerBtn setImage:[UIImage imageNamed:@"1"] forState:0];
    [progressView1.centerBtn addTarget:self action:@selector(clickToDo:) forControlEvents:UIControlEventTouchUpInside];
    self.progressView1 = progressView1;
    
    ZWProgressPointBtn *progressView2 = [[ZWProgressPointBtn alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 90)/2, self.view.frame.size.height/2-55, 90  , 90)];
    progressView2.indexCount=1;
    [self.view addSubview:progressView2];
    progressView2.progressLineWidth = 5;
    progressView2.progressRadianSpacing = 0.02;
    progressView2.totalCount = 6;
    progressView2.progressCount = 1;
    progressView2.pointColor = RGBCOLOR(238, 188, 90);
    [progressView2.centerBtn setImage:[UIImage imageNamed:@"2"] forState:0];
    [progressView2.centerBtn addTarget:self action:@selector(clickToDo:) forControlEvents:UIControlEventTouchUpInside];
    self.progressView2 = progressView2;
    
    ZWProgressPointBtn *progressView3 = [[ZWProgressPointBtn alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 90)/2, self.view.frame.size.height/2+55, 90  , 90)];
    progressView3.indexCount=2;
    [self.view addSubview:progressView3];
    progressView3.progressLineWidth = 5;
    progressView3.progressRadianSpacing = 0.02;
    progressView3.totalCount = 6;
    progressView3.progressCount = 1;
    progressView3.pointColor = RGBCOLOR(238, 188, 90);
    [progressView3.centerBtn setImage:[UIImage imageNamed:@"3"] forState:0];
    [progressView3.centerBtn addTarget:self action:@selector(clickToDo:) forControlEvents:UIControlEventTouchUpInside];
    self.progressView3 = progressView3;
    
    ZWProgressPointBtn *progressView4 = [[ZWProgressPointBtn alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 90)/2, self.view.frame.size.height/2+165, 90  , 90)];
    progressView4.indexCount=3;
    [self.view addSubview:progressView4];
    progressView4.progressLineWidth = 5;
    progressView4.progressRadianSpacing = 0.02;
    progressView4.totalCount = 6;
    progressView4.progressCount = 1;
    progressView4.pointColor = RGBCOLOR(238, 188, 90);
    [progressView4.centerBtn setImage:[UIImage imageNamed:@"4"] forState:0];
    [progressView4.centerBtn addTarget:self action:@selector(clickToDo:) forControlEvents:UIControlEventTouchUpInside];
    self.progressView4 = progressView4;
}

-(void)clickToDo:(ZWProgressCenterBtn *)sender
{
    
    switch (sender.indexCount) {
        case 0:
            self.progressView1.progressCount++;
            if (self.progressView1.progressCount>6) {
                self.progressView1.progressCount =0;
                
                
            }
            [self.progressView1 reload];
            break;
            
        case 1:
            self.progressView2.progressCount++;
            if (self.progressView2.progressCount>6) {
                self.progressView2.progressCount =0;
                
                
            }
            [self.progressView2 reload];
            break;
        case 2:
            self.progressView3.progressCount++;
            if (self.progressView3.progressCount>6) {
                self.progressView3.progressCount =0;
                
                
            }
            [self.progressView3 reload];
            break;
        case 3:
            self.progressView4.progressCount++;
            if (self.progressView4.progressCount>6) {
                self.progressView4.progressCount =0;
                
                
            }
            [self.progressView4 reload];
            break;
    }
    
    
    
    
}

@end
