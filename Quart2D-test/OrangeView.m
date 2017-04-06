//
//  OrangeView.m
//  Quart2D-test
//
//  Created by 孙亚锋 on 2017/4/6.
//  Copyright © 2017年 yafeng.sun. All rights reserved.
//  

#import "OrangeView.h"
#define Width  200.0
#define Height 200.0

@implementation OrangeView
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [ super initWithFrame:frame]) {
        
        [self setNeedsDisplay];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self drawBody]; //画身体
    [self drawEyes]; //画眼睛
    [self drawMouth];//画嘴
    [self drawHair]; //画头发
    [self drawJeans];//画裤子
    // 画手
   
}
-(void)drawBody{
    //1.获取图形上下文
    CGContextRef  context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    //2.画图
    CGFloat radius = Width /2;
    CGFloat upcircleX = self.frame.size.width / 2;
    CGFloat upCircleY = self.frame.size.height/2 - Height/2;
    //画上半圆弧
    CGContextAddArc(context, upcircleX, upCircleY, radius, 0, M_PI, 1);
    //画线
    CGFloat midleX = upcircleX - radius;
    CGFloat midleY = upCircleY + Height;
    CGContextAddLineToPoint(context, midleX, midleY);
    //画下半圆弧
    CGFloat downCircleX = upcircleX;
    CGFloat downCircleY = midleY;
    CGContextAddArc(context, downCircleX, downCircleY, radius, M_PI, M_PI*2, 1);
    //3.关闭
    CGContextClosePath(context);
    
    //设置身体颜色
    [[UIColor colorWithRed:254/255.0 green:202/255.0 blue:22/255.0 alpha:0.7]set];
    
    //4.渲染
    CGContextFillPath(context);
    //恢复图形上下文的状态
    CGContextRestoreGState(context);
    
    
}
-(void)drawMouth{
    // 1.获得图形上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ref);
    
    // 2.画图
    //嘴宽
    CGFloat mouthWidth = 90;
    //嘴角与控制点在垂直方法上的 闹中间隔
    
    CGFloat space = 30;
    CGFloat mouthCpX = self.frame.size.width / 2.0;
    CGFloat mouthCpY = self.frame.size.height / 2.0 ;
    CGFloat mouthLeftX = mouthCpX - mouthWidth / 2.0;
    CGFloat mouthLeftY = mouthCpY - space ;
    CGFloat mouthRightX = mouthCpX + mouthWidth / 2.0;
    CGFloat mouthRightY = mouthLeftY ;
    //设置初始点
    CGContextMoveToPoint(ref, mouthLeftX, mouthLeftY);
    //画曲线
    CGContextAddQuadCurveToPoint(ref, mouthCpX, mouthCpY, mouthRightX, mouthRightY);
    //设置线宽
    CGContextSetLineWidth(ref, 10);
    //设置颜色
    [[UIColor colorWithRed:0.4 green:0.6 blue:0.7 alpha:0.7]set];
    
    //3.渲染
    CGContextStrokePath(ref);
    CGContextRestoreGState(ref);
    
    
}
/**
 *  画头发
 */
- (void)drawHair{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    // 头发X坐标的间隔
    CGFloat space = 30;
    // 头发长度
    CGFloat hairLen = 50;
    
    CGFloat hair1X = self.frame.size.width * 0.5 - space;
    CGFloat hair1Y = self.frame.size.height * 0.5 - Height * 0.5 - Width * 0.4;
    // 设置第1根毛的初始位置
    CGContextMoveToPoint(context, hair1X, hair1Y);
    // 画第1根毛曲线
    CGFloat cp1X = hair1X + space;
    CGFloat cp1Y = hair1Y - hairLen * 0.25 ;
    CGFloat cp2X = hair1X - space ;
    CGFloat cp2Y = hair1Y - hairLen * 0.75 ;
    CGContextAddCurveToPoint(context, cp1X, cp1Y, cp2X, cp2Y, hair1X, hair1Y - hairLen);
    
    
    CGFloat hair2X = self.frame.size.width * 0.5 ;
    CGFloat hair2Y = hair1Y;
    // 设置第2根毛的初始位置
    CGContextMoveToPoint(context, hair2X, hair2Y);
    // 画第2根毛曲线
    cp1X = hair2X + space;
    cp1Y = hair2Y - hairLen * 0.25 ;
    cp2X = hair2X - space ;
    cp2Y = hair2Y - hairLen * 0.75 ;
    CGContextAddCurveToPoint(context, cp1X, cp1Y, cp2X, cp2Y, hair2X, hair2Y - hairLen);
    
    CGFloat hair3X = self.frame.size.width * 0.5 + space;
    CGFloat hair3Y = hair2Y;
    // 设置第3根毛的初始位置
    CGContextMoveToPoint(context, hair3X, hair3Y);
    // 画第3根毛曲线
    cp1X = hair3X + space;
    cp1Y = hair3Y - hairLen * 0.25 ;
    cp2X = hair3X - space ;
    cp2Y = hair3Y - hairLen * 0.75 ;
    CGContextAddCurveToPoint(context, cp1X, cp1Y, cp2X, cp2Y, hair3X, hair3Y - hairLen);
    
    // 设置线宽
    CGContextSetLineWidth(context, 5);
    
    // 渲染
    CGContextStrokePath(context);
    
    // 恢复上下文
    CGContextRestoreGState(context);
}
/**
 *  画裤子
 */
