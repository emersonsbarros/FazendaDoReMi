//
//  Conversa.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "Conversa.h"

@implementation Conversa

-(id)init{
    self = [super init];
    if(self){
        self.listaDeFalas = [[NSMutableArray alloc]init];
    }
    return self;
}

@end
