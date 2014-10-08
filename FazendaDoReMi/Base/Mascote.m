//
//  Mascote.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "Mascote.h"

@implementation Mascote


-(id)init{
    self = [super init];
    if(self){
        self.nome = @"ZéCão";
        self.listaDeConversas = [[NSMutableArray alloc]init];
        self.listaDeSprites = [[NSMutableArray alloc]init];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

//Singleton
+(Mascote*)sharedManager{
    static Mascote *mascote = nil;
    if(!mascote){
        mascote = [[super allocWithZone: nil] init];
    }
    return mascote;
}


@end
