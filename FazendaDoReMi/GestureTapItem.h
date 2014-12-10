//
//  GestureItem.h
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 12/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface GestureTapItem : UITapGestureRecognizer

@property Item *item;
@property NSString *metodosSolicidados;
@property NSMutableArray *listaMetodos;
@property int idGesture;

@end
