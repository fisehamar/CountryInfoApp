//
//  AddCountryVC.m
//  CountryInfoApp
//
//  Created by Fiseha on 4/21/15.
//  Copyright (c) 2015 Fiseha. All rights reserved.
//

#import "AddCountryVC.h"

@interface AddCountryVC ()

@end

@implementation AddCountryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _contenentPicker.dataSource = self;
    _contenentPicker.delegate = self;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 4;
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (row ==0) {
        return @"Asia";
    }else if (row==1) {
        return @"North America";
        
    }else if (row ==2) {
        return @"South America";
    }else if (row==3){
        return @"Europe";
    }
    return nil;
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

- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    NSString* countryName  = _countryNameTextField.text;
    int row =(int) [_contenentPicker selectedRowInComponent:0];
    NSString* contenentName;
    if (row==0) {
        contenentName = @"Asia";
    }else if (row==1) {
        contenentName= @"North America";
    } else if (row ==2) {
        contenentName = @"South America";
    } else if (row==3) {
        contenentName = @"Europe";
    
    }
    
    if (delegate != nil){
        [delegate addCountry:countryName withContenent:contenentName];
    }
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)setDelegate:(id<AddContryDelegate>)d {
    delegate = d;
}
@end
