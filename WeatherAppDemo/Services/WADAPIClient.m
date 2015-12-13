//
//  WADAPIClient.m
//  WeatherAppDemo
//
//  Created by yunzhi lun on 13/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import "WADAPIClient.h"

@implementation WADAPIClient

+ (instancetype)serviceWithDefaultServiceClass:(Class)serviceClass {
    return [self serviceWithClass:(serviceClass) ? serviceClass : [WADAPIClient class]];
}

+ (instancetype)serviceWithClass:(Class)serviceClass {
    return [[serviceClass alloc] init];
}

- (NSString*)apiHost:(NSString *)actions
{
    return @"";
}

// Using AFNetworking to make service calls
- (AFHTTPSessionManager *)setupHTTPrequestOperationManager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    return manager;
}

- (void)sendGetRequest:(NSString *)hostURL parameters:(NSDictionary *)params withCompletion:(RequestCompletionBlock)completion
{
    AFHTTPSessionManager *manager = [self setupHTTPrequestOperationManager];
    
    [manager GET:hostURL parameters:params progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        completion(task, responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(task, nil, error);
    }];
}

- (void)sendPostRequest:(NSString *)hostURL parameters:(NSDictionary *)params withCompletion:(RequestCompletionBlock)completion
{
    AFHTTPSessionManager *manager = [self setupHTTPrequestOperationManager];
    
    [manager POST:hostURL parameters:params progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        completion(task, responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(task, nil, error);
    }];
}

@end
