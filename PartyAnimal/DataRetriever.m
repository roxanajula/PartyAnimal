//
//  DataRetriever.m
//  PartyAnimal
//
//  Created by Gina Lupu on 9/23/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import "Event.h"
#import "Artist.h"
#import "DataRetriever.h"
#import "Factory.h"

@implementation DataRetriever

+ (void) retrieveData {
    NSURL *url = [NSURL URLWithString:@"http://api.clubjudge.com/events/upcoming?location[lat]=46&location[lon]=23page=0&named_scopes[]=featured"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                             //  NSError *error;
                               NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:data
                                                                                            options:NSJSONReadingMutableContainers
                                                                                              error:nil];
                               
                               // NSLog(@"%@", responseData);
                               // put them in models
                               // Artists
                               
                               NSMutableArray *parsedArtists = [Factory createArtistCollection:responseData];
                               NSLog(@"%@", parsedArtists );
                               //Events
                               
                               NSMutableArray *parsedEvents = [NSMutableArray array];
                                 for (NSDictionary *event in responseData[@"events"]) {
                                        Event *e = [[Event alloc] init];
                                        e.name = event[@"name"];
                                        e.startsAt=event[@"starts_at"];
                                        e.artists=event[@"artists"];
                                        NSLog(@"%@", e.artists );
                                        [parsedEvents addObject:e];
                                                        }
                               
                             
                               
                           }];
}

@end
