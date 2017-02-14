//
//  ZMBSpotlightModel.h
//  ZhongMeBan
//
//  Created by Han Yahui on 16/8/16.
//  Copyright © 2016年 Han Yahui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMBSpotlightModel : NSObject

@property (nonatomic,copy) NSString *contentType; // 格式为品类英文名 如药品的 contentType 为 medicine，尽量遵循这个格式。
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *contentDescription;
@property (nonatomic,copy) NSArray *keywords;
@property (nonatomic,copy) NSString *thumbnailName; //默认为app icon

@property (nonatomic,copy) NSString *uniqueIdentifier; // 格式为 {品类英文名 + 品类Id}，如药品 Id 为10的 uniqueIdentifier 为 medicine + 10
@property (nonatomic,copy) NSString *domainIdentifier;//域标示 默认为UserDomain
@property (nonatomic) NSDate *expirationDate; //默认一个月



@end
