//
//  MasterViewController.m
//  CocoaPodgress
//
//  Created by Matt Bowman on 11/6/13.
//  Copyright (c) 2013 Citrrus, LLC. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController ()

@property (nonatomic) NSArray *progressViews;

@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSArray*)progressViews
{
    return @[
             @"BJRangeSliderWithProgress",
             @"BTProgressView",
             @"CERoundProgressView",
             @"CSColorizedProgressView",
             @"DACircularProgress",
             @"DAProgressOverlayView",
             @"DCProgressView",
             @"DDProgressView",
             @"FFCircularProgressView",
             @"HKCircularProgressView",
             @"HTProgressHUD",
             @"JNJProgressButton",
             @"JSProgressHUD",
             @"KAProgressLabel",
             @"KKProgressToolbar",
             @"LDProgressView",
             @"LLACircularProgressView",
             @"MACircleProgressIndicator",
             @"MCCircularProgressView",
             @"MDRadialProgress",
             @"MMProgressHUD",
             @"MRProgress",
             @"NJKWebViewProgress",
             @"OJFSegmentedProgressView",
             @"PICircularProgressView",
             @"ProgressHUD",
             @"SDWebImage-ProgressView",
             @"SGNavigationProgress",
             @"SVProgressHUD",
             @"SuProgress",
             @"THCircularProgressView",
             @"THProgressView",
             @"YLProgressBar"
             ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.progressViews.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = self.progressViews[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.progressViews[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
