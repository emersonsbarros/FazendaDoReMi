//
//  GerenciadorDeMascote.h
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "Mascote.h"
#import "SpriteMascote.h"
#import <Foundation/Foundation.h>

@interface GerenciadorDeMascote : NSObject 

//Atributos
@property NSMutableArray *listaDeMascotes;

//Métodos
+(GerenciadorDeMascote*)sharedManager;
-(Mascote*)retornaMascote: (NSString*)nomeMascote;
-(SpriteMascote*)retornaAnimacaoMascote:(Mascote*)mascote :(NSString*)nomeAnimacao;

@end
