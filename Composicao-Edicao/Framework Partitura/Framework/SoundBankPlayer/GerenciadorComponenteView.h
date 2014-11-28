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

#import "PianoVirtualViewController.h"
#import "TecladoLivreViewController.h"
#import "TecladoViewController.h"
#import "XilofoneVirtualViewController.h"

#import "BotaoVoltarViewController.h"

#import "GerenciadorBotaoInstrumento.h"

@interface GerenciadorComponenteView : NSObject


+(GerenciadorComponenteView*)sharedManager;


//Compontes Edicao e leitura de partituras
-(void)finalizaExercicio:(UIViewController*)contr;
-(void)addComponentesPlayerPartitura:(UIViewController*)viewAtual :(float)posX :(float)posY;
-(void)addComponentesEscolhaInstrumentoPartitura:(UIViewController*)viewAtual :(UIImageView*)imgFundo :(UIImageView*)imgFundoSecundario;
-(void)addComponentesBarraMenuNotasPausa:(UIViewController*)viewAtual :(BOOL)estado;
-(void)addComponentesBotaoVoltar:(UIViewController*)viewAtual :(float)posX :(float)posY;

//Componetes Exericicios
-(void)addComponentesPlayerEdicao:(UIViewController*)viewAtual :(float)posX :(float)posY;
-(void)addComponentesBotaoVoltaMapa:(UIViewController*)viewAtual;
-(void)addComponentesMascote:(UIViewController*)viewAtual :(float)posX :(float)posY :(NSString*)nomeMascote;


//Instrumentos
-(void)addComponentesPiano:(UIViewController*)viewAtual :(float)posX :(float)posY;
-(void)addComponentesTeclado:(UIViewController*)viewAtual :(float)posX :(float)posY;
-(void)addComponentesXilofone:(UIViewController*)viewAtual :(float)posX :(float)posY;

@end
