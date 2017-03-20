//
//  main.m
//  HZK16
//
//  Created by Rostired on 17/3/20.
//  Copyright © 2017年 rostired. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZK16Helper.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        HZK16Helper *helper = [HZK16Helper new];
        [helper generateDotMatrix:@"凌"];
    }
    return 0;
}
