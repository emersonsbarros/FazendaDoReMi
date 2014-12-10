//
//  GesturePinch.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 20/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "GesturePinchItem.h"

@implementation GesturePinchItem


-(id)init{
    self = [super init];
    
    if(self){
        self.listaMetodos = [[NSMutableArray alloc] init];
        self.idGesture = 5;
    }
    return self;
}



@end
