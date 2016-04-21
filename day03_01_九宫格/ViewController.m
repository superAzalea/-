//
//  ViewController.m
//  day03_01_九宫格
//
//  Created by davis on 16/4/13.
//  Copyright © 2016年 azalea. All rights reserved.
//

#import "ViewController.h"
#import "CZAppInfo.h"
#import "AppInfoView.h"
@interface ViewController ()
//存储从plist中获取的数据
@property (nonatomic, strong) NSArray *appInfos;
@end

@implementation ViewController

//1 懒加载 重写get方法
- (NSArray *)appInfos
{
    if (_appInfos == nil) {//判断是否加载过
        //调用 appInfo的类的方法，返回模型数组
        _appInfos = [CZAppInfo appInfosList];
      
    }
    return _appInfos;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 2 测试数据
    CGFloat subViewW = 100;
    CGFloat subViewH = 100;
    //子view的横向间距 ＝ （父view的宽度 － 3*子view的宽度）／ 4
    CGFloat marginX = (self.view.frame.size.width - 3*subViewW) / 4;
    CGFloat marginY = 20;//子view的纵向间距
    
    //3动态生成九宫格
    for (int i = 0; i < self.appInfos.count; i++) {
       
        //封装自定义view
        AppInfoView *subView = [AppInfoView appInfoView];
     
        [self.view addSubview:subView];
        
        //计算frame
               //当前子view的行号 ＝ 当前遍历得到的索引值 ／ 总列数
        int row = i / 3;
         //当前子view的列号 ＝ 当前遍历得到的索引值 ％总列数
        int column = i % 3;
        
        //子view的横坐标公式 ＝ 子view的横向间距 ＋ 列号 ＊（子view的横向间距 ＋ 子view的宽度；
        
        CGFloat subViewX = marginX  + column *(marginX + subViewW);
        //子view的纵坐标公式 ＝ 30 ＋ 行号 ＊（子view的纵向间距 ＋ 子view的高度；
        CGFloat subViewY = 30 + row *(marginY + subViewH);
        
        subView.frame = CGRectMake(subViewX, subViewY, subViewW, subViewH);
        
        //取得当前遍历数据
        CZAppInfo *appInfo = self.appInfos[i];
     
        subView.appInfo = appInfo;
    }
    
}
/*
//生成3个子空间，显示应用信息
- (void)displayAppInfo:(CZAppInfo *)appInfo subView:(UIView *)subView
{
    CGFloat subViewW = subView.frame.size.width;
    //4 生成3个子控件
    //4.1 iconView
   // UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:appInfo[@"icon"]]];
    UIImageView *iconView = [[UIImageView alloc] init];
    //iconView.image = [UIImage imageNamed:appInfo.icon];
    iconView.image = [UIImage imageNamed:appInfo.icon];
    [subView addSubview:iconView];
    
    //计算frame
    CGFloat iconW = 60;
    CGFloat iconH = 60;
    CGFloat iconY = 0;
    CGFloat iconX =(subViewW - iconW)/2;
    iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    //4.2nameView
    UILabel *nameView = [[UILabel alloc] init];
    [subView addSubview:nameView];
    
    //计算frame
    CGFloat nameW = subViewW;
    CGFloat nameH = 20;
    CGFloat nameY = iconH;
    CGFloat nameX =0;
    nameView.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    nameView.text = appInfo.name;
    //文字大小
    nameView.font = [UIFont systemFontOfSize:13];
    //文字居中
    nameView.textAlignment = NSTextAlignmentCenter;
    
    //4.3 下载按钮
    UIButton *downloadView = [UIButton buttonWithType:UIButtonTypeCustom];
    [subView addSubview:downloadView];
    
    //计算frame
    CGFloat downloadW = iconW;
    CGFloat downloadH = 20;
    CGFloat downloadX = iconX;
    //获得label的最大y值
    CGFloat downloadY = CGRectGetMaxY(nameView.frame);
    downloadView.frame = CGRectMake(downloadX, downloadY, downloadW, downloadH);
    
    [downloadView setTitle:@"下载" forState:UIControlStateNormal];
    [downloadView setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
    [downloadView setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
    //设置按钮文字的大小
    downloadView.titleLabel.font = [UIFont systemFontOfSize:14];
    //给按钮注册事件
    [downloadView addTarget:self action:@selector(downloadClick) forControlEvents:UIControlEventTouchUpInside];
    //downloadView.tag = i;
}
*/
- (void)downloadClick
{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
