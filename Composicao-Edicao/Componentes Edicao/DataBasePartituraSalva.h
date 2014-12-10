//
//  DataBasePartituraSalva.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 28/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Partitura.h"

@interface DataBasePartituraSalva : NSObject


@property NSMutableArray *listaPartiturasSalvas;


+(DataBasePartituraSalva*)sharedManager;



@end
