//
//  AulaSomEx2ViewController.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 20/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "AulaSomEx2ViewController.h"

@interface AulaSomEx2ViewController ()
@end

@implementation AulaSomEx2ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
//Botão pausar
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoPausaAula:self];
    
//Adiciona os Itens na tela
    [[ControladorDeItem sharedManager]retornaItem:@"microondas":self.imgMicroondas:@"gestureTap:1:1 + 1 + 2:0:1 + 7:microondasLigado:5:YES:YES:0"];
    [[ControladorDeItem sharedManager]retornaItem:@"tabuaLegumes":self.imgTabuaDeLegumes:@"gestureTap:1:1 + 1 + 2:0:1 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"talheres":self.imgTalheres:@"gestureTap:1:1 + 1 + 2:0:1 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"latinhaRefri":self.imgLataDeRefrigerante:@"gestureTap:1:1 + 1 + 2:0:1 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"batedeira":self.imgBatedeira:@"gestureTap:1:1 + 1 + 2:0:1 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"liquidificador":self.imgLiquidificador:@"gestureTap:1:1 + 1 + 2:0:1 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"torradeira":self.imgTorradeira:@"gestureTap:1:1 + 1 + 2:0:1 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"frigideira":self.imgFrigideira:@"gestureTap:1:1 + 1 + 2:0:1 + 3:5.0:5.0:1.0:1.5"];
    
//Itens requeridos para a próxima aula
    [[ControladorDeItem sharedManager] chamaVerificador:[NSArray arrayWithObjects:
                                                         self.imgTabuaDeLegumes,
                                                         self.imgTalheres,
                                                         self.imgLataDeRefrigerante,
                                                         self.imgMicroondas,
                                                         self.imgBatedeira,
                                                         self.imgLiquidificador,
                                                         self.imgTorradeira,
                                                         self.imgFrigideira,
                                                         nil]];
}

@end
