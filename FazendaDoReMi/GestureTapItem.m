//
//  GestureItem.m
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 12/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "GestureTapItem.h"

@implementation GestureTapItem


-(id)init{
    self = [super init];
    
    if(self){
        self.listaMetodos = [[NSMutableArray alloc] init];
        self.idGesture = 0;
    }
    return self;
}

@end
