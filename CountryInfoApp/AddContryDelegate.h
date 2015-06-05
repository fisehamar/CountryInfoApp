//
//  AddContryDelegate.h
//  CountryInfoApp
//
//  Created by Fiseha on 4/21/15.
//  Copyright (c) 2015 Fiseha. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AddContryDelegate <NSObject>

-(void)addCountry:(NSString *)name withContenent: (NSString*)contenent;

@end
