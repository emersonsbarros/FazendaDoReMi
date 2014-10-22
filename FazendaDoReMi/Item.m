//
//  Item.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "Item.h"

@implementation Item

-(id)init{
    self = [super init];
    
    if(self){
        self.listaSprites = [[NSMutableArray alloc] init];
        self.listaSonsURL = [[NSMutableArray alloc]init];
        self.estadoPressionado = false;
        
    }
    return self;
}



@end
