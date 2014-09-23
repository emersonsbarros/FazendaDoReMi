//
//  Item.h
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>

@interface Item : NSObject

//Atributos
@property NSString *nome;
@property NSMutableArray *listaSprites;
@property AVAudioPlayer *player;
@property UIImage *imagem;

//Metodos
-(void)retornaAudio: (NSString*)nome;

@end
