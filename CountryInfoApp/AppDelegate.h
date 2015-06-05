//
//  AppDelegate.h
//  CountryInfoApp
//
//  Created by Fiseha on 4/21/15.
//  Copyright (c) 2015 Fiseha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryListVC.h"
#import "AboutVC.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong, nonatomic)CountryListVC* coutryListVC;
@property (strong, nonatomic)UINavigationController* navController;

@property(strong, nonatomic)UITabBarController* tabControlle;
@property(strong, nonatomic)AboutVC* AboutVC;



@end

