//
//  DetailViewController.h
//  PartyAnimal
//
//  Created by Roxana Jula on 9/25/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface DetailViewController : UIViewController < UINavigationControllerDelegate>
@property (strong, nonatomic) Event *detailItem;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
