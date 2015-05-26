//
//  XYZToDoItem.h
//  ToDoList
//
//  Created by Aaron Wang on 5/25/15.
//  Copyright (c) 2015 Aaron Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

- (void)markAsCompleted:(BOOL)isComplete;

@end
