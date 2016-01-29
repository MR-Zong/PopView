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
    // Do any additional setup after loading the view, typically from a nib.
    NSString *message = @"宗根徐宗根徐宗根徐宗根徐宗根徐宗根徐宗根徐宗根徐宗根徐宗根徐宗根徐";
    [ZGPopUpView showMessage:message inView:self.view rect:CGRectMake(100, 100, 100, 100)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
