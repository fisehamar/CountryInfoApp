//
//  WikiVC.h
//  CountryInfoApp
//
//  Created by Fiseha on 4/22/15.
//  Copyright (c) 2015 Fiseha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WikiVC : UIViewController
@property (strong, nonatomic)NSString* countryName;


@property (strong, nonatomic) IBOutlet UIWebView *webView;
-(void) loadCountryWiki;
@end
