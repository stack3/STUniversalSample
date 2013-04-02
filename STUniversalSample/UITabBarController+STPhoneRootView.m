//
//  UITabBarController+STPhoneRootView.m
//  STUniversalSample
//
//  Created by EIMEI on 2013/04/01.
//  Copyright (c) 2013年 stack3. All rights reserved.
//

#import "UITabBarController+STPhoneRootView.h"
#import "STTimelineViewController.h"
#import "STUserViewController.h"
#import "STSettingsViewController.h"

@implementation UITabBarController (STPhoneRootView)

+ (id)tabBarControllerForRootView
{
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    STTimelineViewController *timelineViewController = [[STTimelineViewController alloc] init];
    STUserViewController *userViewController = [[STUserViewController alloc] init];
    STSettingsViewController *settingsViewController = [[STSettingsViewController alloc] init];

    tabBarController.viewControllers = @[timelineViewController, userViewController, settingsViewController];
    
    return tabBarController;
}

@end
