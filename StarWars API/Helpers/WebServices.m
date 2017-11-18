//
//  WebServices.m
//  Starwars API
//
//  Created by Walter Gonzalez Domenzain on 08/11/17.
//  Copyright © 2017 Boletomovil. All rights reserved.
//

#import "WebServices.h"
#define nResponseCodeOK     200

#define nURLStarwarsPeople  @"people/"

#define nURLBeisbolDate  @"2017/11/15/"

@implementation WebServices
//--------------------------------------------------------------------------------------------
+ (void)getPeople:(void (^)(NSMutableArray<SWObject> *people)) handler{
    
    //init data dictionary
    NSMutableDictionary *diData = [[NSMutableDictionary alloc]init];
    
//    //add parameters to dictionary
//    [diData setValue:strTimestamp   forKey:@"timestamp"];
//    [diData setValue:nBMPublicKey   forKey:@"public_key"];
    
    //convert to json string
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:diData options:0 error:&error];
    
    if (!jsonData) {
        //Deal with error
    } else {
        NSString *strData = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSURLSession *session = [self getSession];
        NSMutableURLRequest * request = [self getRequest:[nURLStarwarsAPI stringByAppendingString:nURLStarwarsPeople] forData:strData];
        
        [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            if(data!=nil){
                NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                NSLog(@"response received %@",jsonResponse);
                
                if(jsonResponse!=nil){
                    
                    int responseCode = [jsonResponse[@"response_code"] intValue];
                    
                    if(1){
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                            @try {
                                NSError *err = nil;
                                NSMutableArray<SWObject>  *people = (NSMutableArray<SWObject> *)[SWObject arrayOfModelsFromDictionaries:[jsonResponse objectForKey:@"results"] error:&err];
                                handler(people);
                            }
                            @catch (NSException *exception) {
                                handler(nil);
                            }
                        });
                    }else{
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            handler(nil);
                        });
                    }
                }else{
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        handler(nil);
                    });
                }
            }else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    handler(nil);
                });
            }
        }] resume];
    }
}
//--------------------------------------------------------------------------------------------
+ (void)getPerson:(NSString*)personID completion:(void (^)(NSMutableArray<SWObject> *people)) handler{
    
    //init data dictionary
    NSMutableDictionary *diData = [[NSMutableDictionary alloc]init];
    
    //    //add parameters to dictionary
    //    [diData setValue:strTimestamp   forKey:@"timestamp"];
    //    [diData setValue:nBMPublicKey   forKey:@"public_key"];
    
    //convert to json string
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:diData options:0 error:&error];
    
    if (!jsonData) {
        //Deal with error
    } else {
        NSString *strData = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSURLSession *session = [self getSession];
        NSString *urlPersonID = [nURLStarwarsPeople stringByAppendingString:personID];
        NSMutableURLRequest * request = [self getRequest:[nURLStarwarsAPI stringByAppendingString:urlPersonID] forData:strData];
        
        [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            if(data!=nil){
                NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                NSLog(@"response received %@",jsonResponse);
                
                if(jsonResponse!=nil){
                    
                    int responseCode = [jsonResponse[@"response_code"] intValue];
                    
                    if(1){
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                            @try {
                                NSError *err = nil;
                                NSMutableArray<SWObject>  *people = (NSMutableArray<SWObject> *)[SWObject arrayOfModelsFromDictionaries:[jsonResponse objectForKey:@"results"] error:&err];
                                handler(people);
                            }
                            @catch (NSException *exception) {
                                handler(nil);
                            }
                        });
                    }else{
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            handler(nil);
                        });
                    }
                }else{
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        handler(nil);
                    });
                }
            }else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    handler(nil);
                });
            }
        }] resume];
    }
}

//**********************************************************************************************
#pragma mark                              Beisbol methods
//**********************************************************************************************

//--------------------------------------------------------------------------------------------
+ (void)getGames:(void (^)(NSMutableArray<BeisbolObject> *games)) handler{
    
    //init data dictionary
    NSMutableDictionary *diData = [[NSMutableDictionary alloc]init];
    
    //    //add parameters to dictionary
    //    [diData setValue:strTimestamp   forKey:@"timestamp"];
    //    [diData setValue:nBMPublicKey   forKey:@"public_key"];
    
    //convert to json string
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:diData options:0 error:&error];
    
    if (!jsonData) {
        //Deal with error
    } else {
        NSString *strData = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSURLSession *session = [self getSession];
        NSMutableURLRequest * request = [self getRequest:[nURLBeisbolAPI stringByAppendingString:nURLBeisbolDate] forData:strData];
        
        [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            if(data!=nil){
                NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                NSLog(@"response received %@",jsonResponse);
                
                if(jsonResponse!=nil){
                    
                    int responseCode = [jsonResponse[@"response_code"] intValue];
                    
                    if(1){
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                            @try {
                                NSError *err = nil;
                                NSMutableArray<BeisbolObject>  *games = (NSMutableArray<BeisbolObject> *)[BeisbolObject arrayOfModelsFromDictionaries:jsonResponse [@"response"][@"games"][@"Miercoles 15 Noviembre 2017"] error:&err];
                                
                                handler(games);
                            }
                            @catch (NSException *exception) {
                                handler(nil);
                            }
                        });
                    }else{
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            handler(nil);
                        });
                    }
                }else{
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        handler(nil);
                    });
                }
            }else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    handler(nil);
                });
            }
        }] resume];
    }
}

//**********************************************************************************************
#pragma mark                              Common methods
//**********************************************************************************************
+ (NSMutableURLRequest *) getRequest:(NSString *) url forData:(NSString *) data{
    
    NSURL *httpUrl = [NSURL URLWithString:url];
    NSLog(@"URL post = %@", url);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSString * version = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
    
    if(data){
        
        NSString * tempData = data;
        NSString *post = @"";//[[NSString alloc] initWithFormat:@"data=%@", tempData];
        NSLog(@"post parameters: %@",post);
        post = [post stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
        NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        [request setURL:httpUrl];
        [request setHTTPMethod:@"GET"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:[@"Write your user agent name " stringByAppendingString:version] forHTTPHeaderField:@"User-Agent"];
        [request setHTTPBody:postData];
        [NSURLRequest requestWithURL:httpUrl];
    }else{
        [request setURL:httpUrl];
        [request setHTTPMethod:@"GET"];
        //[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:[@"iOS Boletomovil " stringByAppendingString:version] forHTTPHeaderField:@"User-Agent"];
        [NSURLRequest requestWithURL:httpUrl];
    }
    
    return request;
    
    
}
//--------------------------------------------------------------------------------------------
+(NSURLSession *)getSession{
    
    // Create Session Configuration
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // Configure Session Configuration
    [sessionConfiguration setAllowsCellularAccess:YES];
    [sessionConfiguration setHTTPMaximumConnectionsPerHost:20];
    [sessionConfiguration setHTTPAdditionalHeaders:@{@"Accept" : @"application/json"}];
    
    return [NSURLSession sessionWithConfiguration:sessionConfiguration];
}
//*********************************************************************************************
#pragma mark                                alloc
//*********************************************************************************************
+ (id)alloc {
    [NSException raise:@"Cannot be instantiated!" format:@"Static class 'ClassName' cannot be instantiated!"];
    return nil;
}

@end
