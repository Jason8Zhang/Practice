//
//  main.m
//  ChainGrammar
//
//  Created by jason on 2020/12/4.
//

#import <Foundation/Foundation.h>
#import "ChainGrammar.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        ConfigA configa= Config.new;
        TestSomeThingMaker *maker = TestSomeThingMaker.new;
        maker.name(@"123").configA(configa);
        NSLog(@"%@",maker.description);
    }
    return 0;
}
