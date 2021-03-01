//
//  os_unfair_lockDemo.m
//  iOS_Lock
//
//  Created by jason on 2021/2/26.
//
//  互斥锁 iOS10以后推出

#import "os_unfair_lockDemo.h"
#import <os/lock.h>

@interface os_unfair_lockDemo()
@property(nonatomic, assign) os_unfair_lock lock;
@end
@implementation os_unfair_lockDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        self.lock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

- (void)sellingTickets{
    os_unfair_lock_lock(&_lock);
    [super sellingTickets];
    os_unfair_lock_unlock(&_lock);
}

@end
