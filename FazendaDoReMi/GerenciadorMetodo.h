//
//  GerenciadorMetodo.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 14/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GerenciadorAnimacoes.h"
#import "GerenciadoresAcoes.h"
#import "GestureLongItem.h"
#import "GestureTapItem.h"
#import "GestureSwipeItem.h"
#import "GestureRotationItem.h"
#import "GesturePanGesture.h"
#import "GesturePinchItem.h"

#import "TimerGesturePan.h"

@interface GerenciadorMetodo : NSObject


+(GerenciadorMetodo*)sharedManager;

-(void)addGestureItem:(NSString*)nomeGesture :(Item*)viewContainer;

-(void)addGestureItemPan:(NSString*)nomeGesture :(Item*)viewContainer :(Item*)viewColisao;
    
    
@property NSMutableArray *listaMetodos;



@end
