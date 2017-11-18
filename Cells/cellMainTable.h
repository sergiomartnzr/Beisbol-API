//
//  cellMainTable.h
//  Starwars API
//
//  Created by Sergio Martinez on 11/11/17.
//  Copyright © 2017 Boletomovil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cellMainTable : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lblAwayName;
@property (strong, nonatomic) IBOutlet UILabel *lblHomeName;
@property (strong, nonatomic) IBOutlet UIImageView *imgAway;
@property (strong, nonatomic) IBOutlet UIImageView *imgHome;
@property (strong, nonatomic) IBOutlet UILabel *lblTime;
@property (strong, nonatomic) IBOutlet UILabel *lblStartTime;

@end
