//
//  RFDRectangularView.m
//  FirstDemo
//
//  Created by Aaron Wang on 6/20/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "RFDRectangularView.h"

@implementation RFDRectangularView

- (instancetype)init {
    self = [super init];
    if (self) {
        _color = [UIColor purpleColor];
    }

    return self;
}

- (void)drawRect:(CGRect)rect {
    [self.color setFill];
    CGContextFillRect(UIGraphicsGetCurrentContext(), rect);
}

@end
