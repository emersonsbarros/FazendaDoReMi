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
#import <SpriteKit/SpriteKit.h>

@interface GerenciadorDeAula : NSObject

//Atributos
@property NSMutableArray *listaDeAulas;
@property Aula *aulaAtual;
@property SKScene *cenaAtual;
@property int indexDoExercicioAtual;

//Métodos
+(GerenciadorDeAula*)sharedManager;
-(NSArray*)retornaExercicio:(NSString*)nomeAula :(NSString*)nomeExercicio;


@end
