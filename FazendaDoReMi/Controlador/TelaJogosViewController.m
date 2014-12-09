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
    
    Exercicio *jogo = [[[GerenciadorDeAula sharedManager]retornaExercicio:@"Jogos":@"FlapCao"]objectAtIndex:1];
    Aula *aula = [[[GerenciadorDeAula sharedManager]retornaExercicio:@"Jogos":@"FlapCao"]objectAtIndex:0];
    
    id object = [[NSClassFromString([jogo nomeView]) alloc]initWithNibName:[jogo nomeView] bundle:nil];
    
    //Guardar a aula e exercício atual
    [GerenciadorDeAula sharedManager].aulaAtual = aula;
    [GerenciadorDeAula sharedManager].indexDoExercicioAtual = 0;
    
    //Push no navigation com a view do exercício
    [self.navigationController pushViewController: object animated: YES];
    
}


- (IBAction)btnJogoTimbre:(id)sender {

    
}







@end
