//
//  BotaoHomeViewController.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 07/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "BotaoVoltarMapaViewController.h"

@interface BotaoVoltarMapaViewController ()

@end

@implementation BotaoVoltarMapaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


-(void)viewDidAppear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnVoltarMapa:(id)sender {
    
    [[GerenciadorNavigationController sharedManager].controladorApp popToViewController:[[GerenciadorNavigationController sharedManager]retornaViewControllerStoryBoard:@"mapa"] animated:YES];
    
}



@end
