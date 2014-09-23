//
//  Mascote.m
//  ProjetoFinal
//
//  Created by EMERSON DE SOUZA BARROS on 27/05/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mascote.h"

@implementation Mascote


-(id)init{
    self = [super init];
    if(self){
        
        self.nome = @"ZéCão";
        self.listaDeImagens = [[NSMutableArray alloc]init];
        self.listaDeConversas = [[NSMutableArray alloc]init];
        self.listaDeSprites = [[NSMutableArray alloc]init];
    }
    return self;
}


@end
