//
//  GestureRotationItem.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 17/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "GestureRotationItem.h"

@implementation GestureRotationItem

-(id)init{
    self = [super init];
    
    if(self){
        self.listaMetodos = [[NSMutableArray alloc] init];
        self.idGesture = 3;
    }
    return self;
}

@end
