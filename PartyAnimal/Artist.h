//
//  Artist.h
//  PartyAnimal
//
//  Created by Roxana Jula on 9/24/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject
@property (strong,nonatomic) NSString * name;
@property (strong,nonatomic) NSString * identifier;

+(NSMutableArray*) artistArrayFromArtistIDArray:(NSMutableArray *) idArray withArtistCollection: (NSMutableArray *) artistCollection;
@end
