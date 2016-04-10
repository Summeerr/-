//
//  LMYTabBarController.m
//  HuiPinZhe
//
//  Created by LMY on 16/3/16.
//  Copyright © 2016年 ShuangJing. All rights reserved.
//

#import "LMYTabBarController.h"
#import "LMYToadyViewController.h"
#import "LMYBrandViewController.h"
#import "LMYFindViewController.h"
#import "LMYTomorrowViewController.h"
#import "LMYClassificationViewController.h"
#import "UIImage+Render.h"
#import "LMYNavigationController.h"
#import "LMYViewController.h"

@interface LMYTabBarController ()

@end

@implementation LMYTabBarController
+ (void)load
{
    //获取全局的tabBarItem
    //  UITabBarItem *item = [[UITabBarItem appearance];  //这个说获取所有的TabBarItem
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];//这个方法是获取当前的TabBarItem
    
    //设置选中标题的颜色
    //创建富文本属性字典
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict [NSForegroundColorAttributeName] = [UIColor redColor];//设置标题选中后颜色为黑色
    [item setTitleTextAttributes:dict forState:UIControlStateSelected];// 设置标题的富文本属性
    
    //设置正常状态下字体
    NSMutableDictionary *dicts = [NSMutableDictionary dictionary];
    //描述字体(设置字体的大小)
    dicts [NSFontAttributeName] = [UIFont systemFontOfSize:12];
    //设置标题的富文本属性
    [item setTitleTextAttributes:dicts forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTabBarController];
    

}

#pragma mark - 添加子控制器
- (void)setupTabBarController
{
    //今日
    [self addAllChildController:[[LMYToadyViewController alloc]init] title:@"今日" tabBarImage:@"home"];
    
    //品牌
    [self addAllChildController:[[LMYBrandViewController alloc] init]title:@"品牌团购" tabBarImage:@"brand"];
    
    //发现
    [self addAllChildController:[[LMYFindViewController alloc] init]title:@"发现" tabBarImage:@"showing"];
    
    //明日
    [self addAllChildController:[[LMYTomorrowViewController alloc] init]title:@"明日预告" tabBarImage:@"tom"];
    
    //分类
    [self addAllChildController:[[LMYClassificationViewController alloc] init]title:@"分类搜索" tabBarImage:@"search"];
}


- (void)addAllChildController:(UIViewController *)childView title:(NSString *)title tabBarImage:(NSString *)image
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childView];
    [self addChildViewController:nav];
    
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",image]];
    nav.tabBarItem.selectedImage = [UIImage imageWithOriginalRender:[NSString stringWithFormat:@"%@_selected",image]];
    
}


    


@end
