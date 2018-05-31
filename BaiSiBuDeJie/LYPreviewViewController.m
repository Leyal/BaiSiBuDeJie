//
//  LYPreviewViewController.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/10.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYPreviewViewController.h"

@interface LYPreviewViewController ()

@end

@implementation LYPreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];UIWebView * webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    NSURL * url = [NSURL URLWithString:@"https://www.tmall.com/?pid=mm_26632258_3504122_48284354&b=ogfNNQOsM7QPMJ9sZ6g&ali_trackid=2:mm_26632258_3504122_48284354:1499683881_3k2_1602505944&upsid=8f984618075881e4bae4f8a862a50328&clk1=8f984618075881e4bae4f8a862a50328"];
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
