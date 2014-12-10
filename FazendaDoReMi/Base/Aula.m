//
//  Aula.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "Aula.h"

@implementation Aula

-(id)init{
    self = [super init];
    
    if(self){
        self.listaDeExercicios = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
