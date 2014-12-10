//
//  BotaoVoltarViewController.m
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 23/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "BotaoVoltarViewController.h"

@interface BotaoVoltarViewController ()

@end

@implementation BotaoVoltarViewController



- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnVoltar:(id)sender {
    [[GerenciadorNavigationController sharedManager].controladorApp popViewControllerAnimated:NO];
}




@end
