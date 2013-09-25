//
//  Factory.m
//  PartyAnimal
//
//  Created by Gina Lupu on 9/24/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import "Factory.h"
#import "Artist.h"


@implementation Factory

+(NSMutableArray *) createArtistCollection:(NSDictionary *) responseData {
    NSMutableArray *parsedArtists = [NSMutableArray array];
    for (NSDictionary *artist in responseData[@"artists"]) {
        Artist *a = [[Artist alloc] init];
        a.name=artist[@"name"];
        a.identifier=artist[@"identifier"];
        NSLog(@"%@", a.name );
        [parsedArtists addObject:a];
    }
    return parsedArtists;
}

@end

