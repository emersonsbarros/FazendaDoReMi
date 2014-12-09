//
//  TelaJogosViewController.m
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 08/12/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "TelaJogosViewController.h"

@interface TelaJogosViewController ()

@end

@implementation TelaJogosViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoVoltar:self:0:-8];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btnJogoFlap:(id)sender {
    JogoFlapCaoViewController *jogo = [[JogoFlapCaoViewController alloc]init];
    [self.navigationController pushViewController:jogo animated:NO];
}


- (IBAction)btnJogoTimbre:(id)sender {
    
}







@end
