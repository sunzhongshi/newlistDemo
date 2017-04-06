//
//  SZSGroupHeaderView.m
//  newListDraw
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 szs. All rights reserved.
//
#import "SZSGroupHeaderView.h"
#import "SZSGroupItem.h"

@interface SZSGroupHeaderView ()
@property (weak, nonatomic) IBOutlet UILabel *groupLabel;

@end

@implementation SZSGroupHeaderView

+ (instancetype)groupHeaderView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

- (void)setGroupItem:(SZSGroupItem *)groupItem
{
    _groupItem = groupItem;
    _groupLabel.text = groupItem.name;
}

@end
