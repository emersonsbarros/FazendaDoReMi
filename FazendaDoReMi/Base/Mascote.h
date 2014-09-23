//
//  Mascote.h
//  ProjetoFinal
//
//  Created by EMERSON DE SOUZA BARROS on 27/05/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "SpriteMascote.h"
#import "Conversa.h"
#import <Foundation/Foundation.h>

@interface Mascote : NSObject

//Atributos
@property NSString *nome;
@property UIButton *notaBarriga;
@property NSMutableArray *listaDeImagens;
@property NSMutableArray *listaDeConversas;
@property NSMutableArray *listaDeSprites;

@end
