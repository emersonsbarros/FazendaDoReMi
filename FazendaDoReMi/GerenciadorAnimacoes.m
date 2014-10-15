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

-(void)animacaoSpriteEspecifica:(Item*)viewItem :(NSString*)nomeAnimacaoSprite :(float)repeticao :(BOOL)autoReverso :(BOOL)voltarAoEstadoInicial :(float)tempoDelayComecar{
    
    for(SpriteItem *sprite in viewItem.listaSprites){
        if([sprite.nomeAnimacao isEqualToString:nomeAnimacaoSprite]){
            viewItem.animationImages = sprite.listaImagens;
        }
    }
    

    CAKeyframeAnimation *animacao = [CAKeyframeAnimation animationWithKeyPath: @"contents"];
    animacao.calculationMode = kCAAnimationDiscrete;
    animacao.duration = 1.0;
    animacao.repeatCount = repeticao;
    animacao.autoreverses = autoReverso;
    animacao.beginTime = CACurrentMediaTime() + tempoDelayComecar;
    animacao.fillMode = kCAFillModeForwards;
    animacao.removedOnCompletion = voltarAoEstadoInicial;
    animacao.additive = NO;
    animacao.values = [self animationCGImagesArray:viewItem];
    [viewItem.layer addAnimation: animacao forKey:@"animacaoSprite"];
    
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


-(void)animacaozoomImagem:(UIView*)view :(float)duracao :(float)repeticao :(BOOL)autoReverso :(id)valorInicial :(id)valorFinal{

    CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
    pulseAnimation.fromValue = valorInicial;
    pulseAnimation.toValue = valorFinal;
    pulseAnimation.duration = duracao;
    pulseAnimation.repeatCount = repeticao;

    [view.layer addAnimation:pulseAnimation forKey:@"pulse"];

}


-(void)animacaozoomImagem:(UIView*)view{
    CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
    pulseAnimation.fromValue = @1.0;
    pulseAnimation.toValue = @1.5;
    pulseAnimation.duration = 1;
    pulseAnimation.repeatCount = INFINITY;
    
    [view.layer addAnimation:pulseAnimation forKey:@"pulse"];
}

-(void)animacaoGirarImagem:(UIView*)view :(float)duracao :(float)repeticoes{
    
    CABasicAnimation *imageRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    imageRotation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 * 2 * 1 ];
    
    imageRotation.duration = duracao;
    imageRotation.repeatCount = repeticoes;
    
    imageRotation.removedOnCompletion = NO;
    imageRotation.autoreverses=NO;
    imageRotation.fillMode = kCAFillModeForwards;
    
    [view.layer addAnimation:imageRotation forKey:@"imageRotation"];
}

@end







