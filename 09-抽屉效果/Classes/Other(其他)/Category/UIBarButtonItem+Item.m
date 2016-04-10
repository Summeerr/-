//
//  UIBarButtonItem+Item.m
//  01-BuDeJie
//
//  Created by xmg on 16/1/19.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)

+ (UIBarButtonItem *)createItemWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *buttonView = [[UIView alloc] initWithFrame:button.bounds];
    [buttonView addSubview:button];
    return [[UIBarButtonItem alloc] initWithCustomView:buttonView];
}

+ (UIBarButtonItem *)createItemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage target:(id)target action:(SEL)action
{
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    [but setImage:image forState:UIControlStateNormal];
    [but setImage:selectedImage forState:UIControlStateSelected];
    [but sizeToFit];
    [but addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *butV = [[UIView alloc] initWithFrame:but.bounds];
    [butV addSubview:but];
    return [[UIBarButtonItem alloc] initWithCustomView:butV];
}
//设置返回按钮
+ (UIBarButtonItem *)backItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action title:(NSString *)title
{
    UIButton *buts = [UIButton buttonWithType:UIButtonTypeCustom];
    [buts setTitle:title forState:UIControlStateNormal];
    [buts setImage:image forState:UIControlStateNormal];
    [buts setImage:highImage forState:UIControlStateHighlighted];
    [buts sizeToFit];
    
    //设置内容内边框
    buts.contentEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    
    [buts setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buts setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    [buts addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:buts];
}


@end
