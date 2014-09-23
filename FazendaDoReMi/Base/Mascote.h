//
//  Mascote.h
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
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

//Métodos
+(Mascote*)sharedManager;

@end
