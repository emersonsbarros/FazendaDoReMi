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
@property int idView;
@property NSString *nome;
@property NSString *nomeView;
@property Mascote *mascote;
@property BOOL estado;



//Construtor
-(id)init:(int)idView nome :(NSString*)nome :(NSString*)nomeView  :(BOOL)estadoAula;


@end
