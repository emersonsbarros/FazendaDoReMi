//
//  GerenciadorDeSom.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "GerenciadorDeSom.h"

@implementation GerenciadorDeSom

-(id)init{
    self = [super init];
    
    if(self){
        self.listaDeSonsItens = [[NSMutableArray alloc] init];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

//Singleton
+(GerenciadorDeSom*)sharedManager{
    static GerenciadorDeSom *gerenciadorDeSom = nil;
    
    if(!gerenciadorDeSom){
        gerenciadorDeSom = [[super allocWithZone: nil] init];
    }
    return gerenciadorDeSom;
}


-(SomItem*)retornaSomItem: (NSString*)nome{
    
    //Procura o item na lista
    for (SomItem *somItem in self.listaDeSonsItens) {
        if ([somItem.nome isEqualToString: nome]) {
            return somItem;
        }
    }
    
    //Se não encontra retorna o primeiro item
    return self.listaDeSonsItens.firstObject;
}


@end
