//
//  GerenciadorAnimacoes.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 08/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "GerenciadorAnimacoes.h"

@implementation GerenciadorAnimacoes

-(id)init{
    self = [super init];
    if(self){
     
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


//Singleton
+(GerenciadorAnimacoes*)sharedManager{
    static GerenciadorAnimacoes *gerenciadorDeMascote = nil;
    
    if(!gerenciadorDeMascote){
        gerenciadorDeMascote = [[super allocWithZone: nil] init];
    }
    return gerenciadorDeMascote;
}


//Aux que converte para CGImage, unico jeito para dar certo
-(NSArray*)animationCGImagesArray:(UIImageView*)imgAddAnimacao {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[imgAddAnimacao.animationImages count]];
    for (UIImage *image in imgAddAnimacao.animationImages) {
        [array addObject:(id)[image CGImage]];
    }
    return [NSArray arrayWithArray:array];
}


-(void)animacaoOpacidade:(UIView*)view :(float)duracao :(float)repeticao :(BOOL)autoReverso :(BOOL)voltarAoEstadoInicial{
    
    CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    theAnimation.duration = duracao;
    theAnimation.repeatCount = repeticao;
    theAnimation.autoreverses = autoReverso;
    theAnimation.fromValue=[NSNumber numberWithFloat:0.0];
    theAnimation.toValue=[NSNumber numberWithFloat:1.0];
    theAnimation.fillMode = kCAFillModeForwards;
    theAnimation.removedOnCompletion = voltarAoEstadoInicial;
    [view.layer addAnimation:theAnimation forKey:@"animacaoOpacidade"];
    
}


-(void)animacaoSprite:(UIImageView*)view :(NSArray*)imagensSprite :(float)duracao :(float)repeticao :(BOOL)autoReverso :(BOOL)voltarAoEstadoInicial :(float)tempoDelayComecar{
    
    view.animationImages = imagensSprite;
    
    CAKeyframeAnimation *animacao = [CAKeyframeAnimation animationWithKeyPath: @"contents"];
    animacao.calculationMode = kCAAnimationDiscrete;
    animacao.duration = duracao;
    animacao.repeatCount = repeticao;
    animacao.autoreverses = autoReverso;
    animacao.beginTime = CACurrentMediaTime() + tempoDelayComecar;
    animacao.fillMode = kCAFillModeForwards;
    animacao.removedOnCompletion = voltarAoEstadoInicial;
    animacao.additive = NO;
    animacao.values = [self animationCGImagesArray:view];
    [view.layer addAnimation: animacao forKey:@"animacaoSprite"];
    
}


-(void)animacaoMoverLugar:(UIView*)view :(float)duracao :(float)repeticao :(BOOL)autoReverso :(float)posX :(float)posY{
    
    CABasicAnimation *moveNuvemDireita= [CABasicAnimation animationWithKeyPath:@"position"];
    moveNuvemDireita.duration = duracao;
    moveNuvemDireita.repeatCount = repeticao;
    moveNuvemDireita.removedOnCompletion = autoReverso;
    moveNuvemDireita.fromValue = [NSValue valueWithCGPoint: CGPointMake(view.frame.origin.x, view.frame.origin.y+posY)];
    moveNuvemDireita.toValue = [NSValue valueWithCGPoint: CGPointMake(view.frame.origin.x+posX, view.frame.origin.y+posY)];
    
    [view.layer addAnimation: moveNuvemDireita forKey:@"animacaoMovimento"];
    
}






@end







