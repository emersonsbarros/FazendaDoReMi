//
//  GesturePinch.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 20/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface GesturePinchItem : UIPinchGestureRecognizer

@property Item *item;
@property NSString *metodosSolicidados;
@property NSMutableArray *listaMetodos;
@property int idGesture;

@end