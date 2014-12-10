//
//  Componentes.h
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 01/12/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Componentes : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber * id_Componente;
@property (nonatomic, retain) NSString * nome;

@end
