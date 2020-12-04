//
//  Test.m
//  test
//
//  Created by jason on 2020/12/4.
//

#import "ChainGrammar.h"
@interface TestSomeThingMaker()
@property(nonatomic, copy) NSString *nameValue;
@property(nonatomic, strong) ConfigA configAValue;
@property(nonatomic, strong) ConfigB configbbb;
@property(nonatomic, strong) ConfigC configccc;
@end
@implementation TestSomeThingMaker
- (TestSomeThingMaker * _Nonnull (^)(NSString * _Nonnull))name {
    return ^TestSomeThingMaker *(NSString *name){
        self.nameValue = name;
        return self;
    };
}

- (TestSomeThingMaker * _Nonnull (^)(ConfigA _Nonnull))configA {
    return ^TestSomeThingMaker *(ConfigA configA) {
        self.configAValue = configA;
        return self;
    };
}

- (TestSomeThingMaker * _Nonnull (^)(ConfigB _Nonnull))configB {
    return ^TestSomeThingMaker *(ConfigB configbbb) {
        self.configbbb = configbbb;
        return self;
    };
}

- (ConfigCMaker)configCMaker {
    return ^TestSomeThingMaker *(ConfigC configc) {
        self.configccc = configc;
        return self;
    };
}

//+(void)doSomeThing:(void(^)(TestSomeThingMaker *maker))block {
//    TestSomeThingMaker *maker = TestSomeThingMaker.new;
//    !block?:block(maker);
//    NSLog(@"");
//}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name=%@,configa=%@,configb=%@,configc=%@", self.nameValue,self.configAValue,self.configbbb,self.configccc];
}
@end
