//
//  OMGFoursquareResponse.m
//  OMGFoursquare
//
//  Created by Adam Holt on 22/12/2011.
//  Copyright (c) 2011 OMGITSADS LTD. All rights reserved.
//

#import "OMGFoursquareResponse.h"

@implementation OMGFoursquareResponse
- (OMGFoursquareResponse*)initWithFoursquareResponseOperation:(AFHTTPRequestOperation *)operation andResult:(id)result {
    if(self = [super init]){
        _operation = operation;
        _originalResponse = result;
    }
    return self;
}

- (BOOL)success {
    return [_operation hasAcceptableStatusCode] && [[[self meta] valueForKey:@"code"] intValue] == 200;
}

- (NSDictionary*)meta {
    return [_originalResponse valueForKey:@"meta"];
}

- (NSDictionary*)response {
    return [_originalResponse valueForKey:@"response"];
}

- (NSError*)error {
    if ([self success]) { return nil; }
    
    NSMutableDictionary *errorDetail = [NSMutableDictionary dictionary];
    [errorDetail setValue:[[self meta] valueForKey:@"errorDetail"] forKey:NSLocalizedDescriptionKey];
    NSError *error = [NSError errorWithDomain:[[self meta] valueForKey:@"errorType"] 
                                         code:[[self meta] valueForKey:@"code"] 
                                     userInfo:errorDetail];
    return error;
}

@end
