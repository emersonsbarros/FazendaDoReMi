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

-(void)viewWillAppear:(BOOL)animated{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


-(void)chamaExercicios:(id)sender{
    
    Aula *button = sender;
    Exercicio *primeiroExercicio = [button.listaDeExercicios firstObject];
    id object = [[NSClassFromString([primeiroExercicio nomeView]) alloc]initWithNibName:[primeiroExercicio nomeView] bundle:nil];
    
    //[GerenciadorDeAula sharedManager].exercicioAtual = button;

    
    [self.navigationController pushViewController:object animated:YES];
    
}

- (IBAction)btnVoltaMenu:(id)sender {
    [[GerenciadorNavigationController sharedManager].controladorApp popViewControllerAnimated:YES];
}


//AulaSomViewController *aulaSom = [[AulaSomViewController alloc]init];
//[[GerenciadorNavigationController sharedManager].controladorApp pushViewController:aulaSom animated:YES];


-(void)mostraAulas{
    
    for(Aula *aula in [GerenciadorDeAula sharedManager].listaDeAulas){
        
        aula.layer.zPosition = 0;
        [aula addTarget:self action:@selector(chamaExercicios:) forControlEvents:UIControlEventTouchUpInside];
        
        [[self view] addSubview:aula];
        
    }
}

@end
