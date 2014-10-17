//
//  GestureLongItem.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 17/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface GestureLongItem : UILongPressGestureRecognizer

@property Item *item;
@property NSString *metodosSolicidados;
@property NSMutableArray *listaMetodos;

@end
