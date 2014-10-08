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

@interface Mascote : UIImageView

//Atributos
@property NSString *nome;
@property NSMutableArray *listaDeConversas;
@property NSMutableArray *listaDeSprites;

//Métodos
+(Mascote*)sharedManager;

@end
