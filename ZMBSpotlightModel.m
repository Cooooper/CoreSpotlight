//
//  ZMBSpotlightModel.m
//  ZhongMeBan
//
//  Created by Han Yahui on 16/8/16.
//  Copyright © 2016年 Han Yahui. All rights reserved.
//

#import "ZMBSpotlightModel.h"

@implementation ZMBSpotlightModel

- (instancetype)init
{
  self = [super init];
  if (self) {
    
    self.contentType = @"ZMB";
    self.uniqueIdentifier = UUID();
    self.domainIdentifier = @"UserDomain";
    self.expirationDate = [NSDate dateWithTimeIntervalSinceNow:3600];
  }
  return self;
}

@end
