//
//  HXRightViewController.m
//  09-抽屉效果
//
//  Created by 胡祥 on 16/3/8.
//  Copyright © 2016年 胡祥. All rights reserved.
//

#import "HXRightViewController.h"

@interface HXRightViewController ()

@end

@implementation HXRightViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blueColor];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"111");
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
