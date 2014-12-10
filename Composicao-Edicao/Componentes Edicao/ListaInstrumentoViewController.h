//
//  ListaInstrumentoViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 04/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GerenciadorBotaoInstrumento.h"
#import "Sinfonia.h"
#import "ComposicaoPartituraViewController.h"

@interface ListaInstrumentoViewController : UIViewController


+(ListaInstrumentoViewController*)sharedManager;
-(void)chamaTelaCarregamento;



@end
