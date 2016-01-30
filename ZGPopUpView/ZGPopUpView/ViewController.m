//
//  ViewController.m
//  ZGPopUpView
//
//  Created by Zong on 16/1/28.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ViewController.h"
#import "ZGPopUpView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.\
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor yellowColor];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(300, 100, 50, 30);
    [self.view addSubview:btn];
    
    NSString *message = @"宗根徐宗根徐宗根徐宗根徐宗根徐宗根徐宗根徐宗根徐宗根徐宗根徐宗根徐";
//    [ZGPopUpView showMessage:message inView:self.view rect:CGRectMake(300, 100, 50, 100)];
    [ZGPopUpView showMessage:message inView:self.view rect:btn.frame];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
