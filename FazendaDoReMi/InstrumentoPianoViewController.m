//
//  InstrumentoViewController.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 23/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "InstrumentoPianoViewController.h"

@interface InstrumentoPianoViewController ()

@end

@implementation InstrumentoPianoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}


////////////////// VIEWCONTROLLER ///////////////////


-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear: animated];
    
    //Tira o som da partitura caso o usuario saia com a musica tocando
    [[Sinfonia sharedManager]pararPlayerPartitura];
    [Sinfonia sharedManager].estadoBotaoPlay = true;
    [Sinfonia sharedManager].estadoBotaoLimpar = true;
    
    
    for(UIView *view in self.view.subviews){
        [view removeFromSuperview];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    [[Sinfonia sharedManager]trocaInstrumentoESoundBank];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Add componentes da Tela Edicao
    [[GerenciadorComponenteView sharedManager]addComponentesBarraMenuNotasPausa:self:YES];
    [[GerenciadorComponenteView sharedManager]addComponentesPlayerEdicao:self:150:-8];
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoVoltar:self:0:-8];
    
    
    //Manda o UIScrollView para a classe modeladora
    [[ComponenteScrollEdicao sharedManager]recebeScroll:self.scrollPartitura];
    [[ComponenteScrollEdicao sharedManager].scrollPartitura removeGestureRecognizer:[[ComponenteScrollEdicao sharedManager].scrollPartitura.gestureRecognizers firstObject]];
    

    
    //Desenha a partitura com 10 linhas de pentagrama
    [[DesenhaPartituraEdicao sharedManager]desenhaContornoPartituraParaEdicao:6:NO];
    
    [[GerenciadorComponenteView sharedManager]addComponentesPiano:self :0 :500];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
