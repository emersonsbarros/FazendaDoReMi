//
//  ListaInstrumentoViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 04/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sinfonia.h"
#import "BotaoInstrumento.h"
#import "InfiniteScrollPicker.h"
#import "GerenciadorBotaoInstrumento.h"

@interface ListaInstrumentoViewController : UIViewController


@property InfiniteScrollPicker *isp;
+(ListaInstrumentoViewController*)sharedManager;


@end
