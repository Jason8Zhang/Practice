//
//  mutexDemo.m
//  iOS_Lock
//
//  Created by jason on 2021/2/26.
//

#import "mutexDemo.h"
#import <pthread/pthread.h>

@interface mutexDemo()
@property(nonatomic, assign) pthread_mutex_t lock;

@end
@implementation mutexDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        pthread_mutexattr_t attr;
        pthread_mutexattr_init(&attr);
//        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT); // 此处第二个参数为NULL表示为PTHREAD_MUTEX_DEFAULT
        pthread_mutex_init(&_lock, &attr);
        pthread_mutexattr_destroy(&attr);
    }
    return self;
}
- (void)sellingTickets{
    pthread_mutex_lock(&_lock);
    [super sellingTickets];
    pthread_mutex_unlock(&_lock);
}

@end
