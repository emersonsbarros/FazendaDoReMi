//
//  ListaInstrumentoViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 04/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EscolhaUsuarioPartitura.h"
#import "Sinfonia.h"
#import "ComposicaoPartituraViewController.h"
#import "BotaoInstrumento.h"
#import "InfiniteScrollPicker.h"

@interface ListaInstrumentoViewController : UIViewController



@property NSMutableArray *listaBotoesInstrumentos;
@property UIImageView *imgFundo;
@property UIImageView *imgFundoSecundario;
@property  InfiniteScrollPicker *isp;


-(void)recebeImagensView:(UIImageView*)img1 :(UIImageView*)img2;
+(ListaInstrumentoViewController*)sharedManager;



@end
