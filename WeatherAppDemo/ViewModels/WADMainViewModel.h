//
//  WADMainViewModel.h
//  WeatherAppDemo
//
//  Created by yunzhi lun on 8/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Currentlydata.h"
#import "Dailydata.h"
#import "WADDailyInfoCell.h"

@interface WADMainViewModel : NSObject
@property (nonatomic, strong) CurrentlyData *currentlyData;
@property (nonatomic, strong) NSArray *dailyDataArr;
@property (nonatomic, strong) WADCommon *commonMethods;

- (instancetype)initWithCurrentlyData:(CurrentlyData *)currentlyDAta dailyDataList:(NSArray *)dailyDataArr;
- (void)updateCurrentlyData:(CurrentlyData *)currentlyDAta dailyDataList:(NSArray *)dailyDataArr;
- (NSString *)getCurrentDate;
- (NSString *)getCurrentWeatherSummary;
- (NSString *)getCurrentTemperature;
- (CGFloat)getCurrentCellHeight:(WADDailyInfoCell *)currentCell;

@end
