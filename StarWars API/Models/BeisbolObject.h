//
//  BeisbolObject.h
//  Starwars API
//
//  Created by Sergio Martinez on 11/15/17.
//  Copyright © 2017 Boletomovil. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol BeisbolObject
@end

@interface BeisbolObject : JSONModel

@property (strong, nonatomic) NSString *away_logo;
@property (strong, nonatomic) NSString *away_name;
@property (strong, nonatomic) NSString *home_logo;
@property (strong, nonatomic) NSString *home_name;
@property (strong, nonatomic) NSString *startTime;
@property (strong, nonatomic) NSString *time;
@end
