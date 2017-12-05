//
//  TestViewController.m
//
//  Created by shanpengtao on 2017/12/5.
//  Copyright © 2017年 shanpengtao. All rights reserved.
//

#import "TestViewController.h"
#import "NSTimer+WeakTime.h"

@interface TestViewController ()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) NSTimer *timer2;

@end

@implementation TestViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initTimer];
}

- (void)initTimer
{
    // 方式一
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(print) userInfo:nil repeats:YES];
    
    // 方式二
    __weak typeof(self) weakSelf = self;
    _timer2 = [NSTimer scheduledTimerWithTimeInterval:2 userInfo:nil repeats:YES block:^(id userInfo) {

        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf print2];

    }];
}

- (void)print
{
    NSLog(@"%s", __FUNCTION__);
}

- (void)print2
{
    NSLog(@"%s", __FUNCTION__);
}

- (void)dealloc
{
    if ([_timer isValid]) {
        [_timer invalidate];
        _timer = nil;
    }

    if ([_timer isValid]) {
        [_timer2 invalidate];
        _timer2 = nil;
    }

    NSLog(@"%s", __FUNCTION__);
}

@end
