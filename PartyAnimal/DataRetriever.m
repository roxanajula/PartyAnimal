//
//  DataRetriever.m
//  PartyAnimal
//
//  Created by Gina Lupu on 9/23/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import "Event.h"
#import "Artist.h"
#import "Genre.h"
#import "Venue.h"
#import "DataRetriever.h"
#import "Factory.h"

@implementation DataRetriever

+ (void) retrieveData {
    NSURL *url = [NSURL URLWithString:@"http://api.clubjudge.com/events/upcoming?location[lat]=52&location[lon]=4page=0&named_scopes[]=featured"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                             //  NSError *error;
                               NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:data
                                                                                            options:NSJSONReadingMutableContainers
                                                                                              error:nil];
                               
                                NSLog(@"%@", responseData);
                              
                               
            // Artists
                               
            NSMutableArray *parsedArtists = [Factory createArtistCollection:responseData];
            //NSLog(@"%@", parsedArtists );
                               
            //Music genres
                 
            NSMutableArray *parsedGenres = [Factory createGenreCollection:responseData];
            //NSLog(@"%@", parsedGenres );
                            
            //Venues
            NSMutableArray *parsedVenues = [Factory createVenueCollection:responseData];
            NSLog(@"%@", parsedVenues);
            
            //Events
                               NSMutableArray *parsedEvents = [NSMutableArray array];
                               for (NSDictionary *event in responseData[@"events"]) {
                                   Event *e = [[Event alloc] init];
                                   NSLog(@"***************************");
                                   e.name = event[@"name"];
                                   NSLog(@"Event name: %@", e.name);
                                   
                                   NSString *startsAtString = event[@"starts_at"];
                                   NSLog(@"StartsAt String: %@", startsAtString);
                                   NSDateFormatter *df = [[NSDateFormatter alloc] init];
                                   [df setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssz"];
                                   e.startsAt= [df dateFromString: startsAtString];
                                   NSLog(@"Starts at: %@", e.startsAt);
                                   
                                   NSDictionary *feesDict = [event objectForKey:@"fees"];
                                   e.fees = [[Fees alloc]init];
                                   e.fees.kind = [feesDict valueForKey:@"kind"][0];
                                   e.fees.currency =  [feesDict valueForKey:@"currency"][0];
                                   e.fees.price = [[feesDict valueForKey:@"cents"][0] floatValue]/100;
                                   NSLog(@"Cents: %f Kind: %@ Currency: %@", e.fees.price, e.fees.kind, e.fees.currency);
                                   
                                   
                                   NSMutableArray *artistsID = event[@"artists"];
                                   e.artists = [Artist artistArrayFromArtistIDArray:artistsID withArtistCollection:parsedArtists];
                                   for (int i=0; i<[e.artists count]; i++) {
                                       Artist *ar=e.artists[i];
                                       NSLog(@"Artist name: %@", ar.name);
                                   }
                                   
                                   
                                   NSMutableArray *genresID = event[@"music_genres"];
                                   e.genres = [Genre genreArrayFromGenreIDArray:genresID withGenreCollection:parsedGenres];
                                   for (int i=0; i<[e.genres count]; i++) {
                                       Genre *ge=e.genres[i];
                                       NSLog(@"Genre name: %@", ge.name);
                                   }
                                   
                                   NSString *venueID = event[@"venue"];
                                   e.venue = [Venue venueFromVenueID:venueID withVenueCollection:parsedVenues];
                                   NSLog(@"Venue name: %@", e.venue.name);
                                   NSLog(@"Address: %@, %@, %@, %@", e.venue.address.city, e.venue.address.country, e.venue.address.street, e.venue.address.zipCode);
                                   
                                 
                                   NSDictionary *flyersDictionary = [event valueForKey:@"flyers"];
                                   NSDictionary *versionsDictionary = [flyersDictionary valueForKey:@"versions"][0];
                                   NSMutableArray *hrefArray = [versionsDictionary valueForKey:@"href"];
                                   e.flyers=hrefArray;
                                   NSLog(@"Flyers: %@", e.flyers);
                                   
                                  
                                   [parsedEvents addObject:e];
                               }
                               
                             
                               
                           }];
}

@end
