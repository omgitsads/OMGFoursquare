//
//  OMGFoursquareTest.m
//  OMGFoursquare
//
//  Created by Andy Holt on 21/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "OMGFoursquare.h"

@interface OMGFoursquareTest : GHTestCase {}
@end

@implementation OMGFoursquareTest

- (void)testSingletonObject {
    GHAssertEqualObjects([OMGFoursquare sharedInstance], 
                         [OMGFoursquare sharedInstance], 
                         @"should be the same singleton instance");
}

@end
