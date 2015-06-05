//
//  CountryListVC.m
//  CountryInfoApp
//
//  Created by Fiseha on 4/21/15.
//  Copyright (c) 2015 Fiseha. All rights reserved.
//

#import "CountryListVC.h"

@interface CountryListVC ()

@end

@implementation CountryListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initializeCountries];
    //attach the contryListVC as teh datasource for tableview
    self.title = @"Country List";
   // self.contenent = [[NSMutableDictionary alloc]init];
//    [self.contenent setValue:@"Africa" forKey:@"Continent"];
//    [self.contenent setValue:_africaCountries forKey:@"Countries"];
   
    //self.tabBarItem.image = [UIImage imageNamed:@"India.png];
    
    _countryTableView.dataSource = self;
    [_countryTableView setDelegate:self];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithTitle: @"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(edit:)];
 
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    
    
}
-(void)addCountry:(NSString *)name withContenent: (NSString*)contenent {
    //add the new contry name to array
    
    NSArray* c = [_contenent objectForKey:contenent];
    NSMutableArray* mC = [c mutableCopy];
    [mC addObject:name];
    [_contenent setObject:mC forKey:contenent];
    
    //refresh the table view
    [_countryTableView reloadData];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    NSArray* keys = [_contenent allKeys];
    return keys.count;

    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int numberOfRows = 0;
    NSArray* array;
    switch (section){
        case 0:
            array=[_contenent objectForKey:@"Asia"];
            numberOfRows = (int)array.count;
            break;
        case 1:
            array= [_contenent objectForKey:@"North America"];
            numberOfRows = (int)array.count;
            break;
        case 2:
            array= [_contenent objectForKey:@"South America"];
            numberOfRows = (int)array.count;
            break;
        case 3:
            array= [_contenent objectForKey:@"Europe"];
            numberOfRows = (int)array.count;
            break;

}
    return numberOfRows;
}


- (NSString *)getCountryName:(NSIndexPath *)indexPath {
    NSString *countryName;
    if (indexPath.section==0){
        NSArray* asia = [_contenent objectForKey:@"Asia"];
        countryName = [asia objectAtIndex:indexPath.row];
    }else if (indexPath.section==1){
        NSArray* northAmerica = [_contenent objectForKey:@"North America"];
        countryName = [northAmerica objectAtIndex:indexPath.row];
    }else if (indexPath.section==2){
        NSArray* southAmerica = [_contenent objectForKey: @"South America"];
        countryName = [southAmerica objectAtIndex:indexPath.row];
    }
    else if (indexPath.section ==3) {
        NSArray* europe = [_contenent objectForKey: @"Europe"];
        countryName = [europe objectAtIndex:indexPath.row];
        
    }
    return countryName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell= nil;
    //optimizing by using recycling .....
    cell= [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell ==nil){
        NSLog (@"cellForRowAtIndexPath %@", indexPath);
        
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    NSString* countryName;
    countryName = [self getCountryName:indexPath];
    
    NSLog(@"cellForRowAtIndexPath %@", indexPath);
    cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    //get the conunr=try name on the text label
//    NSString* countrName= [_countries objectAtIndex:indexPath.row];
    
    //display the conury name
    cell.textLabel.text= countryName;
    
    NSString* flagName = [countryName stringByAppendingString:@".png"];
    UIImage* flagImage = [UIImage imageNamed:flagName];
    cell.imageView.image =flagImage;
    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
-(NSString*)tableView: (UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section ==0){
        return @"Asia";
    }else if (section ==1) {
        return @"North America";
    }else if (section ==2) {
        return @"South America";
    }else if (section ==3){
        return @"Europe";
    }
    return nil;
    }

-(void)deleteCountryAtINdexPath: (NSIndexPath*) indexPath FromContenent: (NSString*)c {
    //get the array of countries with key = asia
    NSArray* contenent = [_contenent objectForKey:c];
    //create a mutable copy of asia
    NSMutableArray* mContenent = [contenent mutableCopy];
    //remove the country at index . row
    [mContenent removeObjectAtIndex:indexPath.row];
    
    //replace the existing array in dictionary with teh new array
    [_contenent setObject:mContenent forKey:c];
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
   // [_countries removeObjectAtIndex:indexPath.row];
    
if(indexPath.section==0){
[self deleteCountryAtINdexPath:indexPath FromContenent:@"Asia"];
                                 
}else if (indexPath.section==1){
[self deleteCountryAtINdexPath:indexPath FromContenent:@"North America"];
     
     
}else if (indexPath.section==2){
         
[self deleteCountryAtINdexPath:indexPath FromContenent:@"South America"];
} else if (indexPath.section==3){
    [self deleteCountryAtINdexPath:indexPath FromContenent:@"Europe"];
}

    // remove the row
NSArray *rows = @[indexPath];
    
[tableView deleteRowsAtIndexPaths:rows withRowAnimation:UITableViewRowAnimationFade];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 //   NSString* countryName = [_countries objectAtIndex:indexPath.row];
//    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"CountryInofApp" message:countryName delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
//    [alert show];
    
    
    NSString* countryName = [self getCountryName:indexPath];
    
    //create the wiki view controller
    
    _wikivc = [[WikiVC alloc]init];
    //send the country name to the wiki view controller
    _wikivc.countryName = countryName;
    
    //push the wiki vuew cibtrikker
    
    [self.navigationController pushViewController:_wikivc animated:YES];
    
    
}
-(void) alertView: (UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex:(NSInteger)buttonIndex {
    if (buttonIndex==0){
        NSLog(@"cancel selected");
    }else if (buttonIndex ==1) {
        NSLog(@"ok selected");
        
    
    }
}

-(void) initializeCountries {
//    _countries = [[NSMutableArray alloc]initWith
    
    NSDictionary* temp = @ {@"Asia":@[@"India", @"China"],
                            @"North America": @[@"USA", @"Canada"],
                            @"South America": @[@"Brazil", @"Argentia"],
                            @"Europe":        @[@"France", @"Italy", @"England", @"Portugal"]
    };
        
        
        _contenent = [temp mutableCopy];
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



- (IBAction)add:(id)sender {
    
    _addvc = [[AddCountryVC alloc]init];
    //changing the presrentation style of the model view con
    
    [_addvc setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    //attach the CountryListVC as delegate to the AddCountryVC
    [_addvc setDelegate:self];
    
    
    [self presentViewController:_addvc animated:YES completion:nil];
}

-(void) addCountry:(NSString *)name {
    //add new country name
    [_countries addObject:name];
    //refresh th table view
    [_countryTableView reloadData];
}
-(IBAction)edit:(id)sender {
    if (_countryTableView.editing){
        UIBarButtonItem* barItem = (UIBarButtonItem*)sender;
        [_countryTableView setEditing:NO animated:YES];
        [barItem setTitle:@"Edit"];
    }else {
        UIBarButtonItem* barItem = (UIBarButtonItem*)sender;
        [_countryTableView setEditing:YES animated:YES];
        [barItem setTitle:@"Done"];
    }
}



@end
