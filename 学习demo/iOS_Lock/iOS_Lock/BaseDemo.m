//
//  BaseDemo.m
//  iOS_Lock
//
//  Created by jason on 2021/2/26.
//

#import "BaseDemo.h"

@interface BaseDemo()
@property (assign, nonatomic) int ticketsCount;
@end
@implementation BaseDemo

- (void)ticketTest{
    self.ticketsCount = 50;
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    for (NSInteger i = 0; i < 5; i++) {
        dispatch_async(queue, ^{
            for (int i = 0; i < 10; i++) {
                [self sellingTickets];
            }
        });
    }
    
}

- (void)sellingTickets{
    int oldMoney = self.ticketsCount;
    sleep(.2);
    oldMoney -= 1;
    self.ticketsCount = oldMoney;
    
    NSLog(@"当前剩余票数-> %d", oldMoney);
}
@end
