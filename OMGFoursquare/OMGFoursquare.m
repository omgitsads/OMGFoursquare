//
//  OMGFoursquare.m
//  OMGFoursquare
//
//  Created by Andy Holt on 21/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "OMGFoursquare.h"

@implementation OMGFoursquare

+ (OMGFoursquare *)sharedInstance {
    static OMGFoursquare *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@end
