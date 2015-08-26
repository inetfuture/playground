//
//  ClassB.m
//  Syntax
//
//  Created by Aaron Wang on 6/24/15.
//  Copyright (c) 2015 inetfuture. All rights reserved.
//

#import "ClassB.h"

// NOTE: Cause "duplicate symbol _ConstA" link error" even without the declaration in header
// NSString *ConstA = @"From Class B";

// NOTE: static make its scope only in this file
static NSString *ConstA = @"From Class B";

// NOTE: can not be accessed from other class since it's not declared in header
NSString *ConstB = @"From Class B";

// Won't cause redefinition error
typedef NS_ENUM(NSInteger, EnumA) { EnumAValue1, EnumAValue2, EnumAValue3 };

@implementation ClassB

+ (void)useEnumA {
    NSLog(@"Class B EnumAValue3: %d", EnumAValue3);
}

@end
