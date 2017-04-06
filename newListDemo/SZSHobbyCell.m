//
//  SZSHobbyCell.m
//  newListDraw
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 szs. All rights reserved.
//

#import "SZSHobbyCell.h"
#import "SZSTagList.h"

@implementation SZSHobbyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setTagList:(SZSTagList *)tagList
{
    _tagList = tagList;
    
    [self.contentView addSubview:tagList];
}

@end
