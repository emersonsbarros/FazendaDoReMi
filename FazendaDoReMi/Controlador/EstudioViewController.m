//
//  EstudioViewController.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "EstudioViewController.h"

@interface EstudioViewController ()

@end

@implementation EstudioViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (BOOL)prefersStatusBarHidden {
    return YES;
    
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    
    [self animacaoGirar:self.imgCatavento1 :0.0:7.0];
    [self animacaoGirar:self.btnCatavento2 :1.5:4.0];
    [self animacaoGirar:self.btnCatavento3 :1.0:6.0];
    [self animacaoGirar:self.btnCatavento4 :0.5:5.0];
    
    [self animacaoMovimentarPosicao:self.imgNuvem1 :50.0 :1400 :30];
    [self animacaoMovimentarPosicao:self.imgNuvem2 :50.0 :-1400 :70];
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:YES];
   
    [self.imgCatavento1.layer removeAllAnimations];
    [self.btnCatavento2.layer removeAllAnimations];
    [self.btnCatavento3.layer removeAllAnimations];
    [self.btnCatavento4.layer removeAllAnimations];
    
    [self.imgNuvem1.layer removeAllAnimations];
    [self.imgNuvem2.layer removeAllAnimations];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoVoltar:self:0:-8];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)animacaoGirar:(UIImageView*)imagem :(float)tempo :(float)duracaoRotacao{
    
    CABasicAnimation *imageRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    imageRotation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 * 2 * 1 ];
    imageRotation.duration = duracaoRotacao;
    imageRotation.repeatCount = INFINITY;
    imageRotation.beginTime = CACurrentMediaTime() + tempo;
    imageRotation.removedOnCompletion = NO;
    imageRotation.autoreverses=NO;
    imageRotation.fillMode = kCAFillModeForwards;
    [imagem.layer addAnimation:imageRotation forKey:@"animacaoRotacao"];
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






