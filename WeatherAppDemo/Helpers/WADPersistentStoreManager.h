//
//  WADPersistentStoreManager.h
//  WeatherAppDemo
//
//  Created by yunzhi lun on 13/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface WADPersistentStoreManager : NSObject

+ (void)initMagicalRecord;
+ (void)cleanUpMagicalRecord;

- (void)saveUserLocation:(CLLocation*)currentLocation;

@end
