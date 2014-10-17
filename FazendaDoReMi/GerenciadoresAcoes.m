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

///////////////////////////////////////////////////////////////////////////////////


-(void)tocarSomItem:(GestureTapItem*)gestureItem{
    SomItem *somItem = gestureItem.item.listaSonsURL.firstObject;
    [[GerenciadorAudio sharedManager]playAudio:somItem.caminhoAudio];
}

-(void)alteraEstadoPressionado:(GestureTapItem*)gestureItem{
    gestureItem.item.estadoPressionado = YES;
}

-(void)escondeImagem:(GestureTapItem*)gestureitem{
    gestureitem.item.hidden = YES;
}



@end
