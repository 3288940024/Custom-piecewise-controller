//
//  YYJTopView.m
//  自定义分段控制器
//
//  Created by 杨英俊 on 18-1-10.
//  Copyright © 2018年 杨英俊. All rights reserved.
//

#import "YYJTopView.h"

@interface YYJTopView () {
    // 用于保存点击状态下的按钮
    UIButton *_selectBtn;
}
@end

@implementation YYJTopView

#pragma mark ~~~~~~~~~~ 初始化 ~~~~~~~~~~
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

#pragma mark ~~~~~~~~~~ Setter ~~~~~~~~~~
- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    
    // 初始化内部标题按钮
    CGFloat buttonW = self.frame.size.width / titleArray.count;
    CGFloat buttonH = self.frame.size.height;
    for (int i=0; i<titleArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        // 设置标题
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        // 设置默认字体颜色
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 设置点击时字体颜色
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        // 设置按钮尺寸
        [button setFrame:CGRectMake(buttonW * i, 0, buttonW, buttonH)];
        // 设置点击方法
        [button addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
        // 记入标签
        button.tag = i;
        if (i == 0) {
            [self tap:button];
        }
        [self addSubview:button];
    }
}

#pragma mark ~~~~~~~~~~ 点击方法 ~~~~~~~~~~
- (void)tap:(UIButton *)button {
    // 将上一个点击的按钮设置可以点击（如果没有点击按钮不妨碍代码执行）
    _selectBtn.enabled = YES;
    // 叫点击的按钮设置不能点击
    button.enabled = NO;
    // 将点击按钮赋值给selectBtn进行保存记录
    _selectBtn = button;
    
    NSLog(@"你点击了第%zd个按钮",button.tag);
}


@end
