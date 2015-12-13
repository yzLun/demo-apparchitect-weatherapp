//
//  DataStorageTest.m
//  WeatherAppDemo
//
//  Created by yunzhi lun on 8/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <MagicalRecord/MagicalRecord.h>
#import "WADPersistentStoreManager.h"
#import "User_Location.h"
#import "CurrentlyData.h"
#import "DailyData.h"

@interface DataStorageTest : XCTestCase
@property (nonatomic) WADPersistentStoreManager *storeManager;
@end

@implementation DataStorageTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [WADPersistentStoreManager initMagicalRecord];
    
    self.storeManager = [[WADPersistentStoreManager alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    [WADPersistentStoreManager cleanUpMagicalRecord];
}

- (void)test_userCurrentLocation_been_saved {
    
    CLLocation *userCurrentLocation = [[CLLocation alloc] initWithLatitude:-33.8810251968196 longitude:151.2141421821213];
    [self.storeManager saveUserLocation:userCurrentLocation];
    NSLog(@"%@", [User_Location getCurrentLocationDict]);
    XCTAssertEqual([User_Location MR_countOfEntities], 1, @"One user location has been saved");
}

- (void)test_weatherCurrentlyData_been_saved
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"weather" ofType:@"json"];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions error:nil];
    
    [CurrentlyData saveCurrentlyData:response[@"currently"]];
    XCTAssertNotNil([CurrentlyData getCurrentlyData], @"Currently data has been saved");
    
}

- (void)test_saveWeatherDailyData_performance {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"weather" ofType:@"json"];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions error:nil];
    
    [self measureBlock:^{
        [DailyData saveDailyData:response[@"daily"][@"data"]];
    }];
}

@end
