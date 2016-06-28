//
//  APIClientTest.m
//  WeatherAppDemo
//
//  Created by yunzhi lun on 8/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WADWeatherService.h"

@interface APIClientTest : XCTestCase
@property (nonatomic) WADWeatherService *weatherService;
@end

@implementation APIClientTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.weatherService = (WADWeatherService *)[WADAPIClient serviceWithDefaultServiceClass:[WADWeatherService class]];
    self.weatherService.userCurrentLocation =  @{ @"lat" : [NSNumber numberWithDouble:-33.8810251968196], @"long" : [NSNumber numberWithDouble:151.2141421821213] };
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_weatherService_create_properly
{
    XCTAssertNotNil(self.weatherService, "Weather service class has been created");
}

- (void)test_userCurrentLocation_create_properly
{
    XCTAssertNotNil(self.weatherService.userCurrentLocation, "User current location is available");
}

- (void)test_getWeatherData_correctly {
    
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"async api call"];
    [self.weatherService getWeatherByLocationWithCompletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        XCTAssertNotNil(responseObject, "Getting weather report from cloud successfully");
        [completionExpectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}

@end
