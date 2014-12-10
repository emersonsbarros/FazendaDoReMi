//
//  PartituraComposta.h
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 24/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SoundBankPlayer.h"
#import "Partitura.h"
#import "Instrumento.h"

@interface PartituraSinfonia : NSObject


@property SoundBankPlayer *soundBank;
@property NSMutableArray *listaPartituraSinfonia;
@property Partitura *partitura;
@property NSMutableArray *listaOrdemInstrumento;
@property Instrumento *instrumento;
@property int auxIndiceNotas;

@end
