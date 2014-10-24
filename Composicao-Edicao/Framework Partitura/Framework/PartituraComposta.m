//
//  PartituraComposta.m
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 24/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "PartituraComposta.h"

@implementation PartituraComposta


-(id)init{
    self = [super init];
    if(self){
        self.soundBank = [[SoundBankPlayer alloc]init];
        self.partitura = [[Partitura alloc]init];
        self.instrumento = [[Instrumento alloc]init];
        self.listaOrdemInstrumento = [[NSMutableArray alloc]init];
        self.listaPartituraSinfonia = [[NSMutableArray alloc]init];
    }
    return self;
}



@end
