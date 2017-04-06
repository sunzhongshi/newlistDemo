//
//  SZSTagCell.m
//  newListDraw
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 szs. All rights reserved.
//
#import "SZSTagCell.h"
#import "SZSTagItem.h"

@interface SZSTagCell ()

@end

@implementation SZSTagCell

- (void)awakeFromNib {
    // Initialization code
    self.layer.borderColor = [UIColor colorWithRed:221 / 255.0 green:221 / 255.0 blue:221 / 255.0 alpha:1].CGColor;
    self.layer.borderWidth = 1;
}

- (void)setItem:(SZSTagItem *)item
{
    _item = item;
    
    self.tagLabel.text = item.name;
    
    _tagLabel.textColor = item.isSelected?[UIColor colorWithRed:39 / 255.0 green:132 / 255.0 blue:235 / 255.0 alpha:1] : [UIColor colorWithRed:136 / 255.0 green:136 / 255.0 blue:136 / 255.0 alpha:1];
}


@end
