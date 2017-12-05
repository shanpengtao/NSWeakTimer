//
//  NSTimer+WeakTime.m
//
//  Created by shanpengtao on 2017/12/5.
//  Copyright © 2017年 shanpengtao. All rights reserved.
//

#import "NSTimer+WeakTime.h"
#import <objc/runtime.h>
#import "NSWeakProxy.h"

@implementation NSTimer (WeakTime)

#pragma mark -- 通过NSProxy改写target，并通过runtime传入weak target

+ (void)load
{
    Method systemMethod = class_getClassMethod(self, @selector(scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:));

    Method customMethod = class_getClassMethod(self, @selector(safeScheduledTimerWithTimeInterval:target:selector:userInfo:repeats:));

    method_exchangeImplementations(systemMethod, customMethod);
}

+ (NSTimer *)safeScheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo
{
    // weak引用target
    id weakTarget = [NSWeakProxy proxyWithTarget:aTarget];

    return [self safeScheduledTimerWithTimeInterval:ti target:weakTarget selector:aSelector userInfo:userInfo repeats:yesOrNo];
}


#pragma mark -- 通过block方式解决timer的循环引用，block内部调用方法需要weak引用self

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats
                                      block:(WeakTimerHandler)block {
    
    NSMutableArray *userInfoArray = [NSMutableArray arrayWithObject:[block copy]];
    if (userInfo != nil) {
        [userInfoArray addObject:userInfo];
    }
    
    return [NSTimer scheduledTimerWithTimeInterval:interval
                                            target:self
                                          selector:@selector(p_timerBlock:)
                                          userInfo:[userInfoArray copy]
                                           repeats:repeats];
}

+ (void)p_timerBlock:(NSTimer *)timer {

    NSArray *userInfo = timer.userInfo;
    
    WeakTimerHandler block = userInfo[0];
    
    id info = nil;
    if (userInfo.count == 2) {
        info = userInfo[1];
    }
    
    !block ? : block(info);
}

@end
