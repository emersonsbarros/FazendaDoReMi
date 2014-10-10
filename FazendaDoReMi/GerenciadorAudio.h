//
//  GerenciadorAudio.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 10/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface GerenciadorAudio : NSObject


+(GerenciadorAudio*)sharedManager;


@property AVAudioPlayer *somExercicioPlayer;
@property AVAudioPlayer *backGroundPrincipalPlayer;
@property NSURL *caminhoDoAudio;




-(void)playAudio:(NSURL*)audio;
-(void)stopAudio;
-(void)ajustaVolume:(float)valor;
-(void)playAudio:(NSURL*)audio :(int)qtdRepeticoes;
-(void)playAudio:(NSURL*)audio :(int)qtdRepeticoes :(float)volume;
-(void)mudaVolume:(float)volume;
-(void)playAudios;
-(void)initPlayer:(NSURL*)audio;


@end
