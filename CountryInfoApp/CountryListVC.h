//
//  CountryListVC.h
//  CountryInfoApp
//
//  Created by Fiseha on 4/21/15.
//  Copyright (c) 2015 Fiseha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddCountryVC.h"
#import "WikiVC.h"

@interface CountryListVC : UIViewController <UITableViewDataSource, AddContryDelegate, UITableViewDelegate, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *countryTableView;
@property (strong, nonatomic)NSMutableArray* countries;

@property (strong, nonatomic)NSMutableDictionary* contenent;

@property(strong, nonatomic) AddCountryVC* addvc;
@property (strong, nonatomic)WikiVC* wikivc;
- (IBAction)edit:(id)sender;


- (IBAction)add:(id)sender;


@end
