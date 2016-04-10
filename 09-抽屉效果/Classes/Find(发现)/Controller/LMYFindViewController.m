//
//  LMYFindViewController.m
//  HuiPinZhe
//
//  Created by LMY on 16/3/16.
//  Copyright © 2016年 ShuangJing. All rights reserved.
//

#import "LMYFindViewController.h"
#import "UIColor+Hex.h"
@interface LMYFindViewController ()

@end

@implementation LMYFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.view.backgroundColor = LMYColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256));
    [self setupNavigationBar];
    self.title = @"发现";
}

- (void)setupNavigationBar
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:0];
}

@end
