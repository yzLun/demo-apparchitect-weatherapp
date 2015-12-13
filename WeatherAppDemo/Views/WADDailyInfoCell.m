//
//  WADDailyInfoCell.m
//  WeatherAppDemo
//
//  Created by yunzhi lun on 13/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import "WADDailyInfoCell.h"

@implementation WADDailyInfoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCell:(DailyData*)cellData
{
    self.date_lbl.text = [self.commonMethods getDateString:cellData.date];
    self.summary_lbl.text = cellData.summary;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
