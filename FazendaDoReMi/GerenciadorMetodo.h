//
//  GerenciadorMetodo.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 14/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GestureTapItem.h"
#import "GerenciadorAnimacoes.h"
#import "GerenciadoresAcoes.h"

@interface GerenciadorMetodo : NSObject


+(GerenciadorMetodo*)sharedManager;

-(void)addGestureItem:(NSString*)nomeGesture :(Item*)viewContainer;

@end
