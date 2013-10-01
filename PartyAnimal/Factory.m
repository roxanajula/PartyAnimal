//
//  Factory.m
//  PartyAnimal
//
//  Created by Gina Lupu on 9/24/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import "Factory.h"
#import "Artist.h"
#import "Genre.h"
#import "Venue.h"
#import "Fees.h"
#import "Event.h"
#import "DataRetriever.h"
#import "CurrentLocationRetriever.h"


@implementation Factory


+(NSMutableArray *) createArtistCollection:(NSDictionary *) responseData {
    NSMutableArray *parsedArtists = [NSMutableArray array];
    for (NSDictionary *artist in responseData[@"artists"]) {
        Artist *a = [[Artist alloc] init];
        a.name=artist[@"name"];
        a.identifier=artist[@"id"];
        [parsedArtists addObject:a];
    }
    return parsedArtists;
}

+(NSMutableArray *) createGenreCollection:(NSDictionary *) responseData {
    NSMutableArray *parsedGenres = [NSMutableArray array];
    for (NSDictionary *genre in responseData[@"music_genres"]) {
        Genre *g = [[Genre alloc] init];
        g.name=genre[@"name"];
        g.identifier=genre[@"id"];
        [parsedGenres addObject:g];
    }
    return parsedGenres;
}

+(NSMutableArray *) createVenueCollection:(NSDictionary *) responseData {
    NSMutableArray *parsedVenues = [NSMutableArray array];
    for (NSDictionary *venue in responseData[@"venues"]) {
        Venue *v = [[Venue alloc] init];
        v.name = venue[@"name"];
        v.identifier = venue[@"id"];
        v.phoneNo = venue[@"phone_number"];
        v.website = venue[@"website_url"];
        v.address = [Factory createVenueAddressForVenue: venue];
        [parsedVenues addObject:v];
    }
    return parsedVenues;
}

+ (Address *) createVenueAddressForVenue: (NSDictionary *) ve {
    NSDictionary *addressDict = [ve objectForKey:@"address"];
    Address *addr = [[Address alloc] init];
    addr.city =[addressDict valueForKey:@"city"];
    addr.country = [addressDict valueForKey:@"country"];
    addr.street = [addressDict valueForKey:@"street"];
    addr.zipCode = [addressDict valueForKey:@"zip_code"];
    return addr;
}

+(NSMutableArray *) createEventCollection:(NSDictionary *) responseData {
    
    NSMutableArray *parsedArtists = [Factory createArtistCollection:responseData];
    NSMutableArray *parsedGenres = [Factory createGenreCollection:responseData];
    NSMutableArray *parsedVenues = [Factory createVenueCollection:responseData];
    
    NSMutableArray *parsedEvents = [NSMutableArray array];
    for (NSDictionary *event in responseData[@"events"]) {
        Event *e = [[Event alloc] init];
        e.name = [Factory createEventName: event];
        e.startsAt = [Factory createEventStartsAt: event];
        e.fees = [Factory createEventFees: event];
        e.artists = [Factory createEventArtists: event fromCollection:parsedArtists];
        e.genres = [Factory createEventGenres: event fromCollection:parsedGenres];
        e.venue = [Factory createEventVenue: event fromCollection: parsedVenues];
        e.flyers = [Factory createEventFlyers: event];
        [parsedEvents addObject:e];
    }
    return parsedEvents;
}

+ (NSString *) createEventName: (NSDictionary *) ev {
    return ev[@"name"];
}

+ (NSDate *) createEventStartsAt: (NSDictionary *) ev {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssz"];
    return [df dateFromString: ev[@"starts_at"]];
}

+ (Fees *) createEventFees: (NSDictionary *) ev {
    NSDictionary *feesDict = [ev objectForKey:@"fees"];
    Fees *f = [[Fees alloc] init];
    f.kind = [feesDict valueForKey:@"kind"][0];
    f.currency =  [feesDict valueForKey:@"currency"][0];
    if ([[feesDict valueForKey:@"cents"][0] isKindOfClass:[NSNumber class]])
        f.price = [[feesDict valueForKey:@"cents"][0] floatValue]/100;
    return f;
}

+ (NSMutableArray *) createEventArtists: (NSDictionary *) ev fromCollection: (NSMutableArray *) parsedArtists {
    return [Artist artistArrayFromArtistIDArray:ev[@"artists"]withArtistCollection:parsedArtists];
}

+ (NSMutableArray *) createEventGenres: (NSDictionary *) ev fromCollection: (NSMutableArray *) parsedGenres {
    return [Genre genreArrayFromGenreIDArray:ev[@"music_genres"] withGenreCollection:parsedGenres];;
}

+ (Venue *) createEventVenue: (NSDictionary *) ev fromCollection: (NSMutableArray *) parsedVenues {
    return [Venue venueFromVenueID:ev[@"venue"] withVenueCollection:parsedVenues];
}

+ (NSMutableArray *) createEventFlyers: (NSDictionary *) ev {
    NSDictionary *flyersDictionary = [ev valueForKey:@"flyers"];
    NSDictionary *versionsDictionary = [flyersDictionary valueForKey:@"versions"][0];
    return [versionsDictionary valueForKey:@"href"];
}

+ (CLLocation *) createReferenceLocation {
    return [CurrentLocationRetriever getCurrentLocation];
}


@end

