//
//  OMGFoursquareResponse.h
//  OMGFoursquare
//
//  Created by Andy Holt on 22/12/2011.
//  Copyright (c) 2011 OMGITSADS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"

@interface OMGFoursquareResponse : NSObject {
    AFHTTPRequestOperation *_operation;
    NSDictionary *_originalResponse;
    
}

- (OMGFoursquareResponse *)initWithFoursquareResponseOperation:(AFHTTPRequestOperation *)operation andResult:(id)result;
- (BOOL)success;
- (NSDictionary *)meta;
- (NSDictionary *)response;
- (NSError *)error;
@end
