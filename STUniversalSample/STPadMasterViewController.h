//
//  STPadMasterViewController.h
//  STUniversalSample
//
//  Created by EIMEI on 2013/04/01.
//  Copyright (c) 2013年 stack3. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol STPadMasterViewControllerDelegate;

@interface STPadMasterViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) id<STPadMasterViewControllerDelegate> delegate;

@end

@protocol STPadMasterViewControllerDelegate <NSObject>

- (void)padMasterViewControllerDidSelectTimeline:(STPadMasterViewController *)sender;
- (void)padMasterViewControllerDidSelectUser:(STPadMasterViewController *)sender;
- (void)padMasterViewController:(STPadMasterViewController *)sender didSelectSettingsInView:(UIView *)inView;

@end