//
//  WikiVC.m
//  CountryInfoApp
//
//  Created by Fiseha on 4/22/15.
//  Copyright (c) 2015 Fiseha. All rights reserved.
//

#import "WikiVC.h"

@interface WikiVC ()

@end

@implementation WikiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadCountryWiki];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) loadCountryWiki {
    if (_countryName == nil){
        return;
    }
    NSString* wikiPath = @"http://en.wikipedia.org/wiki";
    //append the country name
    NSString* countryWikiPath = [wikiPath stringByAppendingPathComponent:_countryName];
    
    //create URL object
    NSURL* url = [NSURL URLWithString:countryWikiPath];
    
    //crete a URL request
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    //load the request in webview
    
    [_webView loadRequest:request];
    
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
