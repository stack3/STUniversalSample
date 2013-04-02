//
//  STSplitViewController.m
//  STUniversalSample
//
//  Created by EIMEI on 2013/04/01.
//  Copyright (c) 2013年 stack3. All rights reserved.
//

#import "STSplitViewController.h"
#import "STTimelineViewController.h"
#import "STUserViewController.h"
#import "STSettingsViewController.h"

@implementation STSplitViewController {
    __strong STPadMasterViewController *_masterViewController;
    __strong STTimelineViewController *_timelineViewController;
    __strong STUserViewController *_userViewController;
    __strong STSettingsViewController *_settingsViewController;
    __strong UIPopoverController *_popoverController;
}

- (id)init
{
    self = [super init];
    if (self) {
        _masterViewController = [[STPadMasterViewController alloc] init];
        _masterViewController.delegate = self;
        
        _timelineViewController = [[STTimelineViewController alloc] init];
        _userViewController = [[STUserViewController alloc] init];
        _settingsViewController = [[STSettingsViewController alloc] init];
        
        self.viewControllers = @[_masterViewController, _timelineViewController];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - STPadMasterViewControllerDelegate

- (void)padMasterViewControllerDidSelectTimeline:(STPadMasterViewController *)sender
{
    self.viewControllers = @[_masterViewController, _timelineViewController];
}

- (void)padMasterViewControllerDidSelectUser:(STPadMasterViewController *)sender
{
    self.viewControllers = @[_masterViewController, _userViewController];
}

- (void)padMasterViewController:(STPadMasterViewController *)sender didSelectSettingsInView:(UIView *)inView
{
    _popoverController = [[UIPopoverController alloc] initWithContentViewController:_settingsViewController];
    [_popoverController presentPopoverFromRect:inView.bounds
                                        inView:inView
                      permittedArrowDirections:UIPopoverArrowDirectionLeft
                                      animated:YES];
}

#pragma mark - UIPopoverControllerDelegate

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    _popoverController = nil;
}

@end
