//
//  NSConditionLockDemo.m
//  iOS_Lock
//
//  Created by jason on 2021/2/26.
//

#import "NSConditionLockDemo.h"

@interface NSConditionLockDemo()
@property(nonatomic, strong) NSConditionLock *lock;
@end

@implementation NSConditionLockDemo
- (instancetype)init {
    self = [super init];
    if (self) {
        self.lock = [[NSConditionLock alloc] initWithCondition:1];
    }
    return self;
}

- (void)otherTest {
    [[[NSThread alloc] initWithTarget:self selector:@selector(__two) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__one) object:nil] start];
    
}

- (void)__one {
    NSLog(@"----------------1");
    [self.lock lock];
    NSLog(@"----------------2");
    sleep(2);
    [self.lock unlockWithCondition:2];
    NSLog(@"----------------3");
}

- (void)__two {
    NSLog(@"----------------4");
    [self.lock lockWhenCondition:2];
    NSLog(@"----------------5");
    sleep(2);
    [self.lock unlockWithCondition:3];
    NSLog(@"----------------6");
}
@end
