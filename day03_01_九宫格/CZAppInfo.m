//
//  CZAppInfo.m
//  day03_01_九宫格
//
//  Created by davis on 16/4/18.
//  Copyright © 2016年 azalea. All rights reserved.
//

#import "CZAppInfo.h"

@implementation CZAppInfo
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if(self = [super init])
    {
        self.name = dic[@"name"];
        self.icon = dic[@"icon"];
    }
    return self;
}
+ (instancetype)appInfoWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *)appInfosList
{
    //1.1bundle
    NSBundle *bundle = [NSBundle mainBundle];
    //1.2获取plist路径
    NSString *path = [bundle pathForResource:@"app" ofType:@"plist"];
    //1.3加载plist
    //_appInfos = [NSArray arrayWithContentsOfFile:path];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *tmpArray = [NSMutableArray array];
    //1.4 字典转换模型
    for (NSDictionary *dic in dicArray) {
        CZAppInfo *appInfo = [[CZAppInfo alloc] initWithDic:dic];
        [tmpArray addObject:appInfo];
    }
    return tmpArray;
}

@end
