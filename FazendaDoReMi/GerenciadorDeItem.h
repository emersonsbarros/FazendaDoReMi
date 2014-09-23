//
//  GerenciadorDeItem.h
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "Item.h"
#import <Foundation/Foundation.h>

@interface GerenciadorDeItem : NSObject

//Atributos
@property NSMutableArray *listaDeItens;

//Metodos
-(Item*)retornaItem: (NSString*)nome;

@end
