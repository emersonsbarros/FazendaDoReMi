//
//  BarraNotasPausasViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 06/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "BarraNotasPausasViewController.h"

@interface BarraNotasPausasViewController ()

@end

@implementation BarraNotasPausasViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.estadoAtivarBotao = NO;
    }
    return self;
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear: animated];
    
    [self.listaOutletNotas removeAllObjects];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.listaOutletNotas = [[NSMutableArray alloc]init];
    [self.listaOutletNotas addObject:self.outBotao4Tempos];
    [self.listaOutletNotas addObject:self.outBotao2Tempos];
    [self.listaOutletNotas addObject:self.outBotao1Tempos];
    [self.listaOutletNotas addObject:self.outBotao12Tempos];
    
    [self.listaOutletNotas addObject:self.outBotao4TemposPausa];
    [self.listaOutletNotas addObject:self.outBotao2TemposPausa];
    [self.listaOutletNotas addObject:self.outBotao1TemposPausa];
    [self.listaOutletNotas addObject:self.outBotao12TemposPausa];
    
    if(self.aux){
        [self removeBtnSustenido];
    }
    
    
    //Seta como padrao a escolha do usario como seminima
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"quarter"];
    
    self.outBotao1Tempos.alpha = 1.0;
    
}

-(void)ocultaAlphaBotoesNotas{
    for(UIView *view in self.listaOutletNotas){
        view.alpha = 0.5;
    }
}

///////////////////////// Botao NOTA /////////////////////////


//Seta a nota que foi escolhida pelo usuario
- (IBAction)semibreveBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"whole"];
    [self ocultaAlphaBotoesNotas];
    self.outBotao4Tempos.alpha = 1.0;
}

- (IBAction)minimaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"half"];
    [self ocultaAlphaBotoesNotas];
    self.outBotao2Tempos.alpha = 1.0;
}

- (IBAction)seminimaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"quarter"];
    [self ocultaAlphaBotoesNotas];
    self.outBotao1Tempos.alpha = 1.0;

}

- (IBAction)colcheiaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"eighth"];
    [self ocultaAlphaBotoesNotas];
    self.outBotao12Tempos.alpha = 1.0;

}



///////////////////////// PAUSA /////////////////////////

-(void)removeBtnSustenido{
    self.outBtnSustenido.hidden = YES;
}


- (IBAction)pausaSemibreveBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPausaPadrao:@"semibrevePausa"];
    [self ocultaAlphaBotoesNotas];
    self.outBotao4TemposPausa.alpha = 1.0;
}

- (IBAction)pausaMinimaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPausaPadrao:@"minimaPausa"];
    [self ocultaAlphaBotoesNotas];
    self.outBotao2TemposPausa.alpha = 1.0;
}

- (IBAction)pausaSeminimaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPausaPadrao:@"seminimaPausa"];
    [self ocultaAlphaBotoesNotas];
    self.outBotao1TemposPausa.alpha = 1.0;
}

- (IBAction)pausaColcheiaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPausaPadrao:@"quarter"];
    [self ocultaAlphaBotoesNotas];
    self.outBotao12TemposPausa.alpha = 1.0;
}


- (IBAction)sustenido:(id)sender {
    if(self.estadoAtivarBotao){
        [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
        self.estadoAtivarBotao = NO;
        self.outBtnSustenido.alpha = 0.5;
    }else {
        [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = YES;
        self.estadoAtivarBotao = YES;
        self.outBtnSustenido.alpha = 1.0;
    }
    
}













@end
