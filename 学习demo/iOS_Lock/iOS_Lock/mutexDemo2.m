//
//  mutexDemo2.m
//  iOS_Lock
//
//  Created by jason on 2021/2/26.
//

#import "mutexDemo2.h"
#import <pthread/pthread.h>
@interface mutexDemo2()
@property(nonatomic, assign) pthread_mutex_t lock;
@end

@implementation mutexDemo2

- (instancetype)init {
    self = [super init];
    if (self) {
        pthread_mutexattr_t attr;
        pthread_mutexattr_init(&attr);
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
        pthread_mutex_init(&_lock, &attr);
        pthread_mutexattr_destroy(&attr);
    }
    return self;
}
- (void)sellingTickets{
    pthread_mutex_lock(&_lock);
    [super sellingTickets];
    [self sellingTickets2];
    pthread_mutex_unlock(&_lock);
}

- (void)sellingTickets2 {
    pthread_mutex_lock(&_lock);
    NSLog(@"-----> %s",__func__);
    pthread_mutex_unlock(&_lock);
}
@end
