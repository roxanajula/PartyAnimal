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

+ (void) retrieveData:(response)block {
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
                               block([Factory createEventCollection:responseData]);
                           }];
    
}

@end
