//
//  AulaSomViewController.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 07/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "AulaSomEx1ViewController.h"

@interface AulaSomEx1ViewController ()
@end

@implementation AulaSomEx1ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
//Botão voltar
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoPausaAula: self];
    
//Adiciona os Itens na tela
//Animados
    [[ControladorDeItem sharedManager]retornaItem :@"tambor"    :self.imgTambor:    @"gestureTap:1:1 + 1 + 2:0:1 + 7:tamborTocando:5:YES:YES:0"];
//    [[ControladorDeItem sharedManager]retornaItem :@"xilofone"  :self.imgXilofone:  @"gestureTap:1 + 1 + 2:0:1 + 7:xilofoneTocando:5:YES:YES:0"];
    [[ControladorDeItem sharedManager]retornaItem :@"saxofone"  :self.imgSaxfone:   @"gestureTap:1:1 + 1 + 2:0:1 + 7:saxofoneTocando:5:YES:YES:0"];
    
//    [[ControladorDeItem sharedManager]retornaItem :@"violao"    :self.imgViolao:    @"gestureTap:3 + 1 + 2:0:1 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem :@"piano"     :self.imgPiano:     @"gestureTap:1:1 + 1 + 2:0:1"];
    [[ControladorDeItem sharedManager]retornaItem :@"flauta"    :self.imgFlauta:    @"gestureTap:1:1 + 1 + 3:5.0:5.0:1.0:1.5 + 2:0:1"];
    [[ControladorDeItem sharedManager]retornaItem :@"chocalho"  :self.imgChocalho:  @"gestureTap:1:1 + 1 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem :@"violino"   :self.imgViolino:   @"gestureTap:1:1 + 1 + 2:0:1 + 3:5.0:5.0:1.0:1.5"];
    
    [[ControladorDeItem sharedManager]retornaItem:@"florRocha"  :self.imgFlorAgua       :@"gestureTap:1:1"];
    [[ControladorDeItem sharedManager]retornaItem:@"florRosa"   :self.imgFlorGiratoria1 :@"gestureTap:1:1 + 4:1:2:1"];
    [[ControladorDeItem sharedManager]retornaItem:@"florRosa"   :self.imgFlorGiratoria2 :@"gestureTap:1:1 + 4:1:2:-1"];
    [[ControladorDeItem sharedManager]retornaItem:@"quadroZecao":self.imgQuadro         :@"gestureTap:1:1 + 5:1:1:NO:0:400"];
    
//Itens requeridos para a próxima aula
    [[ControladorDeItem sharedManager]chamaVerificador:[NSArray arrayWithObjects:self.imgFlauta,self.imgPiano,self.imgTambor,self.imgSaxfone,self.imgChocalho,self.imgViolino,nil]];
}


@end
