//
//  STUserViewController.m
//  STUniversalSample
//
//  Created by EIMEI on 2013/04/01.
//  Copyright (c) 2013年 stack3. All rights reserved.
//

#import "STUserViewController.h"

@implementation STUserViewController {
    __weak IBOutlet UIImageView *_userThumbnailView;
    __weak IBOutlet UILabel *_usernameLabel;
    __weak IBOutlet UILabel *_profileLabel;
    __weak IBOutlet UILabel *_locationLabel;
}

- (id)init
{
    self = [super initWithNibName:@"STUserViewController" bundle:nil];
    if (self) {
        //
        // For iPhone.
        //
        self.tabBarItem.title = @"User";
        self.tabBarItem.image = [UIImage imageNamed:@"GlyphishIcons/111-user"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _userThumbnailView.image = [UIImage imageNamed:@"GlyphishIcons/135-hockeymask"];
    _usernameLabel.text = @"Jason Voorhees";
    _locationLabel.text = @"Location: Camp Crystal Lake";
    _profileLabel.text = @"Jason Voorhees is a fictional character from the Friday the 13th series. He first appeared in Friday the 13th (1980) as the young son of camp cook-turned-murderer, Mrs. Voorhees, in which he was portrayed by Ari Lehman.\nFrom http://en.wikipedia.org/wiki/Jason_Voorhees";
}

- (void)viewDidLayoutSubviews
{
    //
    // Adjust profileLabel height.
    //
    CGRect profileLabelFrame = _profileLabel.frame;
    profileLabelFrame.size.height = FLT_MAX;
    profileLabelFrame.size = [_profileLabel sizeThatFits:profileLabelFrame.size];
    _profileLabel.frame = profileLabelFrame;
}

@end
