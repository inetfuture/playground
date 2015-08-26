//
//  NetworkLib.m
//  NetworkLib
//
//  Created by Aaron Wang on 8/19/15.
//  Copyright (c) 2015 inetfuture. All rights reserved.
//

#import "NetworkLib.h"
#import "AFNetworking.h"

@implementation NetworkLib

- (void)getGithubReposForUser:(NSString *)user
                  withSuccess:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"NetworkLib" ofType:@"plist"];
    NSMutableDictionary *config = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSString *apiHost = [config objectForKey:@"apiHost"];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    [manager GET:[NSString stringWithFormat:@"%@/users/%@/repos", apiHost, user]
        parameters:nil
        success:^(AFHTTPRequestOperation *operation, id responseObject) {
          success(responseObject);
        }
        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          failure(error);
        }];
}

@end
