//
//  semaphoreDemo.m
//  iOS_Lock
//
//  Created by jason on 2021/2/26.
//

#import "semaphoreDemo.h"

@interface semaphoreDemo()
@property(nonatomic, strong) dispatch_semaphore_t sem;

@end

@implementation semaphoreDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        self.sem = dispatch_semaphore_create(1);
    }
    return self;
}

- (void)otherTest {
    for (int i = 0; i < 20; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(__test) object:nil] start];
    }
}

- (void)__test {
    
    // 如果信号量的值 > 0，就让信号量的值减1，然后继续往下执行代码
    // 如果信号量的值 <= 0，就会休眠等待，直到信号量的值变成>0，就让信号量的值减1，然后继续往下执行代码
    dispatch_semaphore_wait(self.sem, DISPATCH_TIME_FOREVER);
    sleep(2);
    NSLog(@"test - %@", [NSThread currentThread]);

    // 让信号量的值+1
    dispatch_semaphore_signal(self.sem);
}
@end
