//
//  User_Location.m
//  WeatherAppDemo
//
//  Created by yunzhi lun on 13/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import "User_Location.h"

@implementation User_Location

// Insert code here to add functionality to your managed object subclass
+ (NSDictionary *)getCurrentLocationDict
{
    User_Location *userLocation = [self MR_findFirst];
    return  @{ @"lat" : userLocation.latitude, @"long" : userLocation.longitude };
}

@end
