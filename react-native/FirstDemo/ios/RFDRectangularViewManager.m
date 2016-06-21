//
//  RFDRectangularViewManager.m
//  FirstDemo
//
//  Created by Aaron Wang on 6/20/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "RFDRectangularView.h"
#import "RFDRectangularViewManager.h"

@implementation RFDRectangularViewManager

RCT_EXPORT_MODULE()

- (UIView *)view {
    RFDRectangularView *view = [RFDRectangularView new];
    return view;
}

@end
