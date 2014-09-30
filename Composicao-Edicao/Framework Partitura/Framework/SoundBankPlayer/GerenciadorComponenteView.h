//
//  EfeitoComponeteView.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 12/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>


//Compontes Edicao e leitura de partituras
#import "PlayerPartituraEdicaoViewController.h"
#import "ListaInstrumentoViewController.h"
#import "BarraNotasPausasViewController.h"
#import "PlayerPartituraEdicaoViewController.h"


@interface GerenciadorComponenteView : NSObject


+(GerenciadorComponenteView*)sharedManager;

//Compontes Edicao e leitura de partituras
-(void)addComponentesPlayerPartitura:(UIViewController*)viewAtual;
-(void)addComponentesEscolhaInstrumentoPartitura:(UIViewController*)viewAtual;
-(void)addComponentesBarraMenuNotasPausa:(UIViewController*)viewAtual;
-(void)addComponentesPlayerEdicao:(UIViewController*)viewAtual;


@end
