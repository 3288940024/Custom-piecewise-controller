//
//  ViewController.m
//  自定义分段控制器
//
//  Created by 杨英俊 on 18-1-10.
//  Copyright © 2018年 杨英俊. All rights reserved.
//

#import "ViewController.h"
#import "YYJTopView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = @[@"首页",@"消息",@"商城",@"我"];
    
    YYJTopView *topView = [[YYJTopView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 30)];
    topView.titleArray = array;
    [self.view addSubview:topView];
}



@end
