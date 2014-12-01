//
//  Exercicio.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "Exercicio.h"

@implementation Exercicio


-(id)init:(int)idView nome :(NSString*)nome :(NSString*)nomeView  :(BOOL)estadoAula{
    
    self = [super init];
    if(self){
        self.tipo = 0;
        self.idView = idView;
        self.nome = nome;
        self.nomeView = nomeView;
        self.mascote = [[Mascote alloc]init];
        self.estado = estadoAula;
    }
    return self;
}


@end
