//
//  EventEmitter.m
//  EventEmitter
//
//  Created by Aaron Wang on 7/14/15.
//  Copyright (c) 2015 inetfuture. All rights reserved.
//

#import "EventEmitter.h"

#pragma mark - EventEmitterHandlerWrapper

@interface EventEmitterHandlerWrapper : NSObject

@property id handler;
@property BOOL handleData;

- (void)handle:(id)data;

@end

@implementation EventEmitterHandlerWrapper

- initWithHandler:(id)handler handleData:(BOOL)handleData {
    if (self = [super init]) {
        self.handler = handler;
        self.handleData = handleData;
    }

    return self;
}

- (void)handle:(id)data {
    if (self.handleData) {
        ((EventEmitterDataHandler)self.handler)(data);
    } else {
        ((EventEmitterHandler)self.handler)();
    }
}

@end

#pragma mark - EventEmitter

@interface EventEmitter ()

@property NSMutableDictionary *eventHandlersMap;

@end

@implementation EventEmitter

- (id)init {
    if (self = [super init]) {
        self.eventHandlersMap = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)bind:(NSString *)eventName handler:(EventEmitterHandler)handler {
    [self bind:eventName whateverHandler:handler handleData:NO];
}

- (void)bind:(NSString *)eventName dataHandler:(EventEmitterDataHandler)handler {
    [self bind:eventName whateverHandler:handler handleData:YES];
}

- (void)bind:(NSString *)eventName whateverHandler:(id)handler handleData:(BOOL)handleData {
    EventEmitterHandlerWrapper *handlerWrapper =
        [[EventEmitterHandlerWrapper alloc] initWithHandler:handler handleData:handleData];

    NSMutableArray *eventHandlers = self.eventHandlersMap[eventName];
    if (!eventHandlers) {
        eventHandlers = [NSMutableArray array];
        self.eventHandlersMap[eventName] = eventHandlers;
    }

    [eventHandlers addObject:handlerWrapper];
}

- (void)unbind:(NSString *)eventName handler:(id)handler {
    NSMutableArray *eventHandlers = self.eventHandlersMap[eventName];
    if (!eventHandlers) {
        return;
    }

    NSInteger index = -1;
    NSInteger removeIndex = -1;
    for (EventEmitterHandlerWrapper *handlerWrapper in eventHandlers) {
        index++;
        if (handlerWrapper.handler == handler) {
            removeIndex = index;
            // Remove one at most
            break;
        }
    }

    if (removeIndex > -1) {
        [eventHandlers removeObjectAtIndex:removeIndex];
    }
}

- (void)unbind:(NSString *)eventName {
    [self.eventHandlersMap removeObjectForKey:eventName];
}

- (void)trigger:(NSString *)eventName {
    [self trigger:eventName data:nil];
}

- (void)trigger:(NSString *)eventName data:(id)data {
    NSMutableArray *eventHandlers = self.eventHandlersMap[eventName];
    if (!eventHandlers) {
        return;
    }

    for (EventEmitterHandlerWrapper *handlerWrapper in eventHandlers) {
        [handlerWrapper handle:data];
    }
}

@end
