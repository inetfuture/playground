//
//  XYZToDoItem.m
//  ToDoList
//
//  Created by Aaron Wang on 5/25/15.
//  Copyright (c) 2015 Aaron Wang. All rights reserved.
//

#import "XYZToDoItem.h"

@interface XYZToDoItem ()
@property NSDate *completionDate;
@end

@implementation XYZToDoItem

- (void)makrAsCompleted:(BOOL)isCompleted {
    self.completed = isCompleted;
    [self setCompletionDate];
}

- (void)setCompletionDate {
    if (self.completed) {
        self.completionDate = [NSDate date];
    } else {
        self.completionDate = nil;
    }
}

@end
