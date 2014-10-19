//
//  GestureSwipeItem.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 17/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "GestureSwipeItem.h"

@implementation GestureSwipeItem

-(id)init{
    self = [super init];
    
    if(self){
        self.listaMetodos = [[NSMutableArray alloc] init];
        self.idGesture = 2;
    }
    return self;
}

@end
