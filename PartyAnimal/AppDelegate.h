//
//  AppDelegate.h
//  PartyAnimal
//
//  Created by Gina Lupu on 9/23/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
