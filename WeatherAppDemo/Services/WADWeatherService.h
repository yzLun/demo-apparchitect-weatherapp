//
//  WADWeatherService.h
//  WeatherAppDemo
//
//  Created by yunzhi lun on 13/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import "WADAPIClient.h"
#import "User_Location.h"

@interface WADWeatherService : WADAPIClient
@property (nonatomic, strong) NSDictionary *userCurrentLocation;

- (void)getWeatherByLocationWithCompletion:(RequestCompletionBlock)completion;
@end
