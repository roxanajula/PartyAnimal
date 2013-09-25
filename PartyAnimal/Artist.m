//
//  Artist.m
//  PartyAnimal
//
//  Created by Roxana Jula on 9/24/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import "Artist.h"
#import "Factory.h"
#import "DataRetriever.h"

@implementation Artist

+(NSString *) artistNamebyId: (NSString *) identif fromData:(NSDictionary *) responseData {
    NSMutableArray *artistCollection = [Factory createArtistCollection:responseData];
    
    for (Artist *a in artistCollection) {
        if ([a.identifier isEqualToString:identif]){
            return a.name;
        }
        
    
    }
    return nil;
}


@end
