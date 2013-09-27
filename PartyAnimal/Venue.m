//
//  Venues.m
//  PartyAnimal
//
//  Created by Gina Lupu on 9/23/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import "Venue.h"

@implementation Venue

+(Venue*) venueFromVenueID:(NSString *) venueID withVenueCollection: (NSMutableArray *) venueCollection {
    for (Venue *v in venueCollection) {
            if ([v.identifier isEqual:venueID]) {
                return v;
            }
    }
    return nil;
}

@end
