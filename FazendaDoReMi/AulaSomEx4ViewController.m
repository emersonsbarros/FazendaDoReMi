//
//  AulaSomEx4ViewController.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 17/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "AulaSomEx4ViewController.h"

@interface AulaSomEx4ViewController ()
@end

@implementation AulaSomEx4ViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Botão voltar
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoPausaAula:self];
    
    [[ControladorDeItem sharedManager]retornaItem:@"galoVerde": self.galoVerde:@"gestureTap:1:1 + 1 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"galinhaLaranja": self.galinhaLaranja:@"gestureTap:1:1 + 1 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"galinhaRoxa": self.galinhaRoxa:@"gestureTap:1:1 + 1 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"galoAzul": self.galoAzul:@"gestureTap:1:1 + 1 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"galinhaRosa": self.galinhaRosa:@"gestureTap:1:1 + 1 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"galinhaAmarela": self.galinhaAmarela:@"gestureTap:1:1 + 1 + 3:5.0:5.0:1.0:1.5"];

}


@end
