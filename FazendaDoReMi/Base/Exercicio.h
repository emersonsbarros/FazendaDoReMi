//
//  Exercicio.h
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//
#import "Mascote.h"
#import <Foundation/Foundation.h>

@interface Exercicio : NSObject

//Atributos
@property NSString *nome;
@property NSString *tema;
@property Mascote *mascote;
@property BOOL estado;

@end