//
//  WADPersistentStoreManager.m
//  WeatherAppDemo
//
//  Created by yunzhi lun on 13/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import "WADPersistentStoreManager.h"
#import "User_Location.h"

@implementation WADPersistentStoreManager

// Using MagicalRecord to handle core data
+ (void)initMagicalRecord
{
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"DemoDB"];
}

+ (void)cleanUpMagicalRecord
{
    [MagicalRecord cleanUp];
}

- (void)saveUserLocation:(CLLocation*)currentLocation
{
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
        User_Location *userLocation = [User_Location MR_findFirst];
        if (!userLocation)
        {
            userLocation = [User_Location MR_createEntityInContext:localContext];
        }
        userLocation.latitude = [NSNumber numberWithDouble:currentLocation.coordinate.latitude];
        userLocation.longitude = [NSNumber numberWithDouble:currentLocation.coordinate.longitude];
    }];
}

@end
