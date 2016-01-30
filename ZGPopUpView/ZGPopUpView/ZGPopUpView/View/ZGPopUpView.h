//
//  ZGPopUpView.h
//  ZGPopUpView
//
//  Created by Zong on 16/1/28.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ZGPopUpViewMaskStyleTranslucent = 0,
    ZGPopUpViewMaskStyleOpaque,
    ZGPopUpViewMaskStyleNone,
    ZGPopUpViewMaskStyleDefault = ZGPopUpViewMaskStyleTranslucent,
} ZGPopUpViewMaskStyle;

typedef enum : NSUInteger {
    ZGPopUpViewShowAnimationTypeDefault = 0,
    ZGPopUpViewShowAnimationTypeAlpha,
} ZGPopUpViewShowAnimationType;


@class ZGPopUpView;

@protocol ZGPopUpViewDelegate <NSObject>

@optional
- (void)popUpView:(ZGPopUpView*) view didSelectedAtIndex:(NSInteger) index;

- (void)popUpViewWillShow:(ZGPopUpView*) view;
- (void)popUpViewDidShow:(ZGPopUpView *) view;

- (void)popUpViewWillDismiss:(ZGPopUpView*) view;
- (void)popUpViewDidDismissed:(ZGPopUpView *) view;

@end

@interface ZGPopUpView : UIView

@property (nonatomic, strong) UIColor *popUpViewBackgroundColor;
@property (nonatomic, assign) ZGPopUpViewMaskStyle popUpViewMaskStyle;
@property (nonatomic, assign) UIColor *maskViewBackgroundColor;

@property (nonatomic,assign) ZGPopUpViewShowAnimationType showAnimationType;

+ (void)showMessage:(NSString *)message inView:(UIView *)view rect:(CGRect)rect;
+ (void)dismiss;
- (void)dismiss;

@property (nonatomic, weak) id <ZGPopUpViewDelegate> delegate;

@end
