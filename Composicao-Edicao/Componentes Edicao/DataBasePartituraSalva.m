//
//  DataBasePartituraSalva.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 28/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "DataBasePartituraSalva.h"

@implementation DataBasePartituraSalva

//Singleton
+(DataBasePartituraSalva*)sharedManager{
    static DataBasePartituraSalva *mascote = nil;
    if(!mascote){
        mascote = [[super allocWithZone:nil] init];
    }
    return mascote;
}

-(id)init{
    self = [super init];
    if(self){
        self.listaPartiturasSalvas = [[NSMutableArray alloc]init];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


-(void)salvarPartitura{
    //Partitura *partitura = [[Partitura alloc]init];
    
    
}

@end
