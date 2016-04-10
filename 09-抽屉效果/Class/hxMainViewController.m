//
//  抽屉效果
//
//  Created by 胡祥 on 15/2/7.
//  Copyright © 2015年 胡祥. All rights reserved.
//

#import "hxMainViewController.h"

#import "LMYToadyViewController.h"

#define hxwidth [UIScreen mainScreen].bounds.size.width
#define hxheight [UIScreen mainScreen].bounds.size.height

@interface  hxMainViewController()
//左视图
@property (nonatomic , weak) UIView *leftView;
/*右视图*/
@property (nonatomic, weak) UIView  *rightView;
/*主视图*/
@property (nonatomic, weak) UIView *mainView;

/**
 *  手势
 *
 */
@property (nonatomic, weak) UIPanGestureRecognizer *panGes;

@end

@implementation hxMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       //设置内容的view
    [self setUpAllView];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(today) name:@"today" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(other) name:@"other" object:nil];
    
}

-(void)today{
    self.panGes.enabled = YES;
}
-(void)other{
    self.panGes.enabled = NO;
}


-(void)setUpAllView
{
    
    //中间视图
    self.middleViewController.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    UIView *mainView = self.middleViewController.view;
//    mainView.backgroundColor = [UIColor redColor];
    
    self.mainView = mainView;
    if (self.leftViewController&&!self.rightViewController) {//如果是左视图控制器
        
        //左视图
        self.leftView = self.leftViewController.view;
        self.leftView.frame = mainView.frame;
        [self.view addSubview:self.leftView];
        [self.view addSubview:self.mainView];
        self.leftView.hidden = YES;
        
    }
    //mainView添加手势
    UIPanGestureRecognizer *swipGesR = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(swipGes:)];
    self.panGes = swipGesR;
    [mainView addGestureRecognizer:swipGesR];
}

#define targetR 275

#define targetL -275

//轻扫手势
-(void)swipGes:(UIPanGestureRecognizer *)swipGes
{
    CGFloat x = [swipGes translationInView:self.mainView].x;
   
     //根据偏移量计算mainV的frame.
    self.mainView.frame = [self frameWithOffsetX:x];

    if (self.mainView.frame.origin.x >= 0) {
        //往右边拖动
        self.leftView.hidden = NO;
        //判断手指松开.
        //当手指松开时,去判断是否大于屏幕宽度的一半,或是小于屏幕宽度的一半.
        
        if(swipGes.state == UIGestureRecognizerStateEnded){
            //当mainV.x大于屏幕宽度的一半,自动定位到右边.
            CGFloat target = 0;
            if(self.mainView.frame.origin.x > hxwidth * 0.5){
                //自动定位到右边.
                target = targetR;
            }else if(CGRectGetMaxX(self.mainView.frame) < hxwidth * 0.5){
                //当mainV最大的x值小于屏幕宽度的一半,,自动定位到左边.
                target = targetL;
            }
            //求出要定位的偏移量
            CGFloat offsetX = target - self.mainView.frame.origin.x;
            
            //添加动画自动定位.
            [UIView animateWithDuration:0.5 animations:^{
                self.mainView.frame = [self frameWithOffsetX:offsetX];
            }];
            
        }
        //复位
        [swipGes setTranslation:CGPointZero inView:self.mainView];
        
    }
    
}

//定义一个Y的最大值
#define marY 100

//根据偏移量计算mainV的frame.
- (CGRect)frameWithOffsetX:(CGFloat)offsetX{
    
    //取出最原始的Frame
    CGRect frame = self.mainView.frame;
    
    if (frame.origin.x == 0 && offsetX<0) {
        return frame;
        
    }
    
    frame.origin.x += offsetX;
    
    
    //当x为负是, 计算的结果也是负的, Y值就会向上走.取绝对值.
    frame.origin.y = fabs(frame.origin.x * marY / hxwidth);
    
    //求mainV的高度
    frame.size.height =  hxheight - 2 * frame.origin.y;
    
    return frame;
}

-(void)swipR
{
    self.leftView.hidden = NO;
    //求出要定位的偏移量
    CGFloat offsetX = targetR - self.mainView.frame.origin.x;
    [UIView animateWithDuration:0.5 animations:^{
        self.mainView.frame = [self frameWithOffsetX:offsetX];
    }];
}

-(void)swipL
{
    [UIView animateWithDuration:0.5 animations:^{
        self.mainView.frame = self.view.bounds;
    }completion:^(BOOL finished) {
        self.leftView.hidden = YES;
    }];
}

@end
