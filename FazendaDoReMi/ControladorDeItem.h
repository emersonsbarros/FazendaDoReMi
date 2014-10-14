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
#import "GestureItem.h"
#import "GerenciadorAnimacoes.h"
#import "GerenciadorDeItem.h"
#import "GerenciadorMetodo.h"

@interface ControladorDeItem : NSObject


@property NSMutableArray *listaObjetosPressionados;

+(ControladorDeItem*)sharedManager;

@property int contadorItensPressionados;
@property NSTimer *timerVerificadorItemPressionado;


-(void)chamaVerificador:(NSArray*)listaItens;

-(void)retornaItem:(NSString*)nome :(UIView*)viewContainer :(NSString*)nomeGesture;

@end
