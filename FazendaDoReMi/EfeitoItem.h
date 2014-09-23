//
//  EfeitoItem.h
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EfeitoItem : NSObject

//Metodos
-(void)desaparece;
-(void)aparece;
-(void)aumenta;
-(void)diminui;
-(void)balanca;

-(void)trocaSprite: (NSString*)nome;

@end
