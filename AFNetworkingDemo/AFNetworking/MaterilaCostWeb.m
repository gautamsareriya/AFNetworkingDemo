//
//  MaterilaCostWeb.m
//  CorporateConstruction
//
//  Created by Infinium on 6/21/14.
//  Copyright (c) 2014 Infinium. All rights reserved.
//

#import "MaterilaCostWeb.h"


@implementation MaterilaCostWeb

+(void)MaterialCost:(NSDictionary *)params withBlocks:(void (^)(NSDictionary *response,int status, NSError *error))block
{
    NSError* error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    
    //NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
   // NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:params,@"data", nil];
    
    [[AFAppDotNetAPIClient sharedClient] POST:@"ws_listcategory.php" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
       /* NSString* json= [[NSString alloc] initWithData:responseObject encoding:NSASCIIStringEncoding];
        
        NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonObject=[NSJSONSerialization
                                  JSONObjectWithData:jsonData
                                  options:NSJSONReadingMutableLeaves
                                  error:nil];*/
        if (!error) {
            if (block) {
                //  NSLog(@"json string =>%@",jsonObject);
                
               // block(jsonObject,[[jsonObject objectForKey:@"code"] intValue],nil);
                block(responseObject,1,nil);
                
            }
        }

        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error =>%@",error);
        if (block) {
            block(nil,0,error);
        }

    }];
    
   /* NSURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:@"http://projects.infiniumsoftech.com/corporate_construction/admin/ws_listcategory.php" parameters:nil error:nil];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    operation.credential = [NSURLCredential credentialWithUser:@"username" password:@"password" persistence:NSURLCredentialPersistencePermanent];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (!error) {
            if (block) {
                //  NSLog(@"json string =>%@",jsonObject);
                
                block(responseObject,1,nil);
            }
        }
        NSLog(@"JSON: %@", responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];
    
    [[NSOperationQueue mainQueue] addOperation:operation];*/
    
    
    /*[[AFAppDotNetAPIClient sharedClient] postPath:@"ws_listcategory.php" parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString* json= [[NSString alloc] initWithData:responseObject encoding:NSASCIIStringEncoding];
        
        NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonObject=[NSJSONSerialization
                                  JSONObjectWithData:jsonData
                                  options:NSJSONReadingMutableLeaves
                                  error:nil];
        if (!error) {
            if (block) {
                //  NSLog(@"json string =>%@",jsonObject);
                
                block(jsonObject,[[jsonObject objectForKey:@"code"] intValue],nil);
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (block) {
            block(nil,0,error);
        }
    }];*/

}

@end