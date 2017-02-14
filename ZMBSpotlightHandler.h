//
//  ZMBSpotlightHandler.h
//  ZhongMeBan
//
//  Created by Han Yahui on 16/8/16.
//  Copyright © 2016年 Han Yahui. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ZMBSpotlightModel.h"

@interface ZMBSpotlightHandler : NSObject

+ (instancetype)defaultSpotlight;

- (void)addSpotlightWtihModels:(NSArray<ZMBSpotlightModel *> *)models;

- (void)deleteSearchableItemsWithIdentifiers:(NSArray<NSString *> *)identifiers;
- (void)deleteSearchableItemsWithDomainIdentifiers:(NSArray<NSString *> *)domainIdentifiers;
- (void)deleteAllSearchableItems;

@end