- (void)drawJeans{
    // 取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    // 画裤子
    int kSegment = 4; // 库子总片数 = kSegment +1
    CGFloat add = Width / (kSegment*2) ;
    CGFloat pointX = self.frame.size.width * 0.5 - Width * 0.5;
    CGFloat pointY = self.frame.size.height * 0.5 + Height * 0.5;
    // 设置初始点
    CGContextMoveToPoint(context, pointX, pointY);
    // 画一个控制点的曲线
    CGContextAddQuadCurveToPoint(context, pointX - 20, pointY + Width * 0.25,  pointX, pointY + Width * 0.5);
    //    CGContextAddLineToPoint(context, pointX, pointY + Width * 0.5);
    for (int i = 1; i <= kSegment * 2; i++) {
        CGFloat x , y;
        x = pointX + i * add;
        if (i&1)
            y = pointY + Width * 0.3;
        else
            y = pointY + Width * 0.5;
        CGContextAddLineToPoint(context, x, y);
    }
    CGContextAddQuadCurveToPoint(context, pointX + Width +20, pointY + Width * 0.25, pointX + Width, pointY);
    //    CGContextAddLineToPoint(context, pointX + Width, pointY );
    // 线条闭合
    CGContextClosePath(context);
    
    // 设置颜色
    [[UIColor colorWithRed:0.2 green:0.4 blue:0.7 alpha:0.7]set];
    
    //     设置线的转折点状态,对填充没有效果
    //    CGContextSetLineJoin(context, kCGLineJoinRound);
    //    CGContextSetLineWidth(context, 10);
    
    // 渲染
    CGContextFillPath(context);
    //    CGContextStrokePath(context);
    // 从栈顶中取出状态恢复图形上下文状态
    CGContextRestoreGState(context);
}
/**
 *  画左右两只眼睛
 */
- (void)drawEyes{
    // 1.获得图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 2.存储图形上下文当前旧的状态
    CGContextSaveGState(context);
    
    // 3.画图
    // 3.1 画线
    CGFloat lineP1X = self.frame.size.width / 2.0  - Width / 2.0;
    CGFloat lineP1Y = self.frame.size.height / 2.0 - Height / 2;
    CGFloat lineP2X = lineP1X + Width ;
    CGFloat lineP2Y = lineP1Y ;
    // 设置线宽
    CGContextSetLineWidth(context, 10);
    // 设置初始点
    CGContextMoveToPoint(context, lineP1X, lineP1Y);
    CGContextAddLineToPoint(context, lineP2X, lineP2Y);
    // 渲染
    CGContextStrokePath(context);
    
    // 3.2 画左眼
    [self drawEyeWithContext:context andInt:1];
    
    // 3.3 画右眼
    [self drawEyeWithContext:context andInt:-1];
    
    // 4.恢复图形上下文旧的状态
    CGContextRestoreGState(context);
    
}
/**
 *  画一只眼
 *
 *  @param context 图形上下文
 *  @param flag    1：表示画左眼，-1：表示画右眼
 */
- (void)drawEyeWithContext:(CGContextRef )context andInt:(int)flag{
    
    // 保存图形上下文旧的状态
    CGContextSaveGState(context);
    
    CGFloat eye1CircleX = self.frame.size.width / 2.0 - flag * Width / 4.0;
    CGFloat eye1CircleY = self.frame.size.height / 2.0 - Height / 2;
    // 圆1
    CGFloat eye1Radius1 = Width / 2.0 * 0.35;
    CGContextAddArc(context, eye1CircleX, eye1CircleY, eye1Radius1, 0, M_PI * 2, 0);
    CGContextFillPath(context);
    // 圆2
    CGFloat eye1Radius2 = eye1Radius1 * 0.7;
    [[UIColor whiteColor]set];
    CGContextAddArc(context, eye1CircleX, eye1CircleY, eye1Radius2, 0, M_PI * 2, 0);
    CGContextFillPath(context);
    // 圆3
    CGFloat eye1Circle3X = eye1CircleX + flag * eye1Radius2 * 0.2 ;
    CGFloat eye1Circle3Y = eye1CircleY;
    CGFloat eye1Radius3 = eye1Radius2 * 0.6;
    [[UIColor colorWithRed:65/255.0 green:16/255.0 blue:7/255.0 alpha:1]set];
    CGContextAddArc(context, eye1Circle3X, eye1Circle3Y, eye1Radius3, 0, M_PI * 2, 0);
    CGContextFillPath(context);
    // 圆4
    CGFloat eye1Radius4 = eye1Radius3 * 0.4;
    [[UIColor blackColor] set];
    CGContextAddArc(context, eye1Circle3X, eye1Circle3Y, eye1Radius4, 0, M_PI * 2, 0);
    CGContextFillPath(context);
    
    // 恢复图形上下文旧的状态
    CGContextRestoreGState(context);
    
}























@end
