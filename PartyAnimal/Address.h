//
//  Address.h
//  PartyAnimal
//
//  Created by Roxana Jula on 9/24/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject
@property (strong, nonatomic) NSString * city;
@property (strong, nonatomic) NSString * country;
@property (strong, nonatomic) NSString * street;
@property (strong, nonatomic) NSString * zipCode;

@end
