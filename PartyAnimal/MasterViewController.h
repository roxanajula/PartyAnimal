//
//  MasterViewController.h
//  PartyAnimal
//
//  Created by Roxana Jula on 9/25/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CurrentLocationRetriever.h"

@interface MasterViewController : UITableViewController

@property (strong) NSArray *masterEvents;
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) CLLocation *currentLocation;

@end
