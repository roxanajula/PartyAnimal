//
//  Event.h
//  PartyAnimal
//
//  Created by Gina Lupu on 9/23/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fees.h"
#import "Venue.h"

@interface Event : NSObject

@property (strong,nonatomic) NSMutableArray *artists;
@property (strong,nonatomic) Fees * fees;
@property (strong, nonatomic) NSMutableArray * flyers;
@property (strong, nonatomic) NSMutableArray * genres;
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSDate * startsAt;
@property (strong, nonatomic) NSString *startsAtString;
@property (strong, nonatomic) Venue * venue;

@end
