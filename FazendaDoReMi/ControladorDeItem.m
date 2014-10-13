//
//  ControladorDeItem.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 13/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "ControladorDeItem.h"

@implementation ControladorDeItem


-(id)init{
    self = [super init];
    
    if(self){
        self.listaObjetosPressionados = [[NSMutableArray alloc]init];
        self.contadorItensPressionados = 0;
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

//Singleton
+(ControladorDeItem*)sharedManager{
    static ControladorDeItem *gerenciadorDeItem = nil;
    
    if(!gerenciadorDeItem){
        gerenciadorDeItem = [[super allocWithZone: nil] init];
    }
    return gerenciadorDeItem;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(void)chamaVerificador:(NSArray*)listaItens{
    
   self.timerVerificadorItemPressionado =  [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(verificadorEstadoItemPressionado)
                                   userInfo: nil
                                    repeats: YES];
    
    
    for(Item *itemPressionado in listaItens){
        [self.listaObjetosPressionados addObject:itemPressionado];
    }

}

-(void)verificadorEstadoItemPressionado{
    self.contadorItensPressionados =0;
    
    for(Item *itemPressionado in self.listaObjetosPressionados){
        if(itemPressionado.estadoPressionado == true){
            self.contadorItensPressionados +=1;
        }
    }
    
    
    if(self.contadorItensPressionados == self.listaObjetosPressionados.count){
        NSLog(@"Todos Pressionados");
        [self.listaObjetosPressionados removeAllObjects];
        self.contadorItensPressionados = 0;
        [self.timerVerificadorItemPressionado invalidate];
    }
   
}


@end
