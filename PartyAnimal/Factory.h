//
//  Factory.h
//  PartyAnimal
//
//  Created by Gina Lupu on 9/24/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject

+(NSMutableArray *) createArtistCollection:(NSDictionary *) responseData;
+(NSMutableArray *) createGenreCollection:(NSDictionary *) responseData;
+(NSMutableArray *) createVenueCollection:(NSDictionary *) responseData;
+(NSMutableArray *) createEventCollection:(NSDictionary *) responseData;

@end
