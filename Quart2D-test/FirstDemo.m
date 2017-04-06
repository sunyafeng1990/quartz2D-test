//
//  FirstDemo.m
//  Quart2D-test
//
//  Created by 孙亚锋 on 2017/4/5.
//  Copyright © 2017年 yafeng.sun. All rights reserved.
//

#import "FirstDemo.h"

@implementation FirstDemo


- (void)drawRect:(CGRect)rect {
  // 画一条线
    CGContextRef ref  = UIGraphicsGetCurrentContext();
    
    [[UIColor cyanColor]set];
    //设置起点
    CGContextMoveToPoint(ref,0 , 0);
    //设置线宽
    CGContextSetLineWidth(ref, 10);
    // 添加顶角样式
    CGContextSetLineCap(ref, kCGLineCapRound);
    //设置终点
    CGContextAddLineToPoint(ref, 100, 100);
    //渲染
    CGContextStrokePath(ref);
    
    
}


@end
