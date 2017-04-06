//
//  SZSTagItem.h
//  newListDraw
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 szs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SZSTagItem : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL isSelected;
+ (instancetype)tagWithDict:(NSDictionary *)dict;

@end
