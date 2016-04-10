//
//  LMYTomorrowViewController.m
//  HuiPinZhe
//
//  Created by LMY on 16/3/16.
//  Copyright © 2016年 ShuangJing. All rights reserved.
//

#import "LMYTomorrowViewController.h"
#import "UIColor+Hex.h"
@interface LMYTomorrowViewController ()

@end

@implementation LMYTomorrowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = LMYColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256));
    [self setupNavigationBar];
    
}

- (void)setupNavigationBar
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:0];
    self.navigationItem.title = @"明日预告";
}

@end
