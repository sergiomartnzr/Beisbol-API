//
//  WebServices.h
//  Starwars API
//
//  Created by Walter Gonzalez Domenzain on 08/11/17.
//  Copyright © 2017 Boletomovil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "SWObject.h"
#import "BeisbolObject.h"

@interface WebServices : NSObject<NSURLSessionDelegate>

+ (void)getPeople:(void (^)(NSMutableArray<SWObject> *people)) handler;
+ (void)getPerson:(NSString*)personID completion: (void (^)(NSMutableArray<SWObject> *people)) handler;

+ (void)getGames:(void (^)(NSMutableArray<BeisbolObject> *games)) handler;

@end
