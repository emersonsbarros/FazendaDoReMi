//
//  BotaoPausaJogoViewController.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 09/12/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "BotaoPausaJogoViewController.h"

@interface BotaoPausaJogoViewController ()

@end

@implementation BotaoPausaJogoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPausaJogo:(id)sender {
    [[GerenciadorAudio sharedManager] ajustaVolume: 0];
    
    [[GerenciadorComponenteView sharedManager]addComponentesMenuPausaJogo: [GerenciadorNavigationController sharedManager].controladorApp.visibleViewController:YES:0];
    [GerenciadorDeAula sharedManager].cenaAtual.view.paused = YES;
    
}


@end
