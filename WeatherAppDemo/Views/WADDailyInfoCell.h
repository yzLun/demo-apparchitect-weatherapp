//
//  WADDailyInfoCell.h
//  WeatherAppDemo
//
//  Created by yunzhi lun on 13/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DailyData.h"

@interface WADDailyInfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *date_lbl;
@property (weak, nonatomic) IBOutlet UILabel *summary_lbl;
@property (nonatomic, strong) WADCommon *commonMethods;

- (void)configureCell:(DailyData*)cellData;
@end
