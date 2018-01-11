//
//  ViewController.m
//  自定义分段控制器
//
//  Created by 杨英俊 on 18-1-10.
//  Copyright © 2018年 杨英俊. All rights reserved.
//

#import "ViewController.h"
#import "YYJTopScrollView.h"
#import "UIView+YYJExtentsion.h"

@interface ViewController () <UIScrollViewDelegate,YYJTopScrollViewDelegate>
/** 底部滚动视图 */
@property (nonatomic,strong) UIScrollView *mainScroll;
/** 标题滚动视图 */
@property (nonatomic,strong) YYJTopScrollView *topScroll;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = @[@"首页",@"消息",@"商城",@"我",@"新闻",@"视频",@"电影",@"图片",@"笑话",@"GIF动图",@"体育",@"娱乐"];
    
    for (int i=0; i<array.count; i++) {
        UIViewController *view = [[UIViewController alloc] init];
        [self addChildViewController:view];
    }
    
    YYJTopScrollView *topScroll = [[YYJTopScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 30)];
    topScroll.titleArray = array;
    topScroll.YYJTopScrollViewDelegate = self;
    [self.view addSubview:topScroll];
    self.topScroll = topScroll;
    
    self.mainScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, topScroll.y+topScroll.height, self.view.width, self.view.height)];
    self.mainScroll.showsVerticalScrollIndicator = NO;
    self.mainScroll.showsHorizontalScrollIndicator = NO;
    self.mainScroll.bounces = NO;
    self.mainScroll.delegate = self;
    self.mainScroll.pagingEnabled = YES;
    self.mainScroll.contentSize = CGSizeMake(self.view.width * array.count, 0);
    [self.view addSubview:self.mainScroll];
    
    // 获取第一个视图
    [self scrollViewDidEndScrollingAnimation:self.mainScroll];
}

#pragma mark ~~~~~~~~~~ ScrollViewDelegate ~~~~~~~~~~
// 滑动结束调用
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    // 获取当前偏移的索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    // 获取第index个子控制器设置尺寸，并添加到滚动视图上
    UIViewController *vc = self.childViewControllers[index];
    vc.view.frame = CGRectMake(scrollView.width * index, 0, scrollView.width, scrollView.height);
    CGFloat r = arc4random()%255/255.0;
    CGFloat g = arc4random()%255/255.0;
    CGFloat b = arc4random()%255/255.0;
    vc.view.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    [scrollView addSubview:vc.view];
    
    UILabel *label = [[UILabel alloc] initWithFrame:vc.view.bounds];
    [vc.view addSubview:label];
    label.text = [NSString stringWithFormat:@"%zd",index];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:50];
}

// 滑动减速停止时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    // 找到当前点击的按钮
    NSMutableArray *buttonArray = [NSMutableArray array];
    for (UIView *view in self.topScroll.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            [buttonArray addObject:view];
        }
    }
    // 当前视图索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    UIButton *button = buttonArray[index];
    // 点击button改变按钮属性
    [self.topScroll tap:button];
}

- (void)tap:(NSInteger)index {
    [self.mainScroll setContentOffset:CGPointMake(self.mainScroll.width * index, 0) animated:YES];
}


@end
