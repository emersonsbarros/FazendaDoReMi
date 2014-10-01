//
//  ListaInstrumentoViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 04/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "ListaInstrumentoViewController.h"

@interface ListaInstrumentoViewController ()

@end

@implementation ListaInstrumentoViewController

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
    
    self.ajusteTamanhoBotaoInstrumento = 20;
    
    self.listaOutletBotoes = [[NSMutableArray alloc]init];
    [self.listaOutletBotoes addObject:self.outBotaoFlauta];
    [self.listaOutletBotoes addObject:self.outBotaoPiano];
    [self.listaOutletBotoes addObject:self.outBotaoViolao];
    
    self.outBotaoPiano.alpha = 1.0;

    
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear: animated];
    
    [self.listaOutletBotoes removeAllObjects];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)ocultaAlphaBotoesNotas{
    for(UIView *view in self.listaOutletBotoes){
        view.alpha = 0.5;
    }
}

////////////////////////////METODOS////////////////////////////////////


//Seta um intrumento na Escolha de usuario para tocar
- (IBAction)tocar:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura = @"Piano";
    [self ocultaAlphaBotoesNotas];
    self.outBotaoPiano.alpha = 1.0;
}


- (IBAction)tocarViolao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura = @"ViolaoNylon";
    [self ocultaAlphaBotoesNotas];
    self.outBotaoViolao.alpha = 1.0;
}


- (IBAction)tocarFlauta:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura = @"FlautaDoce";
    [self ocultaAlphaBotoesNotas];
    self.outBotaoFlauta.alpha = 1.0;
}




@end
