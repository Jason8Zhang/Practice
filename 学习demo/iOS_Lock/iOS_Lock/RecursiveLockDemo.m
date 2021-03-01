//
//  RecursiveLockDemo.m
//  iOS_Lock
//
//  Created by jason on 2021/2/26.
//

#import "RecursiveLockDemo.h"

@interface RecursiveLockDemo()
@property(nonatomic, strong) NSRecursiveLock *lock;

@end

@implementation RecursiveLockDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        self.lock = [[NSRecursiveLock alloc] init];
    }
    return self;
}

- (void)sellingTickets {
    [self.lock lock];
    [super sellingTickets];
    [self sellingTickets2];
    [self.lock unlock];
}

- (void)sellingTickets2 {
    [self.lock lock];
    NSLog(@"-------> %s",__func__);
    [self.lock unlock];
}
@end
