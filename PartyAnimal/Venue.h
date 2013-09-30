//
//  Venues.h
//  PartyAnimal
//
//  Created by Gina Lupu on 9/23/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"

@interface Venue : NSObject

@property (strong, nonatomic) Address * address;
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSString * identifier;
@property (strong, nonatomic) NSString * phoneNo;
@property (strong, nonatomic) NSString * website;

+(Venue*) venueFromVenueID:(NSString *) venueID withVenueCollection: (NSMutableArray *) venueCollection;

@end
