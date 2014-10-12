//
//  Item.h
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>

@interface Item : UIImageView

//Atributos
@property NSString *nome;
@property BOOL estadoPressionado;
@property NSMutableArray *listaSprites;
@property NSMutableArray *listaSonsURL;


//Metodos
-(void)retornaAudio: (NSString*)nome;


@end
