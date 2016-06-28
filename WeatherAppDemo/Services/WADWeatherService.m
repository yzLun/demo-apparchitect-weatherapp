//
//  WADWeatherService.m
//  WeatherAppDemo
//
//  Created by yunzhi lun on 13/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import "WADWeatherService.h"
#import "WADConfiguration.h"

@implementation WADWeatherService

- (NSString*)apiHost:(NSString *)actions
{
    // Get baseURL depends on Debug or Release configuration
    WADConfiguration *env_config = [WADConfiguration defaultConfiguration];
    NSString *baseURL = [env_config settingForKey:@"baseURL"];
    NSString *apiKey = [env_config settingForKey:@"apiKey"];
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@/", baseURL, apiKey];
    
    return [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (void)getWeatherByLocationWithCompletion:(RequestCompletionBlock)completion
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@,%@", [self apiHost:@""], _userCurrentLocation[@"lat"], _userCurrentLocation[@"long"]];
    [self sendGetRequest:urlString parameters:nil withCompletion:completion];
}

@end
