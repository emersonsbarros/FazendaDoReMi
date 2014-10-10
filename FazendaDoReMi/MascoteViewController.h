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

@interface MascoteViewController : UIViewController


@property Mascote *imgMascote;
@property NSString *nomeMascote;

+(MascoteViewController*)sharedManager;

-(void)colocaAnimacaoMascote:(NSString*)nomeAnimacao;

@end
