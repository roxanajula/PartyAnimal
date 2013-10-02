//
//  CurrentLocationRetriever.m
//  PartyAnimal
//
//  Created by Gina Lupu on 10/1/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import "CurrentLocationRetriever.h"
#import "AppDelegate.h"


@implementation CurrentLocationRetriever

+ (CLLocation *) getCurrentLocation {
    if([CLLocationManager locationServicesEnabled]){
        AppDelegate *appDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
        return appDelegate.locationManager.location;
    } else {
        return nil;
    }
}

@end
