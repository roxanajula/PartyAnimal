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
        NSLog(@"Venue information: Name %@ ID %@ Phone %@ Website %@", v.name, v.identifier, v.phoneNo, v.website);
        NSLog(@"Venue address: City %@ Country %@ Street %@ Zip %@", v.address.city, v.address.country, v.address.street, v.address.zipCode);
    }
    return parsedVenues;
}




@end

