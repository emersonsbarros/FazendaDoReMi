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


+(GerenciadorAnimacoes*)sharedManager;

///////////////////////////////////////////////////////////////////////////////


-(void)animacaoSprite:(UIImageView*)view :(NSArray*)imagensSprite :(float)duracao :(float)repeticao :(BOOL)autoReverso :(BOOL)voltarAoEstadoInicial :(float)tempoDelayComecar;


///////////////////////////////////////////////////////////////////////////////


//Add animacao opacidade nas imagens
-(void)animacaoOpacidade:(UIView*)view :(NSString*)duracao :(NSString*)repeticao :(NSString*)autoReverso :(NSString*)voltarAoEstadoInicial;

//Add animacao de mover o lugar do objeto
-(void)animacaoMoverLugar:(UIView*)view :(NSString*)duracao :(NSString*)repeticao :(NSString*)autoReverso :(NSString*)posX :(NSString*)posY;

//Add animacao de dar zoom na imagem
-(void)animacaozoomImagem:(UIView*)view :(NSString*)duracao :(NSString*)repeticao :(NSString*)valorInicial :(NSString*)valorFinal;

//Add animacao de sprites para uma imagem
-(void)animacaoSpriteEspecifica:(Item*)viewItem :(NSString*)nomeAnimacaoSprite :(NSString*)repeticao :(NSString*)autoReverso :(NSString*)voltarAoEstadoInicial :(NSString*)tempoDelayComecar;

//Add animacao de girar uma imagem
-(void)animacaoGirarImagem:(UIView*)view :(NSString*)duracao :(NSString*)repeticoes;



@end
