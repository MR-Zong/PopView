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

@property (nonatomic, weak) UIButton *btn;

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
    self.btn = btn;
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSString *message = @"宗根徐宗根徐宗根徐宗根徐宗徐宗根徐宗徐宗根徐宗徐宗根徐宗徐宗根徐宗徐宗根徐宗";
    //    [ZGPopUpView showMessage:message inView:self.view rect:CGRectMake(300, 100, 50, 100)];
    [ZGPopUpView showMessage:message attributes:@{NSForegroundColorAttributeName : [UIColor yellowColor]} inView:self.view rect:self.btn.frame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

    
}

@end
