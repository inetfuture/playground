//
//  NetworkLib.h
//  NetworkLib
//
//  Created by Aaron Wang on 8/19/15.
//  Copyright (c) 2015 inetfuture. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkLib : NSObject

- (void)getGithubReposForUser:(NSString *)user
                  withSuccess:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure;

@end
