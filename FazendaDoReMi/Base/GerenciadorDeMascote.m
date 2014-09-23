//
//  GerenciadorDeMascote.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "GerenciadorDeMascote.h"

@implementation GerenciadorDeMascote


-(id)init{
    self = [super init];
    if(self){
        self.listaDeMascotes = [[NSMutableArray alloc]init];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

//Singleton
+(GerenciadorDeMascote*)sharedManager{
    static GerenciadorDeMascote *gerenciadorDeMascote = nil;
    
    if(!gerenciadorDeMascote){
        gerenciadorDeMascote = [[super allocWithZone: nil] init];
    }
    return gerenciadorDeMascote;
}

-(Mascote*)retornaMascote: (NSString*)nomeMascote{
    
    //Procura o mascote na lista
    for (Mascote *mascote in self.listaDeMascotes) {
        if ([mascote.nome isEqualToString: nomeMascote]) {
            return mascote;
        }
    }

    //Se não encontra retorna o primeiro mascote
    return self.listaDeMascotes.firstObject;
}

@end
