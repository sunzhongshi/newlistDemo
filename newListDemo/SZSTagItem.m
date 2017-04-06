//
//  SZSTagItem.m
//  newListDraw
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 szs. All rights reserved.
//

#import "SZSTagItem.h"

@implementation SZSTagItem
+ (instancetype)tagWithDict:(NSDictionary *)dict
{
    SZSTagItem *item = [[self alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
