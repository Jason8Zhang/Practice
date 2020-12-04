//
//  Test.h
//  test
//
//  Created by jason on 2020/12/4.
//

#import <Foundation/Foundation.h>
#import "Config.h"
typedef Config* ConfigA;
typedef Config* ConfigB;
typedef Config* ConfigC;
@class TestSomeThingMaker;
typedef TestSomeThingMaker*_Nullable(^ConfigCMaker)(ConfigC _Nullable );
NS_ASSUME_NONNULL_BEGIN

@interface TestSomeThingMaker : NSObject
@property(nonatomic, copy, readonly) TestSomeThingMaker *(^name)(NSString *name);
@property (nonatomic, copy, readonly) TestSomeThingMaker *(^configA)(ConfigA configA);
@property(nonatomic, copy, readonly) TestSomeThingMaker *(^configB)(ConfigB configbbb);
@property(nonatomic, copy, readonly) ConfigCMaker configCMaker;

//+(void)doSomeThing:(void(^)(TestSomeThingMaker *maker))block;
@end

NS_ASSUME_NONNULL_END
