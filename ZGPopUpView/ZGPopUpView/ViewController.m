//
//  ViewController.m
//  ZGPopUpView
//
//  Created by Zong on 16/1/28.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ViewController.h"
#import "ZGPopUpView.h"
#import "ZGTestDrawView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *message = @"块过年了，好像回家";
//    [ZGPopUpView showMessage:message inView:self.view rect:CGRectMake(100, 100, 100, 100)];
    
    ZGTestDrawView *drawView = [[ZGTestDrawView alloc] init];
    drawView.frame = self.view.bounds;
    
    [self.view addSubview:drawView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
