//
//  AppInfoView.m
//  day03_01_九宫格
//
//  Created by davis on 16/4/20.
//  Copyright © 2016年 azalea. All rights reserved.
//

#import "AppInfoView.h"
#import "CZAppInfo.h"
@interface AppInfoView()
@property (nonatomic, weak) IBOutlet UIImageView *iconView;
@property (nonatomic,weak) IBOutlet UILabel *nameView;
- (IBAction)downloadClick:(UIButton *)sender;
@end
@implementation AppInfoView

+ (instancetype)appInfoView
{
    //从xib中加载subView
    NSBundle *bundle = [NSBundle mainBundle];
    AppInfoView *subView =  [[bundle loadNibNamed:@"AppInfoView" owner:nil options:nil] lastObject];
    return  subView;
}

- (void) setAppInfo:(CZAppInfo *)appInfo
{
    _appInfo = appInfo;
    self.nameView.text = appInfo.name;
    self.iconView.image = [UIImage imageNamed:appInfo.icon];
}

- (IBAction)downloadClick:(UIButton *)sender
{
    sender.enabled = NO;
    self.superview.userInteractionEnabled = NO;
    UILabel *tipView = [[UILabel alloc] init];
    [self.superview addSubview:tipView];
    tipView.text = [NSString stringWithFormat:@"正在下载：%@",self.appInfo.name];
    CGFloat tipW = 200;
    CGFloat tipH = 25;
    CGFloat tipX = (self.superview.frame.size.width - tipW) / 2;
    CGFloat tipY = (self.superview.frame.size.height - tipH) / 2;
    tipView.frame = CGRectMake(tipX, tipY, tipW, tipH);
    tipView.backgroundColor = [UIColor grayColor];
    //透明度
    tipView.alpha = 0;
    //圆角效果
    tipView.layer.cornerRadius = 5;
    tipView.layer.masksToBounds = YES;//裁剪超过bound的部分
    //动画效果
    [UIView animateWithDuration:1.0 animations:^{
        tipView.alpha = 0.9;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 delay:3.0 options:UIViewAnimationOptionCurveLinear animations:^{
            tipView.alpha = 0;
        } completion:^(BOOL finished) {
            [tipView removeFromSuperview];
            self.superview.userInteractionEnabled = YES;

        }];
    }];
    
    
    
    
    
    
    
    
    
    
    
    
    
}

@end
