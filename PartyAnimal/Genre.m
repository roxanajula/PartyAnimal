//
//  Genre.m
//  PartyAnimal
//
//  Created by Gina Lupu on 9/23/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import "Genre.h"

@implementation Genre

+(NSMutableArray*) genreArrayFromGenreIDArray:(NSMutableArray *) idArray withGenreCollection: (NSMutableArray *) genreCollection {
    NSMutableArray *genreArray=[NSMutableArray array];
    for (Genre *g in genreCollection) {
        for (int i=0; i<[idArray count]; i++) {
            if ([g.identifier isEqual:idArray[i]]) {
                [genreArray addObject:g];
            }
        }
    }
    return genreArray;
}

@end
