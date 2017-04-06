//
//  OrangePersonViewController.m
//  Quart2D-test
//
//  Created by 孙亚锋 on 2017/4/6.
//  Copyright © 2017年 yafeng.sun. All rights reserved.
//

#import "OrangePersonViewController.h"
#import "OrangeView.h"
@interface OrangePersonViewController ()

@end

@implementation OrangePersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"画个小黄人";
    OrangeView *view = [[OrangeView alloc]init];
    view.frame = self.view.bounds;

    view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
