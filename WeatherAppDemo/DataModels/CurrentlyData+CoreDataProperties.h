//
//  CurrentlyData+CoreDataProperties.h
//  WeatherAppDemo
//
//  Created by yunzhi lun on 13/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CurrentlyData.h"

NS_ASSUME_NONNULL_BEGIN

@interface CurrentlyData (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *summary;
@property (nullable, nonatomic, retain) NSNumber *temperature;

@end

NS_ASSUME_NONNULL_END
