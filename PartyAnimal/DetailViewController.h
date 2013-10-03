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
@property (strong, nonatomic) IBOutlet UIImageView *flyerImage;
@property (strong, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *venueNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *lineupText;
@property (strong, nonatomic) IBOutlet UILabel *genresText;
@property (strong, nonatomic) IBOutlet UILabel *priceText;
@property (strong, nonatomic) IBOutlet UILabel *whenText;
@property (strong, nonatomic) IBOutlet UILabel *whereText;


@end
