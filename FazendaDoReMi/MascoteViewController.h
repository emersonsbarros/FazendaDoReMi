//
//  MascoteViewController.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 08/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GerenciadorDeMascote.h"
#import "Mascote.h"
#import "GerenciadorDeMascote.h"
#import <AVFoundation/AVFoundation.h>

@interface MascoteViewController : UIViewController


@property Mascote *imgMascote;
@property NSString *nomeMascote;
@property AVAudioPlayer *playerMascote;
+(MascoteViewController*)sharedManager;

-(id)initMascote:(NSString*)nomeMascote;


-(void)colocaAnimacaoMascote:(NSString*)nomeAnimacao;


-(void)executaSomMascote:(NSString*)nomeAudio :(float)delay;

@end
