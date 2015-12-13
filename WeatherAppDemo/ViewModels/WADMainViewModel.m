//
//  WADMainViewModel.m
//  WeatherAppDemo
//
//  Created by yunzhi lun on 8/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import "WADMainViewModel.h"

@implementation WADMainViewModel

- (instancetype)initWithCurrentlyData:(CurrentlyData *)currentlyData dailyDataList:(NSArray *)dailyDataArr
{
    self = [super init];
    
    if (self){
        [self updateCurrentlyData:currentlyData dailyDataList:dailyDataArr];
    }
    
    return self;
}

- (void)updateCurrentlyData:(CurrentlyData *)currentlyData dailyDataList:(NSArray *)dailyDataArr
{
    _currentlyData = currentlyData;
    _dailyDataArr = dailyDataArr;
}

- (NSString *)getCurrentDate
{
    return [_commonMethods getDateString:_currentlyData.date];
}

- (NSString *)getCurrentWeatherSummary
{
    return _currentlyData.summary;
}

- (NSString *)getCurrentTemperature
{
    return _currentlyData.temperature ? [NSString stringWithFormat:@"%.1f°", [self fahrenheitToCelsius:[_currentlyData.temperature doubleValue]]] : @"";
}

- (double)fahrenheitToCelsius:(double)fahrenheitDegree
{
    return (fahrenheitDegree-32)/1.8;
}

- (CGFloat)getCurrentCellHeight:(WADDailyInfoCell *)currentCell
{
    CGFloat topAndBottomPadding = 15.0;
    
    return [currentCell.summary_lbl.text boundingRectWithSize:CGSizeMake(currentCell.summary_lbl.frame.size.width, MAXFLOAT)
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:@{
                                                       NSFontAttributeName : currentCell.summary_lbl.font
                                                       }
                                             context:nil].size.height+topAndBottomPadding;
}

@end
