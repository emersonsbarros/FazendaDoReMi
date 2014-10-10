//
//  GerenciadorAudio.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 10/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "GerenciadorAudio.h"

@implementation GerenciadorAudio


//Singleton
+(GerenciadorAudio*)sharedManager{
    static GerenciadorAudio *mascote = nil;
    if(!mascote){
        mascote = [[super allocWithZone:nil] init];
    }
    return mascote;
}

-(id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

-(void)initPlayer:(NSURL*)audio{
    self.somExercicioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audio error: nil];
}

-(void)playAudios{
    [[self somExercicioPlayer]play];
}

-(void)playAudio:(NSURL*)audio{
    self.somExercicioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audio error: nil];
    self.somExercicioPlayer.volume = 5.0;
    [[self somExercicioPlayer]play];
}

-(void)playAudio:(NSURL*)audio :(int)qtdRepeticoes{
    self.somExercicioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audio error: nil];
    self.somExercicioPlayer.numberOfLoops = qtdRepeticoes;
    [[self somExercicioPlayer]play];
}

-(void)playAudio:(NSURL*)audio :(int)qtdRepeticoes :(float)volume{
    self.somExercicioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audio error: nil];
    self.somExercicioPlayer.numberOfLoops = qtdRepeticoes;
    self.somExercicioPlayer.volume = volume;
    [[self somExercicioPlayer]play];
}

-(void)mudaVolume:(float)volume{
    self.somExercicioPlayer.volume = volume;
}

-(void)stopAudio{
    [[self somExercicioPlayer]stop];
}

-(void)ajustaVolume:(float)valor{
    self.somExercicioPlayer.volume = valor;
}



@end
