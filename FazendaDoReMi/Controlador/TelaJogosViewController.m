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

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    [self animacaoMovimentarPosicao:self.imgNuvem1 :50.0 :1400 :30];
    [self animacaoMovimentarPosicao:self.imgNuvem2 :50.0 :-1400 :70];
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:YES];
    
    [self.imgNuvem1.layer removeAllAnimations];
    [self.imgNuvem2.layer removeAllAnimations];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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


-(void)animacaoMovimentarPosicao:(UIImageView*)imagem :(float)tempo :(float)posX :(float)posY{
    
    CABasicAnimation *moveNuvemDireita= [CABasicAnimation animationWithKeyPath:@"position"];
    moveNuvemDireita.duration = tempo;
    moveNuvemDireita.repeatCount = INFINITY;
    moveNuvemDireita.removedOnCompletion = NO;
    moveNuvemDireita.autoreverses = YES;
    moveNuvemDireita.fromValue = [NSValue valueWithCGPoint: CGPointMake(imagem.frame.origin.x+(imagem.frame.size.width/2), imagem.frame.origin.y+posY)];
    moveNuvemDireita.toValue = [NSValue valueWithCGPoint: CGPointMake(imagem.frame.origin.x+(imagem.frame.size.width/2)+posX, imagem.frame.origin.y+posY)];
    [imagem.layer addAnimation: moveNuvemDireita forKey:@"animacaoMovimento"];
    
    
}





@end
