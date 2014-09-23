//
//  GerenciadorDeAula.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "GerenciadorDeAula.h"

@implementation GerenciadorDeAula

-(id)init{
    self = [super init];
    
    if(self){
        self.listaDeAulas = [[NSMutableArray alloc] init];
        self.listaDeViewControllers = [[NSMutableArray alloc] init];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

//Singleton
+(GerenciadorDeAula*)sharedManager{
    static GerenciadorDeAula *gerenciadorDeAula = nil;
    
    if(!gerenciadorDeAula){
        gerenciadorDeAula = [[super allocWithZone: nil] init];
    }
    return gerenciadorDeAula;
}

@end
