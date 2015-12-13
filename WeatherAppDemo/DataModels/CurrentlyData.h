//
//  CurrentlyData.h
//  WeatherAppDemo
//
//  Created by yunzhi lun on 13/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface CurrentlyData : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
+ (void)saveCurrentlyData:(NSDictionary *)response;
+ (CurrentlyData *)getCurrentlyData;
@end

NS_ASSUME_NONNULL_END

#import "CurrentlyData+CoreDataProperties.h"
