//
//  AulaSomEx3ViewController.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 31/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "AulaSomEx3ViewController.h"

@interface AulaSomEx3ViewController ()
@end

@implementation AulaSomEx3ViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    //Botão voltar
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoPausaAula:self];
    
    //Brinquedos
    [[ControladorDeItem sharedManager]retornaItemGesture:@"ursoPelucia" :self.ursoPelucia :self.tocaTreco :@"gesturePan + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"carro" :self.carro :self.tocaTreco :@"gesturePan + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"skate" :self.skate :self.tocaTreco :@"gesturePan + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"relogio" :self.relogio :self.tocaTreco :@"gesturePan + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"robo" :self.robo :self.tocaTreco :@"gesturePan + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"helicoptero" :self.helicoptero :self.tocaTreco :@"gesturePan + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"guitarra" :self.guitarra :self.tocaTreco :@"gesturePan + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"trem" :self.trem :self.tocaTreco :@"gesturePan + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"bola" :self.bola :self.tocaTreco :@"gesturePan + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"caixaDeMusica" :self.caixaDeMusica :self.tocaTreco :@"gesturePan + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];

    //TocaTreco
    [[ControladorDeItem sharedManager]retornaItem:@"tocaTreco":self.tocaTreco:@"gestureTap:1:1 + 7:tocaTrecoSeta:INFINITY:NO:NO:0"];

}

@end
