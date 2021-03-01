//
//  mutexDemo3.m
//  iOS_Lock
//
//  Created by jason on 2021/2/26.
//

#import "mutexDemo3.h"
#import <pthread/pthread.h>
@interface mutexDemo3()
@property(nonatomic, assign) pthread_mutex_t lock;
@property(nonatomic, assign) pthread_cond_t condition;
@property(nonatomic, strong) NSMutableArray *array;
@end

@implementation mutexDemo3
- (instancetype)init {
    self = [super init];
    if (self) {
        self.array = [NSMutableArray array];
        // init attr
        pthread_mutexattr_t attr;
        pthread_mutexattr_init(&attr);
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
        // init lock
        pthread_mutex_init(&_lock, &attr);
        // release attr
        pthread_mutexattr_destroy(&attr);
        pthread_cond_init(&_condition, NULL);
    }
    return self;
}

- (void)otherTest {
    [[[NSThread alloc] initWithTarget:self selector:@selector(__remove) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__add) object:nil] start];
    
}

- (void)__add {
    pthread_mutex_lock(&_lock);
    sleep(1);
    NSLog(@"添加了元素");
    [self.array addObject:@"test"];
    pthread_cond_signal(&_condition);
    pthread_mutex_unlock(&_lock);
}

- (void)__remove {
    pthread_mutex_lock(&_lock);
    NSLog(@"__remove - begin");
    if (self.array.count == 0) {
        pthread_cond_wait(&_condition, &_lock);
    }
    sleep(1);
    [self.array removeLastObject];
    NSLog(@"删除了元素");
    pthread_mutex_unlock(&_lock);
}

- (void)dealloc {
    pthread_mutex_destroy(&_lock);
    pthread_cond_destroy(&_condition);
}
@end
