//
//  ViewController.m
//  NSWeakTimer
//
//  Created by shanpengtao on 2017/12/5.
//  Copyright © 2017年 shanpengtao. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addSubViews];
}

- (void)addSubViews
{
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 200, 100, 100);
    button.layer.cornerRadius = 50;
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"测试" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(gotoTimerViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


- (void)gotoTimerViewController
{
    TestViewController *viewController = [[TestViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
