# NSWeakTimer

本工程为解决NSTimer引起的循环引用，两种方式的使用方法如下：

1. 将NSWeakProxy和NSTimer+WeakTime两个类导入

2. 第一种方式，直接使用系统方法：
  + (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti 
                                       target:(id)aTarget
                                       selector:(SEL)aSelector
                                       userInfo:(nullable id)userInfo
                                       repeats:(BOOL)yesOrNo;

3. 第二种方式，引入头文件NSTimer+WeakTime.h,并使用自定义方法：
  + (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                     userInfo:(id)userInfo
                                      repeats:(BOOL)repeats
                                        block:(WeakTimerHandler)block;

