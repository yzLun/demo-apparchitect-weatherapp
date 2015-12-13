//
//  WADCurrentLocationHelper.m
//  WeatherAppDemo
//
//  Created by yunzhi lun on 13/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import "WADCurrentLocationHelper.h"

@interface WADCurrentLocationHelper ()
@property (nonatomic, strong) WADCommon *commonMethods;
@property (nonatomic, strong) WADPersistentStoreManager *storeManager;
@end

@implementation WADCurrentLocationHelper

- (instancetype)initWithCommonClass:(WADCommon *)commonMethods persistentStoreManager:(WADPersistentStoreManager *)storeManager
{
    self = [super self];
    
    if (self)
    {
        self.commonMethods = commonMethods;
        self.storeManager = storeManager;
    }
    
    return self;
}

- (void)startLocationService
{
    self.locationManager = [[CLLocationManager alloc] init];
    
    self.locationManager.delegate = self;
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    self.locationManager.distanceFilter = 10;
    
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [self.commonMethods showAlertWithTitle:@"Error" message:@"Failed to Get Your Location"];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation *currentLocation = newLocation;
    
    // Save user current location in core data
    [self.storeManager saveUserLocation:currentLocation];
    
    [self.locationManager stopUpdatingLocation];
    
    if (self.locationUpdateComplete){
        self.locationUpdateComplete();
    }
}

@end
