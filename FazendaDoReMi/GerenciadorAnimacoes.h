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
#import "GestureTapItem.h"
#import "SomItem.h"
#import "GerenciadorAudio.h"

@interface GerenciadorAnimacoes : NSObject


//Metodos
+(GerenciadorAnimacoes*)sharedManager;
-(void)animacaoOpacidade:(UIView*)view :(NSString*)duracao :(NSString*)repeticao :(NSString*)autoReverso :(NSString*)voltarAoEstadoInicial;
-(void)animacaoMoverLugar:(UIView*)view :(NSString*)duracao :(NSString*)repeticao :(NSString*)autoReverso :(NSString*)posX :(NSString*)posY;
-(void)animacaozoomImagem:(UIView*)view :(NSString*)duracao :(NSString*)repeticao :(NSString*)valorInicial :(NSString*)valorFinal;
-(void)animacaoSpriteEspecifica:(Item*)viewItem :(NSString*)nomeAnimacaoSprite :(NSString*)repeticao :(NSString*)autoReverso :(NSString*)voltarAoEstadoInicial :(NSString*)tempoDelayComecar;
-(void)animacaoGirarImagem:(UIView*)view :(NSString*)duracao :(NSString*)repeticoes;



@end
