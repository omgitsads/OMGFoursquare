//
//  OMGFoursquareRequestTest.m
//  OMGFoursquare
//
//  Created by Andy Holt on 22/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import <OCMock/OCMock.h>
#import "OMGFoursquareResponse.h"
#import "JSONKit.h"

@interface OMGFoursquareResponseSuccessTest : GHTestCase {
    NSDictionary *fixture;
    OMGFoursquareResponse *response;
}
@end

@implementation OMGFoursquareResponseSuccessTest

- (void)setUp {
    fixture = [[NSData dataWithContentsOfFile:[[NSBundle bundleForClass:[super class]] 
                                                         pathForResource:@"user" 
                                                         ofType:@"json"]] objectFromJSONData];
    BOOL yes = YES;
    OCMockObject *operation = [OCMockObject mockForClass:[AFHTTPRequestOperation class]];
    [[[operation stub] andReturnValue:OCMOCK_VALUE(yes)] hasAcceptableStatusCode];
    
    response = [[OMGFoursquareResponse alloc] initWithFoursquareResponseOperation:operation andResult:fixture];
}

- (void)testResponseSuccess {
    GHAssertTrue([response success], @"Request should be successful.");
}

- (void)testResponseContent {
    NSDictionary *user = [[response response] valueForKey:@"user"];
    NSString *firstName = [user valueForKey:@"firstName"];
    NSString *lastName = [user valueForKey:@"lastName"];
    
    GHAssertEqualStrings(firstName, @"Adam", @"firstName should be Adam");
    GHAssertEqualStrings(lastName, @"Holt", @"lastName should be Holt");
}

- (void)testResponseMeta {
    NSDictionary *meta = [response meta];
    NSNumber *responseCode = [meta valueForKey:@"code"];
    
    GHAssertEquals([responseCode intValue], 200, @"Response code should be 200");
}

- (void)testResponseError {
    GHAssertNil([response error], @"error should be nil");
}

@end

@interface OMGFoursquareResponseFSError : GHTestCase {
    NSDictionary *fixture;
    OMGFoursquareResponse *foursquareResponse;
}
@end

@implementation OMGFoursquareResponseFSError
- (void)setUp {
    fixture = [[NSData dataWithContentsOfFile:[[NSBundle bundleForClass:[super class]] 
                                               pathForResource:@"user_failed" 
                                               ofType:@"json"]] objectFromJSONData];
    BOOL yes = YES;
    OCMockObject *operation = [OCMockObject mockForClass:[AFHTTPRequestOperation class]];
    [[[operation stub] andReturnValue:OCMOCK_VALUE(yes)] hasAcceptableStatusCode];
    
    foursquareResponse = [[OMGFoursquareResponse alloc] initWithFoursquareResponseOperation:operation andResult:fixture];
}

- (void)testResponseSuccess {
    GHAssertFalse([foursquareResponse success], @"Request should be successful.");
}

- (void)testResponseContent {
    NSDictionary *res = [foursquareResponse response];
    NSInteger count = [res count];
    
    GHAssertNotNil(res, @"Foursquare Response should not be nil");
    GHAssertEquals(count, 0, @"Should have no keys");
}

- (void)testResponseMeta {
    NSDictionary *meta = [foursquareResponse meta];
    NSNumber *responseCode = [meta valueForKey:@"code"];
    
    GHAssertEquals([responseCode intValue], 400, @"Response code should be 400");
}

- (void)testResponseError {
    NSError *error = [foursquareResponse error];
    GHAssertNotNil(error, @"Error should not be nil");
    GHAssertEqualStrings([error localizedDescription], @"Must provide a valid user ID or 'self.'", @"Should use error message from Foursquare");
}

@end
