//
//  SecondeDemoController.m
//  ZWProgressPointBtn
//
//  Created by 流年划过颜夕 on 2019/3/5.
//  Copyright © 2019年 liunianhuaguoyanxi. All rights reserved.
//

#import "SecondeDemoController.h"
#import "ZWProgressPointBtn.h"
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

@interface SecondeDemoController () <UITextFieldDelegate>
@property (nonatomic, weak) ZWProgressPointBtn *progressView1;
@property (nonatomic, weak) UITextField *nameField;
@property (nonatomic, weak) UITextField *phonefield;
@property (nonatomic, weak) UITextField *emailfield;
@end

@implementation SecondeDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    ZWProgressPointBtn *progressView1 = [[ZWProgressPointBtn alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 70)/2, 130, 75  , 75)];
    progressView1.indexCount=0;
    [self.view addSubview:progressView1];
    progressView1.progressLineWidth = 5;
    progressView1.progressRadianSpacing = 0.02;
    progressView1.totalCount = 3;
    progressView1.progressCount = 0;
    progressView1.pointColor = RGBCOLOR(238, 188, 90);
    progressView1.placeholderColor = [UIColor grayColor];
    progressView1.centerBtn.backgroundColor = [UIColor lightGrayColor];
    progressView1.centerBtn.titleLabel.numberOfLines = 0;
    [progressView1.centerBtn setTitle:@"信息完善" forState:0];
    [progressView1.centerBtn setTitleColor:[UIColor whiteColor] forState:0];
    [progressView1.centerBtn addTarget:self action:@selector(clickToCheck:) forControlEvents:UIControlEventTouchUpInside];
    self.progressView1 = progressView1;
    
    UITextField *nameField = [[UITextField alloc]initWithFrame:CGRectMake((self.view.frame.size.width-250)/2, 230, 250, 40)];
    nameField.placeholder = @"  姓名/Name";
    nameField.text = @"张三";
    nameField.layer.cornerRadius = 5;
    nameField.layer.masksToBounds = YES;
    nameField.backgroundColor = [UIColor lightGrayColor];
    nameField.delegate = self;
    [self.view addSubview:nameField];
    self.nameField =nameField;
    
    UITextField *phonefield = [[UITextField alloc]initWithFrame:CGRectMake((self.view.frame.size.width-250)/2, 290, 250, 40)];
    phonefield.placeholder = @"  手机号/Phone";
    phonefield.layer.cornerRadius = 5;
    phonefield.layer.masksToBounds = YES;
    phonefield.backgroundColor = [UIColor lightGrayColor];
    phonefield.keyboardType =  UIKeyboardTypeNumberPad;
    phonefield.delegate = self;
    [self.view addSubview:phonefield];
    self.phonefield =phonefield;
    
    UITextField *emailfield = [[UITextField alloc]initWithFrame:CGRectMake((self.view.frame.size.width-250)/2, 350, 250, 40)];
    emailfield.placeholder = @"  邮箱/Email";
    emailfield.layer.cornerRadius = 5;
    emailfield.layer.masksToBounds = YES;
    emailfield.keyboardType =  UIKeyboardTypeEmailAddress;
    emailfield.backgroundColor = [UIColor lightGrayColor];
    emailfield.delegate = self;
    [self.view addSubview:emailfield];
    self.emailfield = emailfield;
    
    UIButton * completedBtn = [UIButton buttonWithType:0];
    completedBtn.frame = CGRectMake((self.view.frame.size.width-250)/2, 410, 250, 40);
    completedBtn.tintColor = [UIColor whiteColor];
    completedBtn.backgroundColor = RGBCOLOR(44, 197, 180);
    [completedBtn setTitle:@"完成" forState:UIControlStateNormal];
    [completedBtn addTarget:self action:@selector(clickToDo:) forControlEvents:UIControlEventTouchUpInside];
    completedBtn.layer.cornerRadius = 5;
    completedBtn.layer.masksToBounds =YES;
    [self.view addSubview:completedBtn];
    
    [self checkInfoCompleted];

}
- (void)clickToCheck:(ZWProgressPointBtn *)sender
{
    self.progressView1.progressCount = 0;
    if (self.nameField.hasText) {
        self.progressView1.progressCount ++;
    }
    if (self.phonefield.hasText) {
        self.progressView1.progressCount ++;
    }
    if (self.emailfield.hasText) {
        self.progressView1.progressCount ++;
    }
    if (self.nameField.hasText||self.phonefield.hasText||self.emailfield.hasText) {
        [self.progressView1 reload];
    }
}

- (void)clickToDo:(UIButton *)sender
{
    if ([self checkInfoCompleted]) {
        UIAlertController * con = [UIAlertController alertControllerWithTitle:nil message:@"提交成功" preferredStyle:UIAlertControllerStyleAlert];
        [con addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];;
        [self presentViewController:con animated:YES completion:nil];
    }else{
            UIAlertController * con = [UIAlertController alertControllerWithTitle:nil message:@"请完成填写" preferredStyle:UIAlertControllerStyleAlert];
            [con addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }]];;
            [self presentViewController:con animated:YES completion:nil];
    }
}

//=================================================================
//                       UITextFieldDelegate
//=================================================================
#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self checkInfoCompleted];
}

- (BOOL)checkInfoCompleted
{
    self.progressView1.progressCount = 0;
    if (self.nameField.hasText) {
        self.progressView1.progressCount ++;
    }
    if (self.phonefield.hasText) {
        self.progressView1.progressCount ++;
    }
    if (self.emailfield.hasText) {
        self.progressView1.progressCount ++;
    }

    [self.progressView1 reload];

    
    if (self.nameField.hasText&&self.phonefield.hasText&&self.emailfield.hasText) {
        return YES;
    }else
    {
       return NO;
    }
}
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    self.progressView1.progressCount = 0;
//    if (self.nameField.hasText) {
//        self.progressView1.progressCount ++;
//    }
//    if (self.phonefield.hasText) {
//        self.progressView1.progressCount ++;
//    }
//    if (self.emailfield.hasText) {
//        self.progressView1.progressCount ++;
//    }
//    if (self.nameField.hasText||self.phonefield.hasText||self.emailfield.hasText) {
//       [self.progressView1 reload];
//    }
//
//    return YES;
//}
@end
