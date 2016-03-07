//
//  抽屉效果
//
//  Created by 胡祥 on 15/2/7.
//  Copyright © 2015年 胡祥. All rights reserved.
//

#import "MainViewController.h"

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
    
    
    //主视图
    UIView *mainView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    mainView.backgroundColor = [UIColor redColor];
    //mainView添加手势
    UISwipeGestureRecognizer *swipGes = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipGes:)];
    //右扫
    swipGes.direction = UISwipeGestureRecognizerDirectionRight;
    
    //左扫
    UISwipeGestureRecognizer *swipLeftGes = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipGes:)];
    swipLeftGes.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [mainView addGestureRecognizer:swipGes];
    [mainView addGestureRecognizer:swipLeftGes];
    
    
    
    //左视图
    UIView *leftView = [[UIView alloc]init];
    leftView.frame = mainView.frame;
    leftView.backgroundColor = [UIColor yellowColor];
    
    
    //右视图
    UIView *rightView = [[UIView alloc]init];
    rightView.frame = mainView.frame;
    rightView.backgroundColor = [UIColor blueColor];
    
    
    [self.view addSubview:rightView];//蓝色
    [self.view addSubview:leftView];//黄色
    [self.view addSubview:mainView];//红色
    
    
    self.leftView = leftView;
    self.rightView = rightView;
    self.mainView = mainView;
    
    self.leftView.hidden = YES;
    self.rightView.hidden = YES;
    
}


//轻扫手势
-(void)swipGes:(UISwipeGestureRecognizer *)swipGes
{
    
    BOOL isRight = swipGes.direction == UISwipeGestureRecognizerDirectionRight;
    BOOL isLeft = swipGes.direction == UISwipeGestureRecognizerDirectionLeft;
    if (isRight) {
        //改变mainViewde尺寸及位置
        
        //当mainView视图x点，显示黄视图
        if (self.mainView.frame.origin.x>=0) {
            
            //主视图右移
            [UIView animateWithDuration:0.2 animations:^{
                
                
                self.leftView.hidden = !(self.rightView.hidden = isRight);
                self.mainView.frame = CGRectMake(300, 100, hxwidth-300, hxheight-200);
                
            }];
            
        }
        else//小于0
        {
            //主视图右移
            [UIView animateWithDuration:0.2 animations:^{
                
                
                self.leftView.hidden = !(self.rightView.hidden = !isRight);
                self.mainView.frame = self.view.frame;
                
            }completion:^(BOOL finished) {
                self.leftView.hidden = self.rightView.hidden = YES;
            }];
        }
        
    }else if(isLeft)
    {
        //改变mainView的尺寸和位置
        //当mainView视图x点，显示黄视图
        if (self.mainView.frame.origin.x>0) {//大于0
            
            //主视图右移
            [UIView animateWithDuration:0.2 animations:^{
                
                self.rightView.hidden = (self.leftView.hidden = !isLeft);
                self.mainView.frame = self.view.frame;
            }completion:^(BOOL finished) {
                self.leftView.hidden = self.rightView.hidden = YES;
            }];
            
            
        }
        else//小于等于0
        {
            //主视图右移
            [UIView animateWithDuration:0.2 animations:^{
                
                //                self.mainView.transform = CGAffineTransformTranslate(self.mainView.transform, -hxwidth+100, 0);
                
                self.leftView.hidden = !(self.rightView.hidden = !isLeft);
                self.mainView.frame = CGRectMake(-300, 100, hxwidth, hxheight-200);
            }];
        }
        
        
        
    }
    
    
    
}





@end
