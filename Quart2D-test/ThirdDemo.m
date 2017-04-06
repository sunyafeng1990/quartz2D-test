//
//  ThirdDemo.m
//  Quart2D-test
//
//  Created by 孙亚锋 on 2017/4/5.
//  Copyright © 2017年 yafeng.sun. All rights reserved.
//

#import "ThirdDemo.h"

@implementation ThirdDemo


- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    CGPoint center = CGPointMake(100, 100);
    CGFloat redius = 100;
    CGFloat startA = 0.4;
    CGFloat endA   = 0;
    CGFloat angle = 30 / 100.0 * M_PI * 2;
    endA = startA + angle;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:redius startAngle:startA endAngle:endA clockwise:YES];
    
    [[UIColor blueColor]setFill];
    [path addLineToPoint:center];
    
    CGContextAddPath(ref, path.CGPath);
    
    CGContextFillPath(ref);
    
    
}


@end
