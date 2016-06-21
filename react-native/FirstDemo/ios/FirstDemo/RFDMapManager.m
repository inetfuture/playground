//
//  RCTMapManager.m
//  FirstDemo
//
//  Created by Aaron Wang on 6/20/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <MapKit/MapKit.h>

#import "RFDMapManager.h"

@implementation RFDMapManager

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(pitchEnabled, BOOL)

- (UIView *)view {
    return [[MKMapView alloc] init];
}

@end
