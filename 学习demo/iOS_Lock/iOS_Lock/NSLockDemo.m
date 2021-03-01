//
//  NSLockDemo.m
//  iOS_Lock
//
//  Created by jason on 2021/2/26.
//

#import "NSLockDemo.h"
@interface NSLockDemo()
@property(nonatomic, strong) NSLock *lock;
@end
@implementation NSLockDemo
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lock = [[NSLock alloc] init];
    }
    return self;
}
- (void)sellingTickets {
    [self.lock lock];
    [super sellingTickets];
    [self.lock unlock];
}
@end
