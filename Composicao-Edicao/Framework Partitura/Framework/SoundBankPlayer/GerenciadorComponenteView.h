//
//  EfeitoComponeteView.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 12/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PlayerPartituraEdicaoViewController.h"
#import "ListaInstrumentoViewController.h"
#import "BarraNotasPausasViewController.h"
#import "PlayerPartituraEdicaoViewController.h"

#import "BotaoVoltarMapaViewController.h"
#import "MascoteViewController.h"

#import "PianoViewController.h"

@interface GerenciadorComponenteView : NSObject


+(GerenciadorComponenteView*)sharedManager;


//Compontes Edicao e leitura de partituras
-(void)finalizaExercicio:(UIViewController*)contr;
-(void)addComponentesPlayerPartitura:(UIViewController*)viewAtual :(float)posX :(float)posY;
-(void)addComponentesEscolhaInstrumentoPartitura:(UIViewController*)viewAtual;
-(void)addComponentesBarraMenuNotasPausa:(UIViewController*)viewAtual :(BOOL)estado;


//Componetes Exericicios
-(void)addComponentesPlayerEdicao:(UIViewController*)viewAtual :(float)posX :(float)posY;
-(void)addComponentesBotaoVoltaMapa:(UIViewController*)viewAtual;
-(void)addComponentesMascote:(UIViewController*)viewAtual :(float)posX :(float)posY :(NSString*)nomeMascote;


//Instrumentos
-(void)addComponentesPiano:(UIViewController*)viewAtual :(float)posX :(float)posY;



@end
