//
//  CurrentLocationRetriever.h
//  PartyAnimal
//
//  Created by Gina Lupu on 10/1/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface CurrentLocationRetriever : NSObject

+ (CLLocation *) getCurrentLocation;

@end
