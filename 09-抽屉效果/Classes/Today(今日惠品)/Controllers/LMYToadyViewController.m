//
//  LMYToadyViewController.m
//  HuiPinZhe
//
//  Created by LMY on 16/3/16.
//  Copyright © 2016年 ShuangJing. All rights reserved.
//

#import "LMYToadyViewController.h"
#import "UIColor+Hex.h"
#import "UIBarButtonItem+Item.h"
#import "LMYLeftViewController.h"

@interface LMYToadyViewController ()

@end

@implementation LMYToadyViewController



- (void)viewDidLoad {
    [super viewDidLoad];
   self.view.backgroundColor = LMYColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256));
    
    [self setupNavigationBar];
    
}

- (void)setupNavigationBar
{
//背景
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bingding-normal"] forBarMetrics:0];
//左
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem createItemWithImage:[UIImage imageNamed:@"my_account"] highlightedImage:[UIImage imageNamed:@"my_account"] target:self action:@selector(my)];
//右
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem createItemWithImage:[UIImage imageNamed:@"scanning_icon"] highlightedImage:[UIImage imageNamed:@"scanning_icon"] target:self action:@selector(scanning)];
//中
    UIImageView *titleImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"huipinzhe-titlebar"]];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    titleImage.frame = view.frame;
    view.center = self.navigationItem.titleView.center;
    self.navigationItem.titleView = view;
    [view addSubview:titleImage];


}

- (void)my
{
    
}
- (void)scanning
{
    
}
@end
