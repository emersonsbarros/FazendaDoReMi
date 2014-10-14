//
//  GerenciadorAnimacoes.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 08/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//
//-(void)desaparece;
//-(void)aparece;
//-(void)aumenta;
//-(void)diminui;
//-(void)balanca;

#import <Foundation/Foundation.h>
#import "Item.h"
#import "SpriteItem.h"
#import "GestureItem.h"
#import "SomItem.h"
#import "GerenciadorAudio.h"

@interface GerenciadorAnimacoes : NSObject


+(GerenciadorAnimacoes*)sharedManager;




-(void)animacaoOpacidade:(UIView*)view :(float)duracao :(float)repeticao :(BOOL)autoReverso :(BOOL)voltarAoEstadoInicial;

-(void)animacaoSprite:(UIImageView*)view :(NSArray*)imagensSprite :(float)duracao :(float)repeticao :(BOOL)autoReverso :(BOOL)voltarAoEstadoInicial :(float)tempoDelayComecar;

-(void)animacaoMoverLugar:(UIView*)view :(float)duracao :(float)repeticao :(BOOL)autoReverso :(float)posX :(float)posY;

-(void)animacaozoomImagem:(UIView*)view :(float)duracao :(float)repeticao :(BOOL)autoReverso :(id)valorInicial :(id)valorFinal;

-(void)animacaozoomImagem:(UIView*)view;

-(void)animacaoSpriteEspecifica:(Item*)viewItem :(NSString*)nomeAnimacaoSprite :(float)repeticao :(BOOL)autoReverso :(BOOL)voltarAoEstadoInicial :(float)tempoDelayComecar;

@end
