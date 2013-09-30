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

+(NSMutableArray*) artistArrayFromArtistIDArray:(NSMutableArray *) idArray withArtistCollection: (NSMutableArray *) artistCollection {
    NSMutableArray *artistArray=[NSMutableArray array];
    for (Artist *a in artistCollection) {
        for (int i=0; i<[idArray count]; i++) {
            if ([a.identifier isEqual:idArray[i]]) {
                [artistArray addObject:a];
            }
        }
    }
    return artistArray;
}

@end
