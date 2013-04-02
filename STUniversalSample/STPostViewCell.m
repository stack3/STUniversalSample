//
//  STPostViewCell.m
//  STUniversalSample
//
//  Created by EIMEI on 2013/04/02.
//  Copyright (c) 2013年 stack3. All rights reserved.
//

#import "STPostViewCell.h"

@implementation STPostViewCell {
    __weak IBOutlet UIImageView *_userThumbnailView;
    __weak IBOutlet UILabel *_usernameLabel;
    __weak IBOutlet UILabel *_messageLabel;
}

+ (id)loadFromNib
{
    NSString *nibName = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    return [[nib instantiateWithOwner:nil options:nil] objectAtIndex:0];
}

- (void)setData:(STPostData *)data
{
    _userThumbnailView.image = data.userThumbnailImage;
    _usernameLabel.text = data.username;
    _messageLabel.text = data.message;
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGRect messageLabelFrame = _messageLabel.frame;
    messageLabelFrame.size.width = size.width - messageLabelFrame.origin.x - 20;
    messageLabelFrame.size.height = size.height;
    messageLabelFrame.size = [_messageLabel sizeThatFits:messageLabelFrame.size];
    
    size.height = messageLabelFrame.origin.y + messageLabelFrame.size.height + 20;
    return size;
}

@end
