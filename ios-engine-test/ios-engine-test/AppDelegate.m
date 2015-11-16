//
//  AppDelegate.m
//  ios-engine-test
//
//  Created by Aaron Wang on 11/16/15.
//  Copyright © 2015 inetfuture. All rights reserved.
//

#import <TuisongbaoRealtimeEngine/TuisongbaoRealtimeEngine.h>
#import "AppDelegate.h"

@interface AppDelegate ()

@property (nonatomic) TREEngine *engine;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [TREDebug enable];
    self.engine = [[TREEngine alloc] initWithAppID:@"ab3d5241778158b2864c0852"
                                           options:@{
                                               kTREEngineOptionAuthEndpoint : [@"http://www.tuisongbao.com"
                                                   stringByAppendingString:@"/api/engineDemo/authUser"]
                                           }];
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
