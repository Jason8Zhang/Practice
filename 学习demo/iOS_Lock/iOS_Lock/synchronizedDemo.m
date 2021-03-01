//
//  synchronizedDemo.m
//  iOS_Lock
//
//  Created by jason on 2021/2/26.
//

#import "synchronizedDemo.h"

@interface synchronizedDemo()

@end
@implementation synchronizedDemo
- (void)sellingTickets {
    @synchronized (self) {
        [super sellingTickets];
    }
}
@end
