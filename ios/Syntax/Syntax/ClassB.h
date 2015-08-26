//
//  ClassB.h
//  Syntax
//
//  Created by Aaron Wang on 6/24/15.
//  Copyright (c) 2015 inetfuture. All rights reserved.
//

#import <Foundation/Foundation.h>

// NOTE: Cause "Redefinition of 'EnumA'" compliation error, but won't cause error if not imported anywhere
//   if ClassA if imported after this, then it's ClassA's error
// typedef NS_ENUM(NSInteger, EnumA) { EnumAValue1, EnumAValue2 };

// NOTE: Cause "duplicate symbol _ConstA" link error
// extern NSString *ConstA;

// NOTE: Cause "duplicate symbol _ConstB" without the extern
// NSString *ConstB;

@interface ClassB : NSObject

+ (void)useEnumA;

@end
