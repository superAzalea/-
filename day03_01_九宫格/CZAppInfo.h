//
//  CZAppInfo.h
//  day03_01_九宫格
//
//  Created by davis on 16/4/18.
//  Copyright © 2016年 azalea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZAppInfo : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *icon;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)appInfoWithDic:(NSDictionary *)dic;

+ (NSArray *)appInfosList;
@end
