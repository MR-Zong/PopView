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

/** 容器视图 */
@property (nonatomic, weak) UIView *contentView;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) UIColor *popUpViewBackgroundColor;
@property (nonatomic, assign) ZGPopUpViewMaskStyle popUpViewMaskStyle;
@property (nonatomic, assign) UIColor *maskViewBackgroundColor;

@property (nonatomic,assign) ZGPopUpViewShowAnimationType showAnimationType;

/** 显示气泡: 便利于显示文字，自动适配文字长度 
 *  @param view 父视图
 *  @param rect 气泡尖角指向的矩形
 */
+ (void)showMessage:(NSString *)message inView:(UIView *)view rect:(CGRect)rect;
/** 显示气泡：特别注意：用此方法步骤：
 *  1，你要自己把想显示的内容都添加到contentView
 *  2，然后设置contentView的frame
 *  3，最后才能调用showInView:rect:
 *  4, 样例参照showMessage:inView:rect:
 *  @param view 父视图
 *  @param rect 气泡尖角指向的矩形
 */
- (void)showInView:(UIView *)view rect:(CGRect)rect;

/** 隐藏气泡 */
+ (void)dismiss;
- (void)dismiss;

@property (nonatomic, weak) id <ZGPopUpViewDelegate> delegate;

@end
