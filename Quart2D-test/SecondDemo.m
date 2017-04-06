//
//  SecondDemo.m
//  Quart2D-test
//
//  Created by 孙亚锋 on 2017/4/5.
//  Copyright © 2017年 yafeng.sun. All rights reserved.
//

#import "SecondDemo.h"

@implementation SecondDemo
-(void)setImage:(UIImage *)image
{
    _image = image;
    [self setNeedsDisplay];
}
-(instancetype)initWithImage:(UIImage *)image{
    
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        _image = image;
    }
    
    return self;
}
-(void)drawRect:(CGRect)rect{
    [_image drawInRect:rect];
}

@end
