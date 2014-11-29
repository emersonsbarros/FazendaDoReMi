//
//  TecladoViewController.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 13/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "TecladoLivreViewController.h"

@interface TecladoLivreViewController ()

@end

@implementation TecladoLivreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

///////////////////// VIEWCONTROLLER /////////////////////

- (BOOL)prefersStatusBarHidden {
    return YES;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    [[Sinfonia sharedManager]trocaInstrumentoESoundBank];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear: animated];
    
    //Tira o som da partitura caso o usuario saia com a musica tocando
    [[Sinfonia sharedManager]pararPlayerPartitura];
    [Sinfonia sharedManager].estadoBotaoPlay = true;
    [Sinfonia sharedManager].estadoBotaoLimpar = true;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[GerenciadorComponenteView sharedManager]addComponentesTeclado:self :0 :0];
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoVoltar:self:0:-8];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
