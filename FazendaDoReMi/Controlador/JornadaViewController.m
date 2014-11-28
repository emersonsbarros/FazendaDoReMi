//
//  JornadaViewController.m
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 01/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "JornadaViewController.h"
#import "AulaSomEx1ViewController.h"
#import "GerenciadorComponenteView.h"
#import "GerenciadorDeAula.h"

@interface JornadaViewController ()
@end

@implementation JornadaViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self mostraAulas];
}

-(void)chamaExercicios:(id)sender{
    
    //Aula, Exercicio, ViewController
    Aula *button = sender;
    Exercicio *primeiroExercicio = [button.listaDeExercicios firstObject];
    
    
    id object = [[NSClassFromString([primeiroExercicio nomeView]) alloc]initWithNibName:[primeiroExercicio nomeView] bundle:nil];
    
    //Guardar a aula e exercício atual
    [GerenciadorDeAula sharedManager].aulaAtual = button;
    [GerenciadorDeAula sharedManager].indexDoExercicioAtual = 0;
    
    //Push no navigation com a view do exercício
    [self.navigationController pushViewController: object animated: YES];
    
}

- (IBAction)btnVoltaMenu:(id)sender {
    [[GerenciadorNavigationController sharedManager].controladorApp popViewControllerAnimated:YES];
}


-(void)mostraAulas{
    
    for(Aula *aula in [GerenciadorDeAula sharedManager].listaDeAulas){
        
        aula.layer.zPosition = 0;
        [aula addTarget:self action:@selector(chamaExercicios:) forControlEvents:UIControlEventTouchUpInside];
        
        [[self view] addSubview:aula];
        
    }
}

@end
