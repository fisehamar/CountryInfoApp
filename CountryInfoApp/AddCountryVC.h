//
//  AddCountryVC.h
//  CountryInfoApp
//
//  Created by Fiseha on 4/21/15.
//  Copyright (c) 2015 Fiseha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddCountryVC.h"
#import "AddContryDelegate.h"


@interface AddCountryVC : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
   id<AddContryDelegate>delegate;
    
}


@property (strong, nonatomic) IBOutlet UITextField *countryNameTextField;

@property (strong, nonatomic) IBOutlet UIPickerView *contenentPicker;

- (IBAction)done:(id)sender;

- (IBAction)cancel:(id)sender;
-(void)setDelegate:(id<AddContryDelegate>)d;


@end
