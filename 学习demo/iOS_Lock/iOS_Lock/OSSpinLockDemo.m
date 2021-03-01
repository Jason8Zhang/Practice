//
//  OSSpinLockDemo.m
//  iOS_Lock
//
//  Created by jason on 2021/2/26.
// 系统自旋锁，apple 已经废弃了该锁
//

#import "OSSpinLockDemo.h"
#import <libkern/OSAtomic.h>

@interface OSSpinLockDemo()
@property(nonatomic, assign) OSSpinLock lock;
@end

@implementation OSSpinLockDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        self.lock = OS_SPINLOCK_INIT;
    }
    return self;
}

- (void)sellingTickets{
    OSSpinLockLock(&_lock);
    [super sellingTickets];
    OSSpinLockUnlock(&_lock);
}

@end
