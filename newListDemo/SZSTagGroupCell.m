//
//  SZSGroupItem.m
//  newListDraw
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 szs. All rights reserved.
//

#import "SZSTagGroupCell.h"
#import "SZSTagCell.h"
#import "SZSTagGroupItem.h"
#import "SZSTagItem.h"
extern CGFloat const itemH;
static NSString * const tagCell = @"tagCell";
@interface SZSTagGroupCell ()<UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *tagGroupLabel;


@end

@implementation SZSTagGroupCell

- (void)awakeFromNib {
    // Initialization code
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UICollectionViewFlowLayout *layout = self.collectionView.collectionViewLayout;
    CGFloat margin = 10;
    CGFloat cols = 4;
    CGFloat itemW = ([UIScreen mainScreen].bounds.size.width - (cols + 1) * margin) / cols;
    layout.itemSize = CGSizeMake(itemW, itemH);
    layout.minimumInteritemSpacing = margin;
    layout.minimumLineSpacing = margin;
    
    // 设置collectionView
    self.collectionView.dataSource = self;
    self.collectionView.scrollEnabled = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"SZSTagCell" bundle:nil] forCellWithReuseIdentifier:tagCell];
}



- (void)setTagGroup:(SZSGroupItem *)tagGroup
{
    _tagGroup = tagGroup;
    _tagGroupLabel.text = tagGroup.name;
    [self.collectionView reloadData];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _tagGroup.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SZSTagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:tagCell forIndexPath:indexPath];

    SZSTagItem *item = _tagGroup.data[indexPath.row];
    cell.item = item;

    
    return cell;
}
@end
