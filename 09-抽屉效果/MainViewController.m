//
//  抽屉效果
//
//  Created by 胡祥 on 15/2/7.
//  Copyright © 2015年 胡祥. All rights reserved.
//

#import "MainViewController.h"

#import "HXLeftViewController.h"
#import "HXViewController.h"
#import "HXRightViewController.h"

#define hxwidth [UIScreen mainScreen].bounds.size.width
#define hxheight [UIScreen mainScreen].bounds.size.height

@interface  MainViewController()
//左视图
@property (nonatomic , weak) UIView *leftView;
/*右视图*/
@property (nonatomic, weak) UIView  *rightView;
/*主视图*/
@property (nonatomic, weak) UIView *mainView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //设置内容的view
    [self setUpAllView];
    
}


-(void)setUpAllView
{
    //中间视图
    self.middleViewController.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    UIView *mainView = self.middleViewController.view;
    mainView.backgroundColor = [UIColor redColor];
    
    //mainView添加手势
    UISwipeGestureRecognizer *swipGesR = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipGes:)];
    //右扫
    swipGesR.direction = UISwipeGestureRecognizerDirectionRight;
    //左扫
    UISwipeGestureRecognizer *swipGesL = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipGes:)];
    swipGesL.direction = UISwipeGestureRecognizerDirectionLeft;

    
    [mainView addGestureRecognizer:swipGesR];
    [mainView addGestureRecognizer:swipGesL];
    self.mainView = mainView;
    
        if (self.leftViewController&&!self.rightViewController) {//如果是左视图控制器
  
            //左视图
            self.leftView = self.leftViewController.view;
            self.leftView.frame = mainView.frame;
            self.leftView.backgroundColor = [UIColor yellowColor];
            [self.view addSubview:self.leftView];
            [self.view addSubview:self.mainView];
            self.leftView.hidden = YES;
            
            
        }else if (self.rightViewController&&!self.leftViewController){//如果是右视图
            
            //右视图
            self.rightView = self.rightViewController.view;
            self.rightView.frame = self.mainView.frame;
            self.rightView.backgroundColor = [UIColor blueColor];
            [self.view addSubview:self.rightView];
            [self.view addSubview:self.mainView];
            self.rightView.hidden = YES;
            
        }
    else if(self.leftViewController && self.rightViewController)
    {
        //左视图
        self.leftView = self.leftViewController.view;
        self.leftView.frame = mainView.frame;
        //右视图
        self.rightView = self.rightViewController.view;
        self.rightView.frame = mainView.frame;
        
        [self.view addSubview:self.rightView];
        [self.view addSubview:self.leftView];
        [self.view addSubview:self.mainView];
        self.leftView.hidden = YES;
        self.rightView.hidden = YES;
        
    }
    
}

//轻扫手势
-(void)swipGes:(UISwipeGestureRecognizer *)swipGes
{
    
    BOOL isRight = swipGes.direction == UISwipeGestureRecognizerDirectionRight;
//    BOOL isLeft = swipGes.direction == UISwipeGestureRecognizerDirectionLeft;
   
    if (self.leftViewController && !self.rightViewController) {
        
        if (isRight) {
            self.leftView.hidden = NO;
            [UIView animateWithDuration:0.2 animations:^{
                self.mainView.frame = CGRectMake(300, 100, hxwidth-300, hxheight-200);
            }];
        }else
        {
            [UIView animateWithDuration:0.2 animations:^{
                self.mainView.frame = self.view.bounds;
            }completion:^(BOOL finished) {
                self.leftView.hidden = YES;
            }];
        }
    
    }
    else if(self.rightViewController && !self.leftViewController)
    {
        if (isRight) {
            [UIView animateWithDuration:0.2 animations:^{
                self.mainView.frame = self.view.bounds;
            }completion:^(BOOL finished) {
                self.rightView.hidden = YES;
            }];
        }else
        {
            self.rightView.hidden = NO;
            [UIView animateWithDuration:0.2 animations:^{
                self.mainView.frame = CGRectMake(0, 100, hxwidth-300, hxheight-200);
            }];
        }
    }
    else if (self.rightViewController && self.leftViewController)
    {
        if (isRight) {
            if (self.mainView.frame.origin.x >= 0) {
                [UIView animateWithDuration:0.2 animations:^{
                    self.mainView.frame = CGRectMake(300, 100, hxwidth-300, hxheight-200);
                    self.rightView.hidden = YES;
                    self.leftView.hidden = NO;
                }];
            }else
            {
                [UIView animateWithDuration:0.2 animations:^{
                    self.mainView.frame = self.view.bounds;
                }completion:^(BOOL finished) {
                    self.leftView.hidden = YES;
                    self.rightView.hidden = YES;
                }];
            }
            
        }else
        {
            if (self.mainView.frame.origin.x>0) {
                [UIView animateWithDuration:0.2 animations:^{

                    self.mainView.frame = self.view.bounds;
                }completion:^(BOOL finished) {
                    self.leftView.hidden = YES;
                    self.rightView.hidden = YES;
                }];
            }else
            {
                [UIView animateWithDuration:0.2 animations:^{
                    self.mainView.frame = CGRectMake(-1, 100, hxwidth-300, hxheight-200);
                    self.rightView.hidden = NO;
                    self.leftView.hidden = YES;
                }];
            }
        }
        
    }
}


@end
