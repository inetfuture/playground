//
//  ClassA.h
//  Syntax
//
//  Created by Aaron Wang on 6/24/15.
//  Copyright (c) 2015 inetfuture. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, EnumA) { EnumAValue1 = 10, EnumAValue2 };

extern NSString *ConstA;

@interface ClassA : NSObject

+ (void)useEnumA;

@end
