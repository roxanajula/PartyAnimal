//
//  DataRetriever.h
//  PartyAnimal
//
//  Created by Gina Lupu on 9/23/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^response)(NSArray* response);

@interface DataRetriever : NSObject

+ (void) retrieveData:(response)block;

@end
