//
//  LMYBrandViewController.m
//  HuiPinZhe
//
//  Created by LMY on 16/3/16.
//  Copyright © 2016年 ShuangJing. All rights reserved.
//

#import "LMYBrandViewController.h"
#import "UIColor+Hex.h"

@interface LMYBrandViewController ()

@end

@implementation LMYBrandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = LMYColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256));
    [self setupNavigationBar];
}

- (void)setupNavigationBar
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:0];
    
    self.navigationItem.title = @"品牌团购";
}

@end
