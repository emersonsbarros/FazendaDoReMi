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
    
//Botão pausar
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoPausaAula:self];
    
//TocaTreco
    [[ControladorDeItem sharedManager]retornaItemGesture:@"tocaTrecoAnimado" :self.tocaTrecoAnimado :self.ursoPelucia :@"gesturePan:1:1 + 7:tocaTrecoPulando:INFINITY:NO:YES:0"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"tocaTrecoAnimado" :self.tocaTrecoAnimado :self.carro :@"gesturePan:1:1 + 7:tocaTrecoPulando:INFINITY:NO:YES:0"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"tocaTrecoAnimado" :self.tocaTrecoAnimado :self.skate :@"gesturePan:1:1 + 7:tocaTrecoPulando:INFINITY:NO:YES:0"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"tocaTrecoAnimado" :self.tocaTrecoAnimado :self.relogio :@"gesturePan:1:1 + 7:tocaTrecoPulando:INFINITY:NO:YES:0"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"tocaTrecoAnimado" :self.tocaTrecoAnimado :self.robo :@"gesturePan:1:1 + 7:tocaTrecoPulando:INFINITY:NO:YES:0"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"tocaTrecoAnimado" :self.tocaTrecoAnimado :self.helicoptero :@"gesturePan:1:1 + 7:tocaTrecoPulando:INFINITY:NO:YES:0"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"tocaTrecoAnimado" :self.tocaTrecoAnimado :self.guitarra :@"gesturePan:1:1 + 7:tocaTrecoPulando:INFINITY:NO:YES:0"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"tocaTrecoAnimado" :self.tocaTrecoAnimado :self.trem :@"gesturePan:1:1 + 7:tocaTrecoPulando:INFINITY:NO:YES:0"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"tocaTrecoAnimado" :self.tocaTrecoAnimado :self.bola :@"gesturePan:1:1 + 7:tocaTrecoPulando:INFINITY:NO:YES:0"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"tocaTrecoAnimado" :self.tocaTrecoAnimado :self.caixaDeMusica :@"gesturePan:1:1 + 7:tocaTrecoPulando:INFINITY:NO:YES:0"];

//Brinquedos
    [[ControladorDeItem sharedManager]retornaItemGesture:@"ursoPelucia" :self.ursoPelucia :self.tocaTreco :@"gesturePan + 1 + 2:0:1 + 6:1:0:NO:NO"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"carro" :self.carro :self.tocaTreco :@"gesturePan + 1 + 2:0:1 + 6:1:0:NO:NO"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"skate" :self.skate :self.tocaTreco :@"gesturePan + 1 + 2:0:1 + 6:1:0:NO:NO"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"relogio" :self.relogio :self.tocaTreco :@"gesturePan + 1 + 2:0:1 + 6:1:0:NO:NO"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"robo" :self.robo :self.tocaTreco :@"gesturePan + 1 + 2:0:1 + 6:1:0:NO:NO"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"helicoptero" :self.helicoptero :self.tocaTreco :@"gesturePan + 1 + 2:0:1 + 6:1:0:NO:NO"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"guitarra" :self.guitarra :self.tocaTreco :@"gesturePan + 1 + 2:0:1 + 6:1:0:NO:NO"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"trem" :self.trem :self.tocaTreco :@"gesturePan + 1 + 2:0:1 + 6:1:0:NO:NO"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"bola" :self.bola :self.tocaTreco :@"gesturePan + 1 + 2:0:1 + 6:1:0:NO:NO"];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"caixaDeMusica" :self.caixaDeMusica :self.tocaTreco :@"gesturePan + 1 + 2:0:1 + 6:1:0:NO:NO"];

//Itens requeridos para a próxima aula
    [[ControladorDeItem sharedManager]chamaVerificador:[NSArray arrayWithObjects:
                                                        self.ursoPelucia,
                                                        self.carro,
                                                        self.skate,
                                                        self.relogio,
                                                        self.robo,
                                                        self.helicoptero,
                                                        self.guitarra,
                                                        self.trem,
                                                        self.bola,
                                                        self.caixaDeMusica,
                                                        nil]];
}

@end

