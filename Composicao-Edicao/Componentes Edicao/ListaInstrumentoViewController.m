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
    
    
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear: animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)resetaFrameBotoesNotas{
    for(UIView *view in self.listaOutletBotoes){
        view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    }
}

////////////////////////////METODOS////////////////////////////////////


//Seta um intrumento na Escolha de usuario para tocar
- (IBAction)tocar:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura = @"Piano";
//    self.outBotaoPiano.frame = CGRectMake(154-self.ajusteTamanhoBotaoInstrumento, 102-self.ajusteTamanhoBotaoInstrumento, 100+self.ajusteTamanhoBotaoInstrumento, 100+self.ajusteTamanhoBotaoInstrumento);
    
    
}


- (IBAction)tocarViolao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura = @"ViolaoNylon";
}


- (IBAction)tocarFlauta:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura = @"FlautaDoce";
}




@end
