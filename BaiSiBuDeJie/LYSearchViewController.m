//
//  LYSearchViewController.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/10.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYSearchViewController.h"

@interface LYSearchViewController ()

@end

@implementation LYSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];    UIWebView * webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    NSURL * url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    // Do any additional setup after loading the view.
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
