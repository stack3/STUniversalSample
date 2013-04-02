//
//  STPostViewCell.h
//  STUniversalSample
//
//  Created by EIMEI on 2013/04/02.
//  Copyright (c) 2013年 stack3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STPostData.h"

@interface STPostViewCell : UITableViewCell

+ (id)loadFromNib;
- (void)setData:(STPostData *)data;

@end
