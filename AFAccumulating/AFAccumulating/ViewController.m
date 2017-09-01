//
//  ViewController.m
//  AFAccumulating
//
//  Created by 郑飞飞 on 2017/8/23.
//  Copyright © 2017年 FlyZKing. All rights reserved.
//

#import "ViewController.h"
#import "AFKyushuView.h"
#import "UIView+AFFrame.h"
@interface ViewController ()
{
    UIView *view;
    UIView *view1;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self setupHiddenViewWithShow];
    
    [self setupKyushuView];
}

- (void)setupKyushuView {
    AFKyushuView *kyushuView = [AFKyushuView kyushuView];
//    kyushuView.frame = CGRectMake(60, 50, self.view.af_width / 2, self.view.af_height / 4);
    [self.view addSubview:kyushuView];
}





#pragma mark - 隐藏view位置可以做参考
///** 视图view隐藏后他的位置依然可以用来作为参考 */
//- (void)setupHiddenViewWithShow {
//    view = [[UIView alloc] initWithFrame:CGRectMake(20, 64, 200, 80)];
//    view.backgroundColor = [UIColor purpleColor];
//    view.hidden = YES;
//    [self.view addSubview:view];
//    
//    view1 = [[UIView alloc] init];
//    view1.bounds = CGRectMake(0, 0, 200, 80);
//    view1.center = CGPointMake(view.center.x, view.center.y + view.frame.size.height + 10);
//    view1.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:view1];
//
//    UIView *view2 = [[UIView alloc] init];
//    view2.bounds = CGRectMake(0, 0, 200, 80);
//
//    view2.center = CGPointMake(view1.center.x, view1.center.y + view1.frame.size.height + 10);
//    view2.backgroundColor = [UIColor darkGrayColor];
//    [self.view addSubview:view2];
//
//    
//}

- (void)viewWillAppear:(BOOL)animated {
//    view.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
