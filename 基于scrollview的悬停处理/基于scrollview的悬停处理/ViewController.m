//
//  ViewController.m
//  基于scrollview的悬停处理
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scView;
@property (nonatomic, strong) UIView *topView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:scView];
    scView.backgroundColor = [UIColor redColor];
    scView.contentSize = CGSizeMake(self.view.frame.size.width, 1000);
    //创建一个button
    UIButton *but = [[UIButton alloc]initWithFrame:CGRectMake(100, 400, 100, 100)];
    [scView addSubview:but];
    but.backgroundColor = [UIColor greenColor];
    //创建顶部的条
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)];
    topView.backgroundColor = [UIColor greenColor];
    [scView addSubview:topView];
    self.topView = topView;
    self.scView = scView;
    self.scView.delegate = self;
    
}
#pragma scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.scView.contentOffset.y > 100) {
        self.topView.frame = CGRectMake(0, 0, self.view.frame.size.width, 50) ;
        [self.view addSubview:self.topView];
    }else{
        self.topView.frame = CGRectMake(0, 100, self.view.frame.size.width, 50) ;
        [self.scView addSubview:self.topView];
    
    }

}

@end
