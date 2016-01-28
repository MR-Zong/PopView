//
//  ZGPopUpView.m
//  ZGPopUpView
//
//  Created by Zong on 16/1/28.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ZGPopUpView.h"

@interface ZGPopUpView ()

@property (nonatomic, weak) UIView *maskView;

@property (nonatomic, weak) UIView *popUpView;

@property (nonatomic, weak) UIView *contentView;

@property (nonatomic, strong) UIFont *font;

@end

@implementation ZGPopUpView

+ (void)showMessage:(NSString *)message inView:(UIView *)view rect:(CGRect)rect
{
    
//     CGRect textRect = [message boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : popUpView.font} context:nil];
//    
//    CGRect contentViewFrame = CGRectInset(textRect, -10, -10);
//    
//    ZGPopUpView *popUpView = [[self alloc] initWithFrame:contentViewFrame];
//    
//    
//    [view addSubview:popUpView.maskView];
//    
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
    }
    return self;
}

@end
