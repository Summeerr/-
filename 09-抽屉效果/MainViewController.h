//
//  抽屉效果
//
//  Created by 胡祥 on 15/2/7.
//  Copyright © 2015年 胡祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

///**
// *  是否是左视图
// *
// */
//@property (nonatomic, assign, getter = isShowLeftView) BOOL showLeftView;
//
///**
// *  是否是右视图
// *
// */
//@property (nonatomic, assign, getter = isShowRightView) BOOL showRightView;

/**
 *  中间控制器,必须要传一个中间控制器，左右两个控制器最少需要传一个
 */
@property (nonatomic, strong) UIViewController *middleViewController;

/**
 *  左侧控制器
 */
@property (nonatomic, strong) UIViewController *leftViewController;
/**
 *  右侧控制器
 */
@property (nonatomic, strong) UIViewController *rightViewController;

@end
