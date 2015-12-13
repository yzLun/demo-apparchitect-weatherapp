//
//  WADMainViewController.m
//  WeatherAppDemo
//
//  Created by yunzhi lun on 13/12/2015.
//  Copyright © 2015 yunzhi_lun. All rights reserved.
//

#import "WADMainViewController.h"
#import "WADCurrentLocationHelper.h"
#import "WADWeatherService.h"
#import "WADAPIClient.h"
#import "User_Location.h"
#import "CurrentlyData.h"
#import "DailyData.h"
#import "WADDailyInfoCell.h"
#import "WADMainViewModel.h"

@interface WADMainViewController ()
// UI
@property (weak, nonatomic) IBOutlet UILabel *date_lbl;
@property (weak, nonatomic) IBOutlet UILabel *summary_lbl;
@property (weak, nonatomic) IBOutlet UILabel *temp_lbl;
@property (weak, nonatomic) IBOutlet UITableView *forecastingTable;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;

@property (nonatomic, strong) WADCurrentLocationHelper *currentLocationHelper;
@property (nonatomic, strong) WADWeatherService *weatherService;
@property (nonatomic, strong) WADMainViewModel *mainViewModel;
@end

@implementation WADMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initMainViewModel];
    [self initLoadingIndicator];
    
    // Getting current location
    self.currentLocationHelper = [[WADCurrentLocationHelper alloc] initWithCommonClass:[WADCommon new] persistentStoreManager:[WADPersistentStoreManager new]];
    [self.currentLocationHelper startLocationService];
    
    // Getting weather report from cloud
    typeof(self) __weak weakSelf = self;
    [self.currentLocationHelper setLocationUpdateComplete:^{
        weakSelf.weatherService = (WADWeatherService *)[WADAPIClient serviceWithDefaultServiceClass:[WADWeatherService class]];
        weakSelf.weatherService.userCurrentLocation = [User_Location getCurrentLocationDict];
        
        // Show loading indicator on right top
        [weakSelf.spinner startAnimating];
        
        [weakSelf.weatherService getWeatherByLocationWithCompletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
            if (!error) {
                // Hide loading indicator
                [weakSelf.spinner stopAnimating];
                
                // Process response data if returned value not null
                [CurrentlyData saveCurrentlyData:responseObject[@"currently"]];
                [DailyData saveDailyData:responseObject[@"daily"][@"data"]];
                
                // Blind new data to UI
                [weakSelf updateWeatherData];
            }
            else {
                NSLog(@"%@", error);
            }
        }];
    }];
    
    [self updateUI];
}

- (void)initMainViewModel
{
    self.mainViewModel = [[WADMainViewModel alloc] initWithCurrentlyData:[CurrentlyData getCurrentlyData] dailyDataList:[DailyData getDailyData]];
    self.mainViewModel.commonMethods = [WADCommon new];
}

- (void)updateWeatherData
{
    [self.mainViewModel updateCurrentlyData:[CurrentlyData getCurrentlyData] dailyDataList:[DailyData getDailyData]];
    [self updateUI];
}

- (void)updateUI
{
    self.date_lbl.text = [self.mainViewModel getCurrentDate];
    self.summary_lbl.text = [self.mainViewModel getCurrentWeatherSummary];
    self.temp_lbl.text = [self.mainViewModel getCurrentTemperature];
    [self.forecastingTable reloadData];
}

- (void)initLoadingIndicator
{
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.spinner];
}

#pragma UITableView delegate and data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.mainViewModel.dailyDataArr count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Dynamic row height coresponding to weather summary text height
    WADDailyInfoCell *currentDailyCell = (WADDailyInfoCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return [self.mainViewModel getCurrentCellHeight:currentDailyCell];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WADDailyInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DailyCell"];
    cell.commonMethods = [WADCommon new];
    [cell configureCell:self.mainViewModel.dailyDataArr[indexPath.row]];
    
    return cell;
}

@end
