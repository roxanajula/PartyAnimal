//
//  Fees.h
//  PartyAnimal
//
//  Created by Gina Lupu on 9/23/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fees : NSObject

@property (strong, nonatomic) NSString * kind;
@property (strong, nonatomic) NSString * currency;
@property (nonatomic) CGFloat price;

@end
