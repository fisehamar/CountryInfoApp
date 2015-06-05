//
//  AboutVC.m
//  CountryInfoApp
//
//  Created by Fiseha on 4/22/15.
//  Copyright (c) 2015 Fiseha. All rights reserved.
//

#import "AboutVC.h"

@interface AboutVC ()

@end

@implementation AboutVC
-(id) init {
    self =[super init];
    if(self!=nil){
        self.title = @"About";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"About";
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
