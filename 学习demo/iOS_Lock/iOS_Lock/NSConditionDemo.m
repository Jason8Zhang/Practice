//
//  NSConditionDemo.m
//  iOS_Lock
//
//  Created by jason on 2021/2/26.
//

#import "NSConditionDemo.h"

@interface NSConditionDemo()
@property(nonatomic, strong) NSCondition *cond;
@property(nonatomic, strong) NSRecursiveLock *lock;
@property(nonatomic, strong) NSMutableArray *array;

@end

@implementation NSConditionDemo
- (instancetype)init {
    self = [super init];
    if (self) {
        self.array = [NSMutableArray array];
        self.lock = [[NSRecursiveLock alloc] init];
        self.cond = [[NSCondition alloc] init];
    }
    return self;
}

- (void)otherTest {
    [[[NSThread alloc] initWithTarget:self selector:@selector(__remove) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__add) object:nil] start];
    
}

- (void)__add {
    [self.lock lock];
    sleep(1);
    NSLog(@"添加了元素");
    [self.array addObject:@"test"];
    [self.cond signal];
    [self.lock unlock];
}

- (void)__remove {
    [self.lock lock];
    NSLog(@"__remove - begin");
    if (self.array.count == 0) {
        [self.cond wait];
    }
    sleep(1);
    [self.array removeLastObject];
    NSLog(@"删除了元素");
    [self.lock unlock];
}

@end
