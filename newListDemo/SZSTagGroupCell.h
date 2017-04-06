//
//  SZSGroupItem.h
//  newListDraw
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 szs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SZSGroupItem;
@interface SZSTagGroupCell : UITableViewCell

@property (nonatomic, strong) SZSGroupItem *tagGroup;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
