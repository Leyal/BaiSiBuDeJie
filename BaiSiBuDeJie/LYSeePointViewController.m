//
//  LYSeePointViewController.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/10.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYSeePointViewController.h"

@interface LYSeePointViewController ()

@end

@implementation LYSeePointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView * webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    NSURL * url = [NSURL URLWithString:@"http://news.sina.com.cn"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
