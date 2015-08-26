//
//  EventEmitter.h
//  EventEmitter
//
//  Created by Aaron Wang on 7/14/15.
//  Copyright (c) 2015 inetfuture. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^EventEmitterHandler)();
typedef void (^EventEmitterDataHandler)(id data);

@interface EventEmitter : NSObject

- (void)bind:(NSString *)eventName handler:(EventEmitterHandler)handler;

- (void)bind:(NSString *)eventName dataHandler:(EventEmitterDataHandler)handler;

- (void)unbind:(NSString *)eventName handler:(id)handler;

- (void)unbind:(NSString *)eventName;

- (void)trigger:(NSString *)eventName;

- (void)trigger:(NSString *)eventName data:(id)data;

@end
