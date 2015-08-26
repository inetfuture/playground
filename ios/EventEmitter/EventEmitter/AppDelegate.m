//
//  AppDelegate.m
//  EventEmitter
//
//  Created by Aaron Wang on 6/26/15.
//  Copyright (c) 2015 inetfuture. All rights reserved.
//

#import "AppDelegate.h"

#import "EventEmitterClient.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    EventEmitterClient *client = [[EventEmitterClient alloc] init];

    void (^helloHandler)() = ^void {
      NSLog(@"hello event triggered");
    };

    [client bind:@"hello" handler:helloHandler];
    [client bind:@"hello" handler:helloHandler];
    [client trigger:@"hello"];

    [client unbind:@"hello" handler:helloHandler];
    [client trigger:@"hello"];

    [client unbind:@"hello" handler:helloHandler];
    [client trigger:@"hello"];

    void (^withDataHandler)(NSString *data) = ^(NSString *data) {
      NSLog(@"withData event triggered, data: %@", data);
    };

    [client bind:@"withData" dataHandler:withDataHandler];
    [client bind:@"withData" dataHandler:withDataHandler];
    [client bind:@"withData" dataHandler:withDataHandler];

    [client trigger:@"withData" data:@"haha1"];

    [client unbind:@"withData" handler:withDataHandler];
    [client trigger:@"withData" data:@"haha2"];

    [client unbind:@"withData"];
    [client trigger:@"withData" data:@"haha3"];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of
    // temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application
    // and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should
    // use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application
    // state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate:
    // when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the
    // changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application
    // was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also
    // applicationDidEnterBackground:.
}

@end
