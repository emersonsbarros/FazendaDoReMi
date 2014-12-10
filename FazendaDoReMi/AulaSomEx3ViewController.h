//
//  AulaSomEx3ViewController.h
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 31/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "ControladorDeItem.h"
#import "GerenciadorDeItem.h"
#import "GerenciadorComponenteView.h"

@interface AulaSomEx3ViewController : UIViewController

@property (weak, nonatomic) IBOutlet Item *tocaTreco;
@property (weak, nonatomic) IBOutlet Item *tocaTrecoAnimado;

@property (weak, nonatomic) IBOutlet Item *bola;
@property (weak, nonatomic) IBOutlet Item *caixaDeMusica;
@property (weak, nonatomic) IBOutlet Item *carro;
@property (weak, nonatomic) IBOutlet Item *guitarra;
@property (weak, nonatomic) IBOutlet Item *helicoptero;
@property (weak, nonatomic) IBOutlet Item *relogio;
@property (weak, nonatomic) IBOutlet Item *robo;
@property (weak, nonatomic) IBOutlet Item *skate;
@property (weak, nonatomic) IBOutlet Item *trem;
@property (weak, nonatomic) IBOutlet Item *ursoPelucia;

@end
