//
//  ExercicioBanco.h
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 01/12/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ExercicioBanco : NSManagedObject

@property (nonatomic, retain) NSNumber * tipo;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSNumber * idView;

@end
