//
//  NSTimer+WeakTime.h
//
//  Created by shanpengtao on 2017/12/5.
//  Copyright © 2017年 shanpengtao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^WeakTimerHandler)(id userInfo);

@interface NSTimer (WeakTime)

/**
 *  block方式解决timer的循环引用
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats
                                      block:(WeakTimerHandler)block;

@end
