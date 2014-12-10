//
//  ControladorDeItem.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 13/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "SpriteItem.h"
#import "SomItem.h"
#import "GerenciadorAudio.h"
#import "GestureTapItem.h"
#import "GerenciadorAnimacoes.h"
#import "GerenciadorDeItem.h"
#import "GerenciadorMetodo.h"
#import "GerenciadorComponenteView.h"

@interface ControladorDeItem : NSObject

//Atributos
@property NSMutableArray *listaObjetosPressionados;
@property NSTimer *timerVerificadorItemPressionado;
@property NSTimer *timerVerificadorJogoFinalizado;

@property int contadorItensPressionados;
@property int numeroLimiteDeJogadas;
@property int numeroDeJogadasAtual;
@property BOOL aulaFinalizada;

//Metodos
+(ControladorDeItem*)sharedManager;
-(void)chamaVerificador:(NSArray*)listaItens;
-(void)chamaVerificadorDeJogo :(int)numeroLimiteDeJogadas :(int)numeroDeJogadasAtual;
-(void)retornaItem:(NSString*)nome :(UIView*)viewContainer :(NSString*)nomeGesture;
-(void)retornaItemGesture:(NSString*)nome :(Item*)viewContainer :(Item*)viewColidir  :(NSString*)nomeGesture;


@end
