//
//  ViewController.m
//  WKWebViewLab
//
//  Created by Mohan on 3/16/20.
//  Copyright © 2020 Mohan. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

const CGFloat kHeaderHeight = 200.0;

@interface ViewController ()
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIView *headerView;
@end

@implementation ViewController

- (WKWebView *)webView
{
    if (!_webView)
    {
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:[WKWebViewConfiguration new]];
        _webView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _webView.allowsLinkPreview = NO;
    }
    return _webView;
}

- (UIView *)messageHeaderView
{
    if (!_headerView)
    {
        _headerView = [[UIView alloc] initWithFrame:CGRectZero];
        _headerView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _headerView;
}

- (void)addMessageHeaderView
{
    [self.headerView removeConstraints:self.messageHeaderView.constraints];
    [self.webView.scrollView addSubview:self.messageHeaderView];
    [self.headerView.leadingAnchor constraintEqualToAnchor:self.webView.scrollView.leadingAnchor].active = YES;
    [self.headerView.widthAnchor constraintEqualToConstant:CGRectGetWidth(self.view.bounds)].active = YES;
    [self.headerView.topAnchor constraintEqualToAnchor:self.webView.scrollView.topAnchor constant:-kHeaderHeight].active = YES;
    [self.headerView.heightAnchor constraintEqualToConstant:kHeaderHeight].active = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://edit-page-static-site.herokuapp.com/index.html"]];
    [self.webView loadRequest:request];
}

@end
