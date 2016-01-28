//
//  ZGTestDrawView.m
//  ZGPopUpView
//
//  Created by Zong on 16/1/28.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ZGTestDrawView.h"

@implementation ZGTestDrawView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context,1,0,0,1);
    CGFloat radius = 15;
    CGFloat cornerRadius = 10;
    CGSize  rectSize = CGSizeMake(200, 30);
    CGFloat rightExtendDistance = 10;
    CGFloat leftExtendDistance = rectSize.width - radius - rightExtendDistance - 2*cornerRadius;
    CGSize arrowSize = CGSizeMake(radius, radius);
    CGPoint startPoint = CGPointMake(250, 300);
    CGPoint leftEndPoint = CGPointMake(startPoint.x - arrowSize.width, startPoint.y + arrowSize.height);
    CGPoint leftMidPoint =CGPointMake(startPoint.x, leftEndPoint.y);
    CGPoint rightEndPoint = CGPointMake(startPoint.x + arrowSize.width, startPoint.y + arrowSize.height);
    CGPoint rightMidPoint =CGPointMake(startPoint.x, rightEndPoint.y);
    
    
    // 箭头左边弧线
    CGContextMoveToPoint(context,startPoint.x,startPoint.y);//圆弧的起始点
    CGContextAddArcToPoint(context, leftMidPoint.x, leftMidPoint.y, leftEndPoint.x, leftEndPoint.y, radius);
    
    // 向左延伸直线
    CGContextAddLineToPoint(context, leftEndPoint.x - leftExtendDistance, leftEndPoint.y);
    
    CGPoint leftCornerPoint = CGPointMake(leftEndPoint.x - leftExtendDistance - cornerRadius, leftEndPoint.y);
    // 左边矩形圆弧corner
    CGContextAddArcToPoint(context, leftCornerPoint.x, leftCornerPoint.y, leftCornerPoint.x, leftCornerPoint.y + cornerRadius, cornerRadius);
    
    // 矩形左边向下延伸
    CGContextAddLineToPoint(context, leftCornerPoint.x, leftCornerPoint.y + cornerRadius + (rectSize.height - 2*cornerRadius));
    
    // 矩形左下角corner
    CGContextAddArcToPoint(context, leftCornerPoint.x, leftCornerPoint.y + rectSize.height, leftCornerPoint.x + cornerRadius, leftCornerPoint.y + rectSize.height, cornerRadius);
    
    
    // 箭头右边弧线
    CGContextMoveToPoint(context,startPoint.x,startPoint.y);//圆弧的起始点
    CGContextAddArcToPoint(context, rightMidPoint.x, rightMidPoint.y, rightEndPoint.x, rightEndPoint.y, radius);
    // 向右延伸直线
    CGContextAddLineToPoint(context, rightEndPoint.x + rightExtendDistance, rightEndPoint.y);

    CGPoint rightCornerPoint = CGPointMake(rightEndPoint.x + rightExtendDistance + cornerRadius, rightEndPoint.y);
    // 右边矩形圆弧corner
    CGContextAddArcToPoint(context, rightCornerPoint.x, rightCornerPoint.y, rightCornerPoint.x, rightCornerPoint.y + cornerRadius, cornerRadius);
    
    // 矩形右边向下延伸
    CGContextAddLineToPoint(context, rightCornerPoint.x, rightCornerPoint.y + cornerRadius + (rectSize.height - 2*cornerRadius));
    
    // 矩形右下角corner
    CGContextAddArcToPoint(context, rightCornerPoint.x, rightCornerPoint.y + rectSize.height, rightCornerPoint.x - cornerRadius, rightCornerPoint.y + rectSize.height, cornerRadius);
    
    // 封闭矩形
    CGContextAddLineToPoint(context, leftCornerPoint.x + cornerRadius, leftCornerPoint.y + rectSize.height);
    
    CGContextStrokePath(context);
}


@end
