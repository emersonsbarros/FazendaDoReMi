//
//  MenuViewController.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 26/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   // [self.btoEstudio.titleLabel setFont: [UIFont fontWithName:@"Vanilla" size:20]];
    
    [[UILabel appearance] setFont:[UIFont fontWithName:@"Vanilla" size:17.0]];
    //[[UIButton appearance].titleLabel setFont:[UIFont fontWithName:@"Vanilla" size:17.0]];



}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
