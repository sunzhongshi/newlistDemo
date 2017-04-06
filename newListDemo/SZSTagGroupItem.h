//
//  SZSTagGroupItem.h
//  newListDraw
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 szs. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SZSGroupItem.h"
#import <UIKit/UIKit.h>
@interface SZSTagGroupItem : SZSGroupItem
+ (instancetype)tagGroupWithDict:(NSDictionary *)dict;

- (CGFloat)cellH;

@end
