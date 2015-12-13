//
//  WADAPIClient.h
//  WeatherAppDemo
//
//  Created by yunzhi lun on 13/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void (^RequestCompletionBlock)(NSURLSessionDataTask*, id, NSError*);

@interface WADAPIClient : NSObject

+ (instancetype)serviceWithDefaultServiceClass:(Class)serviceClass;

- (NSString*)apiHost:(NSString *)actions;
- (void)sendGetRequest:(NSString *)hostURL parameters:(NSDictionary *)params withCompletion:(RequestCompletionBlock)completion;
- (void)sendPostRequest:(NSString *)hostURL parameters:(NSDictionary *)params withCompletion:(RequestCompletionBlock)completion;

@end
