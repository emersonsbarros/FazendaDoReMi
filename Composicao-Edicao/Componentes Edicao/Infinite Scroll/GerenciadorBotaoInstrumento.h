//
//  GerenciadorBotaoInstrumento.h
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 28/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EscolhaUsuarioPartitura.h"
#import "TapBotaoInstrumento.h"
#import "ListaInstrumentoViewController.h"
#import "InfiniteScrollPicker.h"
#import "BotaoInstrumento.h"

@interface GerenciadorBotaoInstrumento : NSObject

//Atributos
@property NSMutableArray *listaBotoesInstrumentos;
@property UIImageView *imgFundo;
@property UIImageView *imgFundoSecundario;
@property InfiniteScrollPicker *isp;
@property BotaoInstrumento *btnInstrumentoAtual;

//METODOS
+(GerenciadorBotaoInstrumento*)sharedManager;
-(void)acionaBotao:(TapBotaoInstrumento*)button;
-(void)recebeImagensView:(UIImageView*)img1 :(UIImageView*)img2;


@end
