//
//  ViewController.m
//  iOS_Lock
//
//  Created by jason on 2021/2/26.
//

#import "ViewController.h"
#import "OSSpinLockDemo.h"
#import "os_unfair_lockDemo.h"
#import "mutexDemo.h"
#import "mutexDemo2.h"
#import "mutexDemo3.h"
#import "NSLockDemo.h"
#import "RecursiveLockDemo.h"
#import "NSConditionDemo.h"
#import "NSConditionLockDemo.h"
#import "semaphoreDemo.h"
#import "synchronizedDemo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    [self ticketsTest];
//        [[OSSpinLockDemo new] ticketTest];
//    [[os_unfair_lockDemo new] ticketTest];
//    [[mutexDemo new] ticketTest];
//    [[mutexDemo2 new] ticketTest];
//    [[mutexDemo3 new] otherTest];
//    [[NSLockDemo new] ticketTest];
//    [[RecursiveLockDemo new] ticketTest];
//    [[NSConditionDemo new] otherTest];
//    [[NSConditionLockDemo new] otherTest];
//    [[semaphoreDemo new] otherTest];
    [[synchronizedDemo new] ticketTest];
}


@end
