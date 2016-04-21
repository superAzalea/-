//
//  AppInfoView.h
//  day03_01_九宫格
//
//  Created by davis on 16/4/20.
//  Copyright © 2016年 azalea. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZAppInfo;
@interface AppInfoView : UIView

@property (nonatomic,strong) CZAppInfo *appInfo;

+ (instancetype)appInfoView;
- (void) setAppInfo:(CZAppInfo *)appInfo;
@end
