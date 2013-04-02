//
//  STTimelineViewController.m
//  STUniversalSample
//
//  Created by EIMEI on 2013/04/01.
//  Copyright (c) 2013年 stack3. All rights reserved.
//

#import "STTimelineViewController.h"
#import "STPostViewCell.h"

@implementation STTimelineViewController {
    __weak IBOutlet UITableView *_tableView;
    __strong NSMutableArray *_posts;
    __strong STPostViewCell *_cellForHeight;
}

- (id)init
{
    self = [super initWithNibName:@"STTimelineViewController" bundle:nil];
    if (self) {
        self.tabBarItem.title = @"Timeline";
        self.tabBarItem.image = [UIImage imageNamed:@"GlyphishIcons/53-house"];
        
        _posts = [NSMutableArray arrayWithCapacity:100];
        for (int i = 0; i < 100; i++) {
            STPostData *data = [[STPostData alloc] init];
            if (i % 2 == 0) {
                data.userThumbnailImage = [UIImage imageNamed:@"GlyphishIcons/132-ghost"];
                data.username = @"Ghost";
                data.message = @"In traditional belief and fiction, a ghost (sometimes known as a spectre (British English) or specter (American English), phantom, apparition or spook) is the soul or spirit of a dead person or animal that can appear, in visible form or other manifestation, to the living.\nFrom http://en.wikipedia.org/wiki/Ghost";
            } else {
                data.userThumbnailImage = [UIImage imageNamed:@"GlyphishIcons/133-ufo"];
                data.username = @"UFO";
                data.message = @"An unidentified flying object, or UFO, in its most general definition, is any apparent anomaly in the sky (or near or on the ground, but observed hovering, landing, or departing into the sky) that is not readily identifiable as any known object or phenomenon by visual observation and/or use of associated instrumentation such as radar.\nFrom http://en.wikipedia.org/wiki/UFO";
            }
            [_posts addObject:data];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    _cellForHeight = [STPostViewCell loadFromNib];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    _cellForHeight = nil;
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"CellIdentifier";
    STPostViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [STPostViewCell loadFromNib];
    }

    STPostData *data = [_posts objectAtIndex:indexPath.row];
    [cell setData:data];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    STPostData *data = [_posts objectAtIndex:indexPath.row];
    [_cellForHeight setData:data];
    
    CGSize size = _tableView.frame.size;
    size.height = 2000;
    size = [_cellForHeight sizeThatFits:size];
    return size.height;
}

@end
