//
//  AulaSomEx5ViewController.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 17/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "AulaSomEx5ViewController.h"

@interface AulaSomEx5ViewController ()
@end

@implementation AulaSomEx5ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Botão voltar
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoPausaAula: self];

    [[ControladorDeItem sharedManager]retornaItem:@"passaroAzul": self.passaroAzul:@"gestureTap:1:1 + 1 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"passaroLaranja": self.passaroLaranja:@"gestureTap:1:1 + 1 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"passaroRosa": self.passaroRosa:@"gestureTap:1:1 + 1 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"passaroVerde": self.passaroVerde:@"gestureTap:1:1 + 1 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"passaroAmarelo": self.passaroAmarelo:@"gestureTap:1:1 + 1 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"passaroRoxo": self.passaroRoxo:@"gestureTap:1:1 + 1 + 3:5.0:5.0:1.0:1.5"];
    
}


@end
