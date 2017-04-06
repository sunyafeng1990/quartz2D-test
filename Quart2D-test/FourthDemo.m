//
//  FourthDemo.m
//  Quart2D-test
//
//  Created by 孙亚锋 on 2017/4/5.
//  Copyright © 2017年 yafeng.sun. All rights reserved.
//

#import "FourthDemo.h"

@implementation FourthDemo

-(void)setProgressValue:(CGFloat)progressValue{
    _progressValue =  progressValue;
    
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //1获取上下文
    CGContextRef ctxRef = UIGraphicsGetCurrentContext();
    //2获取路径,进行绘图
    // 获取中心点
    CGFloat centerX = self.frame.size.width/2;
    CGFloat centerY = self.frame.size.height/2;
    CGPoint center = CGPointMake(centerX, centerY);
    
    CGFloat endA = self.progressValue * M_PI*2 - M_PI_2;
   //Center:圆心 radius:圆的半径 startAngle:起始角度 endAngle:终点角度
   //clockwise:Yes顺时针,No逆时针
   //注意:startAngle角度的位置是从圆的最右侧为0度.
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:100 startAngle: - M_PI_2 endAngle:endA clockwise:YES];
    //连线
    [path addLineToPoint:center];
    
    //3 将路径对象添加到上下文
    CGContextAddPath(ctxRef, path.CGPath);
    
    //4 渲染
    [[UIColor orangeColor]setFill];
    CGContextDrawPath(ctxRef, kCGPathFill);
    
}
















@end
