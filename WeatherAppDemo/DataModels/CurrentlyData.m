//
//  CurrentlyData.m
//  WeatherAppDemo
//
//  Created by yunzhi lun on 13/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import "CurrentlyData.h"

@implementation CurrentlyData

// Insert code here to add functionality to your managed object subclass
+ (void)saveCurrentlyData:(NSDictionary *)response
{
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext){
        [self MR_truncateAllInContext:localContext];
        
        CurrentlyData *currentlyData = [self MR_createEntityInContext:localContext];
        currentlyData.date = [NSDate dateWithTimeIntervalSince1970:[response[@"time"] integerValue]];
        currentlyData.summary = response[@"summary"];
        currentlyData.temperature = response[@"temperature"];
    }];
}

+ (CurrentlyData *)getCurrentlyData
{
    return [self MR_findFirst];
}

@end
