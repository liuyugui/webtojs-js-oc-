//
//  ViewController.m
//  webtojs
//
//  Created by 法大大 on 16/8/23.
//  Copyright © 2016年 fadada. All rights reserved.
//

#import "ViewController.h"

#import "TwoViewController.h"

@interface ViewController ()<UIWebViewDelegate>

/**
 描述：
 */
@property(nonatomic,strong)UIWebView * webView;

@end

@implementation ViewController

- (UIWebView *)webView{

    if (_webView == nil) {
        
        _webView = [[UIWebView alloc]init];
        _webView.frame = CGRectMake(0, 70, self.view.frame.size.width, 400);
    }
    return _webView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.webView];
    self.webView.delegate = self;
    
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL* url = [NSURL fileURLWithPath:path];
    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
    [self.webView loadRequest:request];

    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(20, 20, 100, 40);
    [btn setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:btn];
    [btn setTitle:@"调用js" forState:UIControlStateNormal];
    
    
}

- (void)btnClick:(UIButton *)sender{

    
    
    JSValue *function = [self.jsContext objectForKeyedSubscript:@"jsAlert"];
    
    [function callWithArguments:@[@"12"]];
    

}


- (void)webViewDidFinishLoad:(UIWebView *)webView{

    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    self.jsContext[@"tianbai"] = self;
    
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
        NSLog(@"异常信息：%@", exceptionValue);
    };


}


- (void)call{
    
    NSLog(@"call");

}


- (void)getCall:(NSString *)callString{
    
    NSLog(@"Get:%@", callString);

    
}

- (void)pushVC{

    
    [self presentViewController:[[TwoViewController alloc]init] animated:YES completion:nil];

}

@end
