//
//  NSWeakProxy.h
//
//  Created by shanpengtao on 2017/12/5.
//  Copyright © 2017年 shanpengtao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSWeakProxy : NSProxy

/**
 *  weak target
 *  为什么不在用的地方进行weak引用？
 *  答：因为就算你在target处进行__weak处理 在消息传递过程中，系统会自动将传入的target进行__strong处理，防止target被释放引起的崩溃
 */
@property (nullable, nonatomic, weak, readonly) id target;

/**
 *  生成weak target，防止循环引用
 */
- (instancetype)initWithTarget:(id)target;

/**
 *  生成weak target，防止循环引用
 */
+ (instancetype)proxyWithTarget:(id)target;


@end

NS_ASSUME_NONNULL_END
