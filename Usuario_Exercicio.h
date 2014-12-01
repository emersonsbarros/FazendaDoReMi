//
//  Usuario_Exercicio.h
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 01/12/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Usuario_Exercicio : NSManagedObject

@property (nonatomic, retain) NSString * nomeUsuario;
@property (nonatomic, retain) NSDecimalNumber * idView;
@property (nonatomic, retain) NSNumber * pontuacao;

@end
