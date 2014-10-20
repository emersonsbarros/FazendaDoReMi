//
//  GerenciadoresAcoes.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 16/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GestureTapItem.h"
#import "GerenciadorAudio.h"
#import "SomItem.h"

@interface GerenciadoresAcoes : NSObject

+(GerenciadoresAcoes*)sharedManager;



//Toca o som do respectivo Objeto
-(void)tocarSomItem:(Item*)item :(NSString*)indiceAudio;


//Coloca uma tag quando o objeto é pressionado para poder trocar de Viewcontroller
-(void)alteraEstadoPressionado:(Item*)item;


//Esconde uma imagem
-(void)escondeImagem:(Item*)item;


@end
