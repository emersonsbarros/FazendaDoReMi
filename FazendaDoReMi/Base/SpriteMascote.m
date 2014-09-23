//
//  SpriteMascote.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "SpriteMascote.h"

@implementation SpriteMascote


-(id)init{
    self = [super init];
    if(self){
        self.listaDeSprites = [[NSMutableArray alloc]init];
    }
    return self;
}

@end
