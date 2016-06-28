//
//  DailyData.m
//  WeatherAppDemo
//
//  Created by yunzhi lun on 13/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import "DailyData.h"

@implementation DailyData

// Insert code here to add functionality to your managed object subclass
+ (void)saveDailyData:(NSArray *)responseArr
{
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
        
        /**
         *  Remove current data and update with new data
         */
        [self MR_truncateAllInContext:localContext];
        
        for (NSDictionary *item in responseArr)
        {
            DailyData *dailyData = [self MR_createEntityInContext:localContext];
            dailyData.date = [NSDate dateWithTimeIntervalSince1970:[item[@"time"] integerValue]];
            dailyData.summary = item[@"summary"];
        }
    }];
}

+ (NSArray *)getDailyData
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date"
                                                                   ascending:YES];
    return [[self MR_findAll] sortedArrayUsingDescriptors:@[sortDescriptor]];
}

@end
