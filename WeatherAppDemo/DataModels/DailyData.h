//
//  DailyData.h
//  WeatherAppDemo
//
//  Created by yunzhi lun on 13/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface DailyData : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
+ (void)saveDailyData:(NSArray *)responseArr;
+ (NSArray *)getDailyData;
@end

NS_ASSUME_NONNULL_END

#import "DailyData+CoreDataProperties.h"
