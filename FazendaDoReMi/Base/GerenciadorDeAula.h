//
//  GerenciadorDeAula.h
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "Aula.h"
#import "Exercicio.h"
#import <Foundation/Foundation.h>

@interface GerenciadorDeAula : NSObject

//Atributos
@property NSMutableArray *listaDeAulas;
@property Aula *aulaAtual;
@property int indexDoExercicioAtual;

//Métodos
+(GerenciadorDeAula*)sharedManager;

@end
