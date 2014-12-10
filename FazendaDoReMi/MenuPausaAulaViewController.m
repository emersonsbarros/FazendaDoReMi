//
//  MenuPausaAulaViewController.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 19/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "MenuPausaAulaViewController.h"

@interface MenuPausaAulaViewController ()

@end

@implementation MenuPausaAulaViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Se estiver no último exercício bloqueia o botão de avançar
    if (([GerenciadorDeAula sharedManager].indexDoExercicioAtual == [GerenciadorDeAula sharedManager].aulaAtual.listaDeExercicios.count - 1) || ([ControladorDeItem sharedManager].aulaFinalizada == false)) {
        self.outBtoAvancar.enabled = NO;
    }else{
        self.outBtoAvancar.enabled = YES;
    }
    
}

//TUTORIAL
- (IBAction)btoTutorial:(id)sender {
}

//REFAZER
- (IBAction)btoRefazer:(id)sender{
    
    [self esconderMenuDePausa];
    [[GerenciadorAudio sharedManager] stopAudio];
    
    Exercicio *exercicio = [[GerenciadorDeAula sharedManager].aulaAtual.listaDeExercicios objectAtIndex: [GerenciadorDeAula sharedManager].indexDoExercicioAtual];
    id object = [[NSClassFromString([exercicio nomeView]) alloc]initWithNibName:[exercicio nomeView] bundle:nil];
    
    [[GerenciadorNavigationController sharedManager].controladorApp popToViewController:[[GerenciadorNavigationController sharedManager]retornaViewControllerStoryBoard:@"mapa"] animated:NO];
    [[GerenciadorNavigationController sharedManager].controladorApp pushViewController: object animated: NO];
    
}

//AVANÇAR
- (IBAction)btoAvancar:(id)sender {
    
    //Menu pausa hidden
    [self esconderMenuDePausa];
    
    //Avança na lista de exerxícicios
    [GerenciadorDeAula sharedManager].indexDoExercicioAtual += 1;
    
    //Recebe o exercício, separa a viewcontroller
    Exercicio *exercicio = [[GerenciadorDeAula sharedManager].aulaAtual.listaDeExercicios objectAtIndex: [GerenciadorDeAula sharedManager].indexDoExercicioAtual];
    id object = [[NSClassFromString([exercicio nomeView]) alloc]initWithNibName:[exercicio nomeView] bundle:nil];
    
    //Push no novo exe
    [self.navigationController pushViewController: object animated:YES];
    
}

//VOLTA PARA O MENU DO MAPA
- (IBAction)btoMapa:(id)sender{
    [[GerenciadorNavigationController sharedManager].controladorApp popToViewController:[[GerenciadorNavigationController sharedManager]retornaViewControllerStoryBoard:@"mapa"] animated:YES];
}


//CONTINUAR
- (IBAction)btoContinuar:(id)sender {
    [self esconderMenuDePausa];
    [[GerenciadorAudio sharedManager] ajustaVolume: 1];
    
}

//Esconder Menu de Pausa
-(void)esconderMenuDePausa{
    
    //Encontra a view e dá hidden
    for (UIViewController *vc in [GerenciadorNavigationController sharedManager].controladorApp.visibleViewController.childViewControllers) {
        if([vc isKindOfClass: [MenuPausaAulaViewController class]])
            vc.view.hidden = YES;
    }
    
}

@end
