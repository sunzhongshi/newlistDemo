//
//  SZSGroupHeaderView.h
//  newListDraw
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 szs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SZSGroupItem;
@interface SZSGroupHeaderView : UIView

@property (nonatomic, strong) SZSGroupItem *groupItem;
+ (instancetype)groupHeaderView;

@end
