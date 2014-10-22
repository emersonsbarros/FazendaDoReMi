//
//  GerenciadoresAcoes.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 16/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "GerenciadoresAcoes.h"

@implementation GerenciadoresAcoes

-(id)init{
    self = [super init];
    
    if(self){
        
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

//Singleton
+(GerenciadoresAcoes*)sharedManager{
    static GerenciadoresAcoes *gerenciadorDeItem = nil;
    
    if(!gerenciadorDeItem){
        gerenciadorDeItem = [[super allocWithZone: nil] init];
    }
    return gerenciadorDeItem;
}

///////////////////////// METODOS DE ACAO ////////////////////////////////////

//Toca um som do item especifico
-(void)tocarSomItem:(Item*)item :(NSString*)indiceAudio{
    SomItem *somItem = [item.listaSonsURL objectAtIndex:[indiceAudio integerValue]];
    [[GerenciadorAudio sharedManager]playAudio:somItem.caminhoAudio];
}


//Altera o estado do item como pressionado para poder passar de exercicio
-(void)alteraEstadoPressionado:(Item*)item{
    item.estadoPressionado = YES;
}


//Oculta a imagem
-(void)escondeImagem:(Item*)item{
    item.hidden = YES;
}



@end
