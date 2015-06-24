//
//  ClassC.m
//  Syntax
//
//  Created by Aaron Wang on 6/24/15.
//  Copyright (c) 2015 inetfuture. All rights reserved.
//

#import "ClassC.h"

#import "ClassA.h"
#import "ClassB.h"

@implementation ClassC

+ (void)run {
    [ClassA useEnumA];
    [ClassB useEnumA];
    NSLog(@"Class C EnumAValue2: %d", EnumAValue2);

    NSLog(@"Class C ConstA: %@", ConstA);

    // NOTE: use of undeclared identifier
    //    NSLog(@"Class C ConstB: %@", ConstB);
}

@end
