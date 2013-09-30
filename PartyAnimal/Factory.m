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
#import "Event.h"
#import "DataRetriever.h"


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
        NSDictionary *addressDict = [venue objectForKey:@"address"];
        NSString *cityString = [addressDict valueForKey:@"city"];
        NSString *countryString = [addressDict valueForKey:@"country"];
        NSString *streetString = [addressDict valueForKey:@"street"];
        NSString *zipString = [addressDict valueForKey:@"zip_code"];
        v.address = [[Address alloc]init];
        v.address.city=cityString;
        v.address.country=countryString;
        v.address.street=streetString;
        v.address.zipCode=zipString;
        [parsedVenues addObject:v];
        //NSLog(@"Venue information: Name %@ ID %@ Phone %@ Website %@", v.name, v.identifier, v.phoneNo, v.website);
        //NSLog(@"Venue address: City %@ Country %@ Street %@ Zip %@", v.address.city, v.address.country, v.address.street, v.address.zipCode);
    }
    return parsedVenues;
}

+(NSMutableArray *) createEventCollection:(NSDictionary *) responseData {
    
    // Artists
    
    NSMutableArray *parsedArtists = [Factory createArtistCollection:responseData];
    
    //Music genres
    
    NSMutableArray *parsedGenres = [Factory createGenreCollection:responseData];
    
    //Venues
    NSMutableArray *parsedVenues = [Factory createVenueCollection:responseData];
    
    //Events
    NSMutableArray *parsedEvents = [NSMutableArray array];
    for (NSDictionary *event in responseData[@"events"]) {
        Event *e = [[Event alloc] init];
        //NSLog(@"***************************");
        e.name = event[@"name"];
        //NSLog(@"Event name: %@", e.name);
        
        NSString *startsAtString = event[@"starts_at"];
        //NSLog(@"StartsAt String: %@", startsAtString);
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssz"];
        e.startsAt= [df dateFromString: startsAtString];
        //NSLog(@"Starts at: %@", e.startsAt);
        
        NSDictionary *feesDict = [event objectForKey:@"fees"];
        e.fees = [[Fees alloc]init];
        e.fees.kind = [feesDict valueForKey:@"kind"][0];
        e.fees.currency =  [feesDict valueForKey:@"currency"][0];
        if ([[feesDict valueForKey:@"cents"][0] isKindOfClass:[NSNumber class]])
            e.fees.price = [[feesDict valueForKey:@"cents"][0] floatValue]/100;
        //NSLog(@"Cents: %f Kind: %@ Currency: %@", e.fees.price, e.fees.kind, e.fees.currency);
        
        
        NSMutableArray *artistsID = event[@"artists"];
        e.artists = [Artist artistArrayFromArtistIDArray:artistsID withArtistCollection:parsedArtists];
        for (int i=0; i<[e.artists count]; i++) {
            Artist *ar=e.artists[i];
            //NSLog(@"Artist name: %@", ar.name);
        }
        
        
        NSMutableArray *genresID = event[@"music_genres"];
        e.genres = [Genre genreArrayFromGenreIDArray:genresID withGenreCollection:parsedGenres];
        for (int i=0; i<[e.genres count]; i++) {
            Genre *ge=e.genres[i];
            //NSLog(@"Genre name: %@", ge.name);
        }
        
        NSString *venueID = event[@"venue"];
        e.venue = [Venue venueFromVenueID:venueID withVenueCollection:parsedVenues];
        //NSLog(@"Venue name: %@", e.venue.name);
        //NSLog(@"Address: %@, %@, %@, %@", e.venue.address.city, e.venue.address.country, e.venue.address.street, e.venue.address.zipCode);
        
        
        NSDictionary *flyersDictionary = [event valueForKey:@"flyers"];
        NSDictionary *versionsDictionary = [flyersDictionary valueForKey:@"versions"][0];
        NSMutableArray *hrefArray = [versionsDictionary valueForKey:@"href"];
        e.flyers=hrefArray;
        //NSLog(@"Flyers: %@", e.flyers);
        
        
        [parsedEvents addObject:e];
    }
    return parsedEvents;
}



@end

