//
//  GerenciadorDeItem.h
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "Item.h"
#import "SpriteItem.h"
#import "SomItem.h"

#import <Foundation/Foundation.h>

@interface GerenciadorDeItem : NSObject

//Atributos
@property NSMutableArray *listaDeItens;

//Metodos
-(void)retornaItem:(NSString*)nome :(UIView*)viewContainer;


+(GerenciadorDeItem*)sharedManager;

@end
