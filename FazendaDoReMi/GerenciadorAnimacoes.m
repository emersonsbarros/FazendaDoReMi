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

///////////////////////////////////////////////////// Padroes /////////////////////////////////////////////////////////////

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

//////////////////////////////////////////////////////  FRAMEWORK /////////////////////////////////////////////////////////


//Add animacao opacidade nas imagens
-(void)animacaoOpacidade:(UIView*)view :(NSString*)duracao :(NSString*)repeticao :(NSString*)autoReverso :(NSString*)voltarAoEstadoInicial{
    
    CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    theAnimation.duration = [duracao floatValue];
    theAnimation.repeatCount = [repeticao floatValue];
    theAnimation.autoreverses = [autoReverso floatValue];
    theAnimation.fromValue=[NSNumber numberWithFloat:0.0];
    theAnimation.toValue=[NSNumber numberWithFloat:1.0];
    theAnimation.fillMode = kCAFillModeForwards;
    theAnimation.removedOnCompletion = [voltarAoEstadoInicial boolValue];
    [view.layer addAnimation:theAnimation forKey:@"animacaoOpacidade"];
    
}

//Add animacao de sprites para uma imagem
-(void)animacaoSpriteEspecifica:(Item*)viewItem :(NSString*)nomeAnimacaoSprite :(NSString*)repeticao :(NSString*)autoReverso :(NSString*)voltarAoEstadoInicial :(NSString*)tempoDelayComecar{
    
    for(SpriteItem *sprite in viewItem.listaSprites){
        if([sprite.nomeAnimacao isEqualToString:nomeAnimacaoSprite]){
            viewItem.animationImages = sprite.listaImagens;
        }
    }
    

    CAKeyframeAnimation *animacao = [CAKeyframeAnimation animationWithKeyPath: @"contents"];
    animacao.calculationMode = kCAAnimationDiscrete;
    animacao.duration = 1.0;
    animacao.repeatCount = [repeticao floatValue];
    animacao.autoreverses = [autoReverso floatValue];
    animacao.beginTime = CACurrentMediaTime() + [tempoDelayComecar floatValue];
    animacao.fillMode = kCAFillModeForwards;
    animacao.removedOnCompletion = [voltarAoEstadoInicial boolValue];
    animacao.autoreverses = [autoReverso boolValue];
    animacao.additive = NO;
    animacao.values = [self animationCGImagesArray:viewItem];
    [viewItem.layer addAnimation: animacao forKey:@"animacaoSprite"];
    
}


//Add animacao de mover o lugar do objeto
-(void)animacaoMoverLugar:(UIView*)view :(NSString*)duracao :(NSString*)repeticao :(NSString*)autoReverso :(NSString*)posX :(NSString*)posY{
    
    CABasicAnimation *moveNuvemDireita= [CABasicAnimation animationWithKeyPath:@"position"];
    moveNuvemDireita.duration = [duracao floatValue];
    moveNuvemDireita.repeatCount = [repeticao floatValue];
    moveNuvemDireita.removedOnCompletion = [autoReverso boolValue];
    moveNuvemDireita.fromValue = [NSValue valueWithCGPoint: CGPointMake(view.frame.origin.x+(view.frame.size.width/2), view.frame.origin.y+view.frame.size.height)];
    moveNuvemDireita.toValue = [NSValue valueWithCGPoint: CGPointMake(view.frame.origin.x+(view.frame.size.width/2)+[posX floatValue], view.frame.origin.y+[posY floatValue])];
    
    [view.layer addAnimation: moveNuvemDireita forKey:@"animacaoMovimento"];
    
}


//Add animacao de dar zoom na imagem
-(void)animacaozoomImagem:(UIView*)view :(NSString*)duracao :(NSString*)repeticao :(NSString*)valorInicial :(NSString*)valorFinal{

    CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
    
    pulseAnimation.fromValue = [NSNumber numberWithFloat:[valorInicial floatValue]];
    pulseAnimation.toValue = [NSNumber numberWithFloat:[valorFinal floatValue]];
    pulseAnimation.duration = [duracao floatValue];
    pulseAnimation.repeatCount = [repeticao floatValue];

    [view.layer addAnimation:pulseAnimation forKey:@"animacaoPulsar"];
}


//Add animacao de girar uma imagem
-(void)animacaoGirarImagem:(UIView*)view :(NSString*)duracao :(NSString*)repeticoes{
    
    CABasicAnimation *imageRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    imageRotation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 * 2 * 1 ];
    imageRotation.duration = [duracao floatValue];
    imageRotation.repeatCount = [repeticoes floatValue];
    imageRotation.removedOnCompletion = NO;
    imageRotation.autoreverses=NO;
    imageRotation.fillMode = kCAFillModeForwards;
    
    [view.layer addAnimation:imageRotation forKey:@"animacaoRotacao"];
}


//////////////////////////////////////////////////////  AUXILIAR /////////////////////////////////////////////////////////


//Aux que converte para CGImage, unico jeito para dar certo
-(NSArray*)animationCGImagesArray:(UIImageView*)imgAddAnimacao {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[imgAddAnimacao.animationImages count]];
    for (UIImage *image in imgAddAnimacao.animationImages) {
        [array addObject:(id)[image CGImage]];
    }
    return [NSArray arrayWithArray:array];
}


@end







