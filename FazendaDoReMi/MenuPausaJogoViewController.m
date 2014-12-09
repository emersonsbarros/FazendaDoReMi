//
//  MenuPausaJogoViewController.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 09/12/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "MenuPausaJogoViewController.h"

@interface MenuPausaJogoViewController ()

@end

@implementation MenuPausaJogoViewController

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

    if(!self.estadoMenu){
        self.lblBtnContinuar.hidden = YES;
        self.lblGameOver.hidden = NO;
        self.viewPontuacao.hidden = NO;
        self.lblPontuacao.font = [UIFont fontWithName:@"HelveticaNeue" size:67];
        self.lblPontuacao.text = [NSString stringWithFormat:@"%d",self.pontuacao];
        self.lblGameOver.font = [UIFont fontWithName:@"HelveticaNeue" size:60];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnVoltarMenuJogo:(id)sender {
    [[GerenciadorNavigationController sharedManager].controladorApp popViewControllerAnimated:NO];
}

- (IBAction)btnRefazer:(id)sender {
    [self esconderMenuDePausa];
    [[GerenciadorAudio sharedManager] stopAudio];
    
    Exercicio *exercicio = [[GerenciadorDeAula sharedManager].aulaAtual.listaDeExercicios objectAtIndex: [GerenciadorDeAula sharedManager].indexDoExercicioAtual];
    id object = [[NSClassFromString([exercicio nomeView]) alloc]initWithNibName:[exercicio nomeView] bundle:nil];
    
    [[GerenciadorNavigationController sharedManager].controladorApp popToViewController:[[GerenciadorNavigationController sharedManager]retornaViewControllerStoryBoard:@"jogos"] animated:NO];
    [[GerenciadorNavigationController sharedManager].controladorApp pushViewController: object animated: NO];
}

- (IBAction)btnTutorial:(id)sender {
    
}

- (IBAction)btnContinuar:(id)sender {
    [GerenciadorDeAula sharedManager].cenaAtual.view.paused = NO;
    [self esconderMenuDePausa];
    [[GerenciadorAudio sharedManager] ajustaVolume: 1];
}

//Esconder Menu de Pausa
-(void)esconderMenuDePausa{
    
    //Encontra a view e dá hidden
    for (UIViewController *vc in [GerenciadorNavigationController sharedManager].controladorApp.visibleViewController.childViewControllers) {
        if([vc isKindOfClass: [MenuPausaJogoViewController class]])
            vc.view.hidden = YES;
    }
    
}


@end
