//
//  Details.m
//  Starwars API
//
//  Created by Sergio Martinez on 11/12/17.
//  Copyright © 2017 Boletomovil. All rights reserved.
//

#import "Details.h"

@interface Details ()

@end

@implementation Details

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.data != nil) {
        self.name.text= self.data[@"name"];
        self.gender.text= self.data[@"gender"];
        self.hair_color.text = self.data[@"hair_color"];
        self.skin_color.text = self.data[@"skin_color"];
        self.mass.text = self.data[@"mass"];
        self.height.text = self.data[@"height"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
