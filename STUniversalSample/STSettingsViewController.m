//
//  STSettingsViewController.m
//  STUniversalSample
//
//  Created by EIMEI on 2013/04/01.
//  Copyright (c) 2013年 stack3. All rights reserved.
//

#import "STSettingsViewController.h"

@implementation STSettingsViewController {
    __weak IBOutlet UITableView *_tableView;
    __strong NSMutableArray *_sections;
}

- (id)init
{
    self = [super initWithNibName:@"STSettingsViewController" bundle:nil];
    if (self) {
        //
        // For iPhone.
        //
        self.tabBarItem.title = @"Settings";
        self.tabBarItem.image = [UIImage imageNamed:@"GlyphishIcons/19-gear"];
        //
        // For iPad.
        //
        self.contentSizeForViewInPopover = CGSizeMake(320, 320);
        
        _sections = [NSMutableArray arrayWithCapacity:2];
        NSMutableArray *rows = [NSMutableArray arrayWithCapacity:2];
        [rows addObject:@"Share with Twitter"];
        [rows addObject:@"Share with Facebook"];
        [rows addObject:@"Share with Tumblr"];
        [_sections addObject:rows];
        
        rows = [NSMutableArray arrayWithCapacity:2];
        [rows addObject:@"About us"];
        [rows addObject:@"Credit"];
        [_sections addObject:rows];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _tableView.dataSource = self;
    _tableView.delegate = self;
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_sections objectAtIndex:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Share";
    } else {
        return @"Information";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString *row = [[_sections objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = row;
    return cell;
}

@end
