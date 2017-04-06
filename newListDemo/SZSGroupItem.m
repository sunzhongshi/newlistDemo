//
//  SZSGroupItem.m
//  newListDraw
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 szs. All rights reserved.
//

#import "SZSGroupItem.h"
#import "SZSTagGroupItem.h"

@implementation SZSGroupItem
+(instancetype)groupWithDict:(NSDictionary *)dict{
    SZSGroupItem *item = [[self alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{


}

- (void)setData:(NSMutableArray *)data
{
    NSMutableArray *datas = [NSMutableArray array];
    
    for (NSDictionary *dict in data) {
        SZSTagGroupItem *tagGroup = [SZSTagGroupItem tagGroupWithDict:dict];
        [datas addObject:tagGroup];
    }
    
    _data = datas;
}

@end
