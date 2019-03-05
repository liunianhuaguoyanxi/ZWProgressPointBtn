//
//  ViewController.m
//  ZWProgressPointBtn
//
//  Created by 流年划过颜夕 on 2019/1/24.
//  Copyright © 2019年 liunianhuaguoyanxi. All rights reserved.
//

#import "ViewController.h"
#import "FirstDemoController.h"
#import "SecondeDemoController.h"
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * skillPointbBtn = [UIButton buttonWithType:0];
    skillPointbBtn.frame = CGRectMake((self.view.frame.size.width - 100)/2, self.view.frame.size.height/2-150, 100, 100);
    skillPointbBtn.tintColor = [UIColor whiteColor];
    skillPointbBtn.backgroundColor = RGBCOLOR(44, 197, 180);
    [skillPointbBtn setTitle:@"技能点" forState:UIControlStateNormal];
    [skillPointbBtn addTarget:self action:@selector(clickToFirstDemo) forControlEvents:UIControlEventTouchUpInside];
    skillPointbBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    skillPointbBtn.layer.cornerRadius = 50;
    skillPointbBtn.layer.masksToBounds =YES;
    [self.view addSubview:skillPointbBtn];

    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * statusIndicatorBtn = [UIButton buttonWithType:0];
    statusIndicatorBtn.frame = CGRectMake((self.view.frame.size.width - 100)/2, self.view.frame.size.height/2+75,100, 100);
    statusIndicatorBtn.tintColor = [UIColor whiteColor];
    statusIndicatorBtn.backgroundColor = RGBCOLOR(44, 197, 180);
    [statusIndicatorBtn setTitle:@"状态指示器" forState:UIControlStateNormal];
    [statusIndicatorBtn addTarget:self action:@selector(clickToSecondeDemo) forControlEvents:UIControlEventTouchUpInside];
    statusIndicatorBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    statusIndicatorBtn.layer.cornerRadius = 50;
    statusIndicatorBtn.layer.masksToBounds =YES;
    [self.view addSubview:statusIndicatorBtn];

}

- (void)clickToFirstDemo
{
    [self.navigationController pushViewController:[[FirstDemoController alloc]init] animated:YES];
}

- (void)clickToSecondeDemo
{
     [self.navigationController pushViewController:[[SecondeDemoController alloc]init] animated:YES];
}
@end
