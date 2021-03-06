//
//  Sinfonia.h
//  DesenhoPartitura
//
//  Created by Vinicius Resende Fialho on 07/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Partitura.h"
#import "Instrumento.h"
#import "DataBaseInstrumento.h"
#import "SoundBankPlayer.h"
#import "Nota.h"
#import "LeitorPartituraXML.h"

#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>
#import <AudioToolbox/AudioToolbox.h>
#import <QuartzCore/QuartzCore.h>

#import "PartituraSinfonia.h"
#import "ComponenteScrollEdicao.h"
#import "DesenhaPartituraEdicao.h"

#import "PlayerPartituraEdicaoViewController.h"

@interface Sinfonia : NSObject < NSXMLParserDelegate > {
    
    NSMutableArray *recebeOrdemNotasDoInstrumento;
    
    int auxIndiceNotasPausa;
    int auxIndiceNotas;
    
    int auxListaSoundBank;
}
@property NSMutableArray *listaSoundBank;
@property BOOL auxPlayPartituraProblema;
+(Sinfonia*)sharedManager;


-(void)trocaInstrumentoESoundBank;
@property NSString *nomeSinfonia;
@property NSString *dataSinfonia;
@property NSString *nomeInstrumentoSinfonia;
@property NSMutableArray *listaPartiturasSinfonia;
@property NSString *numeroCompassos;
@property Instrumento *instrumento;


-(float)pegaTempoNota:(Nota*)nota;


-(void)tocarPlayerPartitura;
-(void)pausePlayerPartitura;
-(void)pararPlayerPartitura;
-(void)repetePlayerPartitura;


-(void)tocarUmaNota:(NSMutableArray*)listaSons :(NSString*)nomeInstrumentoPlist;
-(void)tocarTodasNotasEdicao:(NSMutableArray*)listaSons :(NSString*)nomeInstrumentoPlist;


-(void)desapareceEfeito:(Nota*)notes;
-(void)mostraEfeito:(Nota*)notes;


@property NSString *textoDescricaoNota;
@property int contadorScrollDesloca;
@property int compassoAtual;
@property int numeroTotalCompassos;
@property float controleVelocidaTranNota;

@property BOOL estadoBotaoLimpar;
@property BOOL estadoBotaoPlay;


@end






