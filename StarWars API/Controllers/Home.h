//
//  ViewController.h
//  Starwars API
//
//  Created by Walter Gonzalez Domenzain on 08/11/17.
//  Copyright © 2017 Boletomovil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServices.h"
#import "Constants.h"
#import "cellMainTable.h"
#import "Details.h"
@interface Home : UIViewController
- (IBAction)btnUpdatePressed:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UITableView *tbMain;


@end

