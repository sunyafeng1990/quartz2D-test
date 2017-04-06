//
//  UIView+expand.m
//  Quart2D-test
//
//  Created by 孙亚锋 on 2017/4/5.
//  Copyright © 2017年 yafeng.sun. All rights reserved.



// Category是Objective-C中常用的语法特性，通过它可以很方便的为已有的类来添加函数。但是Category不允许为已有的类添加新的属性或者成员变量。
// 一种常见的办法是通过runtime.h中objc_getAssociatedObject / objc_setAssociatedObject来访问和生成关联对象。通过这种方法来模拟生成属性。

#import "UIView+expand.h"
#import <objc/runtime.h>
static const void *newStrKey = &newStrKey;

@implementation UIView (expand)

@dynamic newStr;

-(NSString *)newStr{
    return objc_getAssociatedObject(self, newStrKey);
}
-(void)setNewStr:(NSString *)newStr{
   
    objc_setAssociatedObject(self, newStrKey, newStr,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
