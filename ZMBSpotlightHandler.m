//
//  ZMBSpotlightHandler.m
//  ZhongMeBan
//
//  Created by Han Yahui on 16/8/16.
//  Copyright © 2016年 Han Yahui. All rights reserved.
//

#import "ZMBSpotlightHandler.h"

#import <CoreSpotlight/CoreSpotlight.h>

@implementation ZMBSpotlightHandler

+ (instancetype)defaultSpotlight
{
  static ZMBSpotlightHandler *handler;
  
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    
    handler = [[self alloc] init];
  });
  
  return handler;
}

- (void)addSpotlightWtihModels:(NSArray<ZMBSpotlightModel *> *)models
{
  
  NSMutableArray *items = [NSMutableArray arrayWithCapacity:models.count];
  for (ZMBSpotlightModel *model in models) {
    CSSearchableItemAttributeSet *attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:model.contentType];
    attributeSet.title = model.title;
    attributeSet.contentDescription = model.contentDescription;
    attributeSet.keywords = model.keywords;
    attributeSet.thumbnailData = UIImagePNGRepresentation([UIImage imageNamed:model.thumbnailName]);
    
    CSSearchableItem *searchableItem = [[CSSearchableItem alloc] initWithUniqueIdentifier:model.uniqueIdentifier
                                                                         domainIdentifier:model.domainIdentifier
                                                                             attributeSet:attributeSet];
    searchableItem.expirationDate = model.expirationDate;
    [items addObject:searchableItem];
  }
  
  if (items.count == 0) {
    return;
  }
  
  [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:items
                                                 completionHandler:^(NSError * _Nullable error) {
    if(error) {
      NSLog(@"%@", [error localizedDescription]);
    }
  }];
  
  
}

- (void)deleteSearchableItemsWithIdentifiers:(NSArray<NSString *> *)identifiers
{
  [[CSSearchableIndex defaultSearchableIndex] deleteSearchableItemsWithIdentifiers:identifiers
                                                                 completionHandler:^(NSError * _Nullable error) {
    
  }];
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(NSArray<NSString *> *)domainIdentifiers
{
  [[CSSearchableIndex defaultSearchableIndex] deleteSearchableItemsWithDomainIdentifiers:domainIdentifiers
                                                                       completionHandler:^(NSError * _Nullable error) {
    
  }];
}

- (void)deleteAllSearchableItems
{
  [[CSSearchableIndex defaultSearchableIndex] deleteAllSearchableItemsWithCompletionHandler:^(NSError * _Nullable error) {
    
  }];
}

@end
