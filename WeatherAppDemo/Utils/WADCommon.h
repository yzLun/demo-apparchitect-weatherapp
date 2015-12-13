//
//  WADCommon.h
//  WeatherAppDemo
//
//  Created by yunzhi lun on 13/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WADCommon : NSObject

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;
- (NSString *)getDateString:(NSDate *)dateToConvert;

@end
