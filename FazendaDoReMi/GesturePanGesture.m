//
//  GesturePanGesture.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 17/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "GesturePanGesture.h"

@implementation GesturePanGesture

-(id)init{
    self = [super init];
    
    if(self){
        self.listaMetodos = [[NSMutableArray alloc] init];
        self.idGesture = 4;
    }
    return self;
}


@end
