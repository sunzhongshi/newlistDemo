//
//  YZTagCell.h
//  YZTagListDemo
//
//  Created by yz on 16/8/16.
//  Copyright © 2016年 yz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SZSTagItem;
@interface SZSTagCell : UICollectionViewCell
@property (nonatomic, strong) SZSTagItem *item;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;

@end
