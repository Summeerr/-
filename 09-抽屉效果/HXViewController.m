//
//  HXViewController.m
//  09-抽屉效果
//
//  Created by 胡祥 on 16/3/8.
//  Copyright © 2016年 胡祥. All rights reserved.
//

#import "HXViewController.h"

#import "HXLeftViewController.h"
#import "HXRightViewController.h"
#import "HXMiddleViewController.h"
@interface HXViewController ()

@end

@implementation HXViewController

- (void)viewDidLoad {
    //中间视图控制器
    self.middleViewController = [[HXMiddleViewController alloc]init];
    //右视图控制器
//    self.rightViewController = [[HXRightViewController alloc]init];
    [super viewDidLoad];
  //左视图控制器
    self.leftViewController = [[HXLeftViewController alloc]init];
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
