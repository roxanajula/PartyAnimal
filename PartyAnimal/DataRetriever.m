//
//  DataRetriever.m
//  PartyAnimal
//
//  Created by Gina Lupu on 9/23/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import "DataRetriever.h"

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
                               
                               NSLog(@"%@", responseData);
                               // put them in models
                               
                               //                               NSMutableArray *parsedEvents = [NSMutableArray array];
                               //                               for (NSDictionary *event in events[@"artists"]) {
                               //                                   Event *e = [[Event alloc] init];
                               //                                   e.name = event[@"name"];
                               //                                   e.location = event[@"location"];
                               //
                               //                                   [parsedEvents addObject:e];
                               //                               }
                               
                               //GINA WAS HERE
                               
                           }];
}

@end
