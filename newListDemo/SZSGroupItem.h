//
//  SZSGroupItem.h
//  newListDraw
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 szs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SZSGroupItem : NSObject
{
     @protected NSMutableArray *_data;
}
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSMutableArray *data;
+(instancetype)groupWithDict:(NSDictionary*)dict;

@end
