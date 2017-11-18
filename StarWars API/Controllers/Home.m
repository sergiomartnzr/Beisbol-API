//
//  ViewController.m
//  Starwars API
//
//  Created by Walter Gonzalez Domenzain on 08/11/17.
//  Copyright © 2017 Boletomovil. All rights reserved.
//

#import "Home.h"

@interface Home ()
@property (strong, nonatomic) NSMutableArray *games;
@property (strong, nonatomic) NSMutableArray *people;
@property (strong, nonatomic) SWObject *personAtIndex;
@property NSMutableArray *dataToSend;
@property NSMutableArray *userImages;
@end

int indexPerson = 0;

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _people = [[NSMutableArray alloc] init];
    _games = [[NSMutableArray alloc] init];
    //_personAtIndex = [[SWObject alloc] init];
    [self getGames];
    //[self getPeople];
    //[self getPerson];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController {
    
    self.userImages = [[NSMutableArray alloc] initWithObjects: [UIImage imageNamed:@"venados.png"], [UIImage imageNamed:@"yaquis.png"], [UIImage imageNamed:@"tomateros.png"], [UIImage imageNamed:@"aguilas.png"], [UIImage imageNamed:@"caneros.png"], nil];
}

//********************************************************************************************
#pragma mark                            Data methods
//********************************************************************************************

- (void)getGames{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [WebServices getGames:^(NSMutableArray<BeisbolObject> *latestGames) {
        
        if(latestGames){
            [_games removeAllObjects];
            [_games addObjectsFromArray:latestGames];
            
            BeisbolObject *game = [latestGames objectAtIndex:0];
            NSString *time = game.time;
            
            NSLog(@"--------------------------------------print time : %@", time);
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}

- (void)getPeople{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [WebServices getPeople:^(NSMutableArray<SWObject> *people) {
        
        if(people){
            [_people removeAllObjects];
            [_people addObjectsFromArray:people];
            
            SWObject *person = [people objectAtIndex:indexPerson];
            NSString *name = person.name;
            
            NSLog(@"print name : %@", name);
            self.lblName.text = name;
            self.lblName.adjustsFontSizeToFitWidth = YES;
            indexPerson++;
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}
- (void)getPerson{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [WebServices getPerson:@"1" completion:^(NSMutableArray<SWObject> *people) {
        
        if(people){
            [_people removeAllObjects];
            [_people addObjectsFromArray:people];
            
            SWObject *person = [people objectAtIndex:indexPerson];
            NSString *name = person.name;
            
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}

- (SWObject *)getPersonAtIndex:(int) index{
    NSLog(@"··················· Entering method method");
    //__block SWObject *personIndex = [[SWObject alloc] init];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [WebServices getPeople:^(NSMutableArray<SWObject> *people) {
        
        if(people){
            [_people removeAllObjects];
            [_people addObjectsFromArray:people];
            
            self.personAtIndex = [people objectAtIndex:index];
            NSString *name = self.personAtIndex.name;
            
            NSLog(@"print name from method works: %@", name);
            
            //_personAtIndex = person;
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
    
    NSString *names = self.personAtIndex.name;
    NSLog(@"IM PRINTING: %@", self.personAtIndex.name);
    return self.personAtIndex;
}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //Get the number of characters after load the from API
    return self.games.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellMainTable *cell = (cellMainTable *)[tableView dequeueReusableCellWithIdentifier:@"cellMainTable"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellMainTable" bundle:nil] forCellReuseIdentifier:@"cellMainTable"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellMainTable"];
    }
    //Fill cell with info from arrays
    
    BeisbolObject *game = [_games objectAtIndex:indexPath.row];
    
    

    cell.lblAwayName.text = game.away_name;
    cell.lblHomeName.text = game.home_name;
    cell.lblTime.text = game.time;
    cell.lblStartTime.text = game.startTime;
    cell.imgAway.image = [UIImage imageNamed:[NSString stringWithFormat: @"%@.png", game.away_name]];
    cell.imgHome.image = [UIImage imageNamed:[NSString stringWithFormat: @"%@.png", game.home_name]];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Pending
    NSLog(@"Item selected");
}
/**********************************************************************************************/
#pragma mark - Action methods
/**********************************************************************************************/
- (IBAction)btnUpdatePressed:(id)sender {
    [self getGames];
    //Reload the table to fill it with the characters since at load time, the number of characters is 0
    [self.tbMain reloadData];
    NSLog(@"········································Reloading");
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"secondView"])
    {
        Details *controller = [segue destinationViewController];
        controller.data = sender;
        NSLog(@"Segueado!!!!!");
        
    }
}
@end
