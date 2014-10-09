//
//  GerenciadorAnimacoes.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 08/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GerenciadorAnimacoes : NSObject


+(GerenciadorAnimacoes*)sharedManager;


-(void)animacaoOpacidade:(UIView*)view :(float)duracao :(float)repeticao :(BOOL)autoReverso :(BOOL)voltarAoEstadoInicial;
-(void)animacaoSprite:(UIImageView*)view :(NSArray*)imagensSprite :(float)duracao :(float)repeticao :(BOOL)autoReverso :(BOOL)voltarAoEstadoInicial :(float)tempoDelayComecar;
-(void)animacaoMoverLugar:(UIView*)view :(float)duracao :(float)repeticao :(BOOL)autoReverso :(float)posX :(float)posY;

@end
