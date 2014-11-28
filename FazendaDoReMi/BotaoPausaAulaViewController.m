//
//  BotaoPausaAulaViewController.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 19/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "BotaoPausaAulaViewController.h"

@interface BotaoPausaAulaViewController ()
@end

@implementation BotaoPausaAulaViewController

- (IBAction)btoPausaAula:(id)sender {
    
    [[GerenciadorAudio sharedManager] ajustaVolume: 0];
    [[GerenciadorComponenteView sharedManager]addComponentesMenuPausa: [GerenciadorNavigationController sharedManager].controladorApp.visibleViewController];
}

@end
