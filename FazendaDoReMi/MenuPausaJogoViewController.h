//
//  MenuPausaJogoViewController.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 09/12/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GerenciadorNavigationController.h"
#import "GerenciadorDeAula.h"
#import "GerenciadorAudio.h"

@interface MenuPausaJogoViewController : UIViewController


@property BOOL estadoMenu;
@property int pontuacao;

- (IBAction)btnVoltarMenuJogo:(id)sender;
- (IBAction)btnRefazer:(id)sender;
- (IBAction)btnTutorial:(id)sender;
- (IBAction)btnContinuar:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *lblBtnTutorial;
@property (weak, nonatomic) IBOutlet UIButton *lblBtnContinuar;


@property (weak, nonatomic) IBOutlet UILabel *lblGameOver;

@property (weak, nonatomic) IBOutlet UIView *viewPontuacao;
@property (weak, nonatomic) IBOutlet UILabel *lblPontuacao;

@end
