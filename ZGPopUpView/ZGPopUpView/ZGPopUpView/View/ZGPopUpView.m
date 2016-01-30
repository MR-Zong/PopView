//
//  ZGPopUpView.m
//  ZGPopUpView
//
//  Created by Zong on 16/1/28.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ZGPopUpView.h"


static CGFloat leftInset = 10;
static CGFloat topInset = 10;
static CGFloat arrowRadius = 15;
static CGFloat cornerRadius = 10;
static CGFloat rightExtendDistance = 10;
static CGFloat popUpViewLeftInset = 3;

@interface ZGPopUpView ()

@property (nonatomic, strong) UIView *maskView;

@property (nonatomic, weak) UIView *popUpView;

@property (nonatomic, weak) UIView *contentView;

@property (nonatomic, strong) UIFont *font;

@end

@implementation ZGPopUpView

+ (void)showMessage:(NSString *)message inView:(UIView *)view rect:(CGRect)rect
{
    
     CGRect textRect = [message boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : self.defaultFont} context:nil];
    
    CGRect contentViewFrame = CGRectMake(leftInset + popUpViewLeftInset, arrowRadius + topInset, textRect.size.width, textRect.size.height);
    
    UILabel *messageLabel = [[UILabel alloc] init];
    messageLabel.numberOfLines = 0;
    messageLabel.text = message;
    messageLabel.frame = textRect;
    messageLabel.font = self.defaultFont;
    messageLabel.textColor = [UIColor grayColor];
    
    CGFloat arrowPointX = rect.origin.x + rect.size.width * 0.5;
    CGFloat arrowPointY = rect.origin.y + rect.size.height;
    
    CGPoint arrowPoint = CGPointMake(arrowPointX, arrowPointY);
    CGFloat popUpViewWidth = contentViewFrame.size.width + 2*(leftInset +popUpViewLeftInset);
    CGFloat popUpViewHeight = contentViewFrame.size.height + arrowRadius + 2 * (topInset) + popUpViewLeftInset;
    
    CGRect popUpViewFrame = CGRectMake(arrowPoint.x - (popUpViewWidth - arrowRadius - rightExtendDistance - cornerRadius  - popUpViewLeftInset) , arrowPoint.y, popUpViewWidth, popUpViewHeight);
    
    ZGPopUpView *popUpView = [[self alloc] initWithFrame:popUpViewFrame];
    popUpView.contentView.frame = contentViewFrame;
    [popUpView.contentView addSubview:messageLabel];
    popUpView.maskView.frame = view.bounds;
    popUpView.maskView.hidden = YES;
    [view addSubview:popUpView.maskView];
    [view addSubview:popUpView];
    
}

+ (UIFont *)defaultFont
{
    return [UIFont systemFontOfSize:15];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}

- (void)awakeFromNib
{
    [self initialize];
}

- (void)initialize
{
    UIView *contentView = [[UIView alloc] init];
    self.contentView = contentView;
    contentView.frame = self.bounds;
    [self addSubview:contentView];
    self.backgroundColor = [UIColor blackColor];
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context,1,0,0,1);
    CGSize  rectSize = CGSizeMake(rect.size.width - 2*popUpViewLeftInset, rect.size.height -arrowRadius - popUpViewLeftInset);
    
    CGFloat leftExtendDistance = rectSize.width  - rightExtendDistance - 2*(cornerRadius + arrowRadius);
    CGSize arrowSize = CGSizeMake(arrowRadius, arrowRadius);
    CGPoint startPoint = CGPointMake((rectSize.width + 2*popUpViewLeftInset) - arrowRadius - rightExtendDistance - cornerRadius - popUpViewLeftInset, 0);
    CGPoint leftEndPoint = CGPointMake(startPoint.x - arrowSize.width, startPoint.y + arrowSize.height);
    
    
    // 箭头左边弧线
    CGContextMoveToPoint(context,startPoint.x,startPoint.y);//圆弧的起始点
    CGContextAddArcToPoint(context, startPoint.x, leftEndPoint.y, leftEndPoint.x, leftEndPoint.y, arrowRadius);
    
    // 向左延伸直线
    CGContextAddLineToPoint(context, leftEndPoint.x - leftExtendDistance, leftEndPoint.y);
    
    CGPoint leftCornerPoint = CGPointMake(leftEndPoint.x - leftExtendDistance - cornerRadius, leftEndPoint.y);
    // 矩形左上角圆弧corner
    CGContextAddArcToPoint(context, leftCornerPoint.x, leftCornerPoint.y, leftCornerPoint.x, leftCornerPoint.y + cornerRadius, cornerRadius);
    
    // 矩形左边向下延伸
    CGContextAddLineToPoint(context, leftCornerPoint.x, leftCornerPoint.y + cornerRadius + (rectSize.height - 2*cornerRadius));
    
    // 矩形左下角corner
    CGContextAddArcToPoint(context, leftCornerPoint.x, leftCornerPoint.y + rectSize.height, leftCornerPoint.x + cornerRadius, leftCornerPoint.y + rectSize.height, cornerRadius);
    
    
    
    CGPoint rightCornerPoint = CGPointMake(startPoint.x + arrowRadius + rightExtendDistance + cornerRadius, leftCornerPoint.y);
    
    // 延伸矩形底边
    CGContextAddLineToPoint(context, rightCornerPoint.x - cornerRadius, rightCornerPoint.y + rectSize.height);
    
    // 矩形右下角
    CGContextAddArcToPoint(context, rightCornerPoint.x, rightCornerPoint.y + rectSize.height, rightCornerPoint.x, rightCornerPoint.y + rectSize.height - cornerRadius, cornerRadius);
    
    // 延伸矩形右边线
    CGContextAddLineToPoint(context, rightCornerPoint.x, rightCornerPoint.y + cornerRadius);
    
    // 矩形右上角
    CGContextAddArcToPoint(context, rightCornerPoint.x, rightCornerPoint.y, rightCornerPoint.x - cornerRadius, rightCornerPoint.y, cornerRadius);
    
    // 延伸arrow右边延伸
    CGContextAddLineToPoint(context, rightCornerPoint.x - cornerRadius - rightExtendDistance, rightCornerPoint.y);
    
    // arrow右边弧形
    CGContextAddArcToPoint(context, startPoint.x , rightCornerPoint.y, startPoint.x, startPoint.y, arrowRadius);

    // 封闭矩形
    CGContextClosePath(context);
    
//    CGContextClip(context);
//    CGContextStrokePath(context);
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextDrawPath(context, kCGPathEOFillStroke);

    
}


#pragma mark - lazyLoad
- (UIView *)maskView
{
    if (!_maskView) {
        _maskView = [[UIView alloc] init];
        _maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }
    return _maskView;
}

@end
