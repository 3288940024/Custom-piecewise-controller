//
//  YYJTopScrollView.h
//  自定义分段控制器
//
//  Created by 杨英俊 on 18-1-10.
//  Copyright © 2018年 杨英俊. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YYJTopScrollViewDelegate <NSObject>
// 按钮点击方法(index:按钮索引)
- (void)tap:(NSInteger)index;
@end

@interface YYJTopScrollView : UIScrollView
/** 存放标题的数组 */
@property (nonatomic,strong) NSArray *titleArray;
/** 代理 */
@property (nonatomic,weak) id <YYJTopScrollViewDelegate>YYJTopScrollViewDelegate;

// 按钮点击方法
- (void)tap:(UIButton *)button;

@end
