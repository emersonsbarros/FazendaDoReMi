//
//  MenuPausaAulaViewController.h
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 19/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GerenciadorNavigationController.h"
#import "GerenciadorDeAula.h"
#import "GerenciadorAudio.h"

@interface MenuPausaAulaViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *outBtoAvancar;
- (IBAction)btoTutorial:(id)sender;
- (IBAction)btoRefazer:(id)sender;
- (IBAction)btoAvancar:(id)sender;
- (IBAction)btoMapa:(id)sender;
- (IBAction)btoContinuar:(id)sender;

@end
