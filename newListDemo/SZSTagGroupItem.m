//
//  SZSTagGroupItem.m
//  newListDraw
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 szs. All rights reserved.
//

#import "SZSTagGroupItem.h"
#import "SZSTagItem.h"
CGFloat const itemH = 30;
@implementation SZSTagGroupItem
+(instancetype)tagGroupWithDict:(NSDictionary *)dict{
    SZSTagGroupItem *item = [[self alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
- (void)setData:(NSMutableArray *)data
{
    NSMutableArray *datas = [NSMutableArray array];
    for (NSDictionary *dict in data) {
        SZSTagItem *tagGroup = [SZSTagItem tagWithDict:dict];
        [datas addObject:tagGroup];
    }
    _data = datas;
}


- (CGFloat)cellH
{
    CGFloat originY = 27;
    CGFloat margin = 10;
    
    NSInteger cols = 4;
    NSInteger rows = (self.data.count - 1) / cols + 1;
    return rows * (itemH + margin) + originY;
}
@end
