//
//  ControladorDeItem.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 13/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface ControladorDeItem : NSObject


@property NSMutableArray *listaObjetosPressionados;

+(ControladorDeItem*)sharedManager;

@property int contadorItensPressionados;
@property NSTimer *timerVerificadorItemPressionado;


-(void)chamaVerificador:(NSArray*)listaItens;

@end
