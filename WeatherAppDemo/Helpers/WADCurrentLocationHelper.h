//
//  WADCurrentLocationHelper.h
//  WeatherAppDemo
//
//  Created by yunzhi lun on 13/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void (^LocationUpdateComplete)();

@interface WADCurrentLocationHelper : NSObject <CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, copy) LocationUpdateComplete locationUpdateComplete;

- (instancetype)initWithCommonClass:(WADCommon *)commonClass persistentStoreManager:(WADPersistentStoreManager *)storeManager;
- (void)startLocationService;
@end
