//
//  MaterilaCostWeb.h
//  CorporateConstruction
//
//  Created by Infinium on 6/21/14.
//  Copyright (c) 2014 Infinium. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFAppDotNetAPIClient.h"

@interface MaterilaCostWeb : NSObject

+(void)MaterialCost:(NSDictionary *)params withBlocks:(void (^)(NSDictionary *response,int status, NSError *error))block;
+(void)CostMaterial:(NSDictionary *)params withBlocks:(void (^)(NSDictionary *response, int status, NSError *error))block;

@end
