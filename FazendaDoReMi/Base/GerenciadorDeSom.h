//
//  GerenciadorDeSom.h
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "SomItem.h"
#import <Foundation/Foundation.h>

@interface GerenciadorDeSom : NSObject

//Atributo
@property NSMutableArray *listaDeSonsItens;

//Metodo
+(GerenciadorDeSom*)sharedManager;
-(SomItem*)retornaSomItem: (NSString*)nome;

@end
