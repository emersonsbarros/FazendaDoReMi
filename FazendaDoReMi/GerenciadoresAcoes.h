//
//  GerenciadoresAcoes.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 16/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GestureItem.h"
#import "GerenciadorAudio.h"
#import "SomItem.h"

@interface GerenciadoresAcoes : NSObject

+(GerenciadoresAcoes*)sharedManager;


-(void)tocarSomItem:(GestureItem*)gestureItem;
-(void)alteraEstadoPressionado:(GestureItem*)gestureItem;
-(void)escondeImagem:(GestureItem*)gestureitem;


@end
