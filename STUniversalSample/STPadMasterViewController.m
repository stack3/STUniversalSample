//
//  STPadMasterViewController.m
//  STUniversalSample
//
//  Created by EIMEI on 2013/04/01.
//  Copyright (c) 2013年 stack3. All rights reserved.
//

#import "STPadMasterViewController.h"

typedef enum {
    _STMenuItemTimeline = 0,
    _STMenuItemUser,
    _STNumebrOfMenuItems
} _STMenuItem;

@implementation STPadMasterViewController {
    __weak IBOutlet UITableView *_tableView;
    __weak IBOutlet UIButton *_settingsButton;
}

- (id)init
{
    self = [super initWithNibName:@"STPadMasterViewController" bundle:nil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
    
    [_settingsButton addTarget:self action:@selector(didTapSettingsButton) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _STNumebrOfMenuItems;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"CellId";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.imageView.contentMode = UIViewContentModeCenter;
    }
    
    if (indexPath.row == _STMenuItemTimeline) {
        cell.textLabel.text = @"Timeline";
        cell.imageView.image = [UIImage imageNamed:@"GlyphishIcons/53-house"];
    } else if (indexPath.row == _STMenuItemUser) {
        cell.textLabel.text = @"User";
        cell.imageView.image = [UIImage imageNamed:@"GlyphishIcons/111-user"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _STMenuItemTimeline) {
        [_delegate padMasterViewControllerDidSelectTimeline:self];
    } else if (indexPath.row == _STMenuItemUser) {
        [_delegate padMasterViewControllerDidSelectUser:self];
    }
}

#pragma mark - Button Events

- (void)didTapSettingsButton
{
    [_delegate padMasterViewController:self didSelectSettingsInView:_settingsButton];
}

@end
