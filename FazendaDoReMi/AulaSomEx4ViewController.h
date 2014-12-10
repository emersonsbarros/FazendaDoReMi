//
//  AulaSomEx4ViewController.h
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 17/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "ControladorDeItem.h"
#import "GerenciadorDeItem.h"
#import "GerenciadorComponenteView.h"

@interface AulaSomEx4ViewController : UIViewController

//ITENS
@property (weak, nonatomic) IBOutlet Item *galinhaAmarela;
@property (weak, nonatomic) IBOutlet Item *galoAzul;
@property (weak, nonatomic) IBOutlet Item *galinhaLaranja;
@property (weak, nonatomic) IBOutlet Item *galinhaRosa;
@property (weak, nonatomic) IBOutlet Item *galinhaRoxa;
@property (weak, nonatomic) IBOutlet Item *galoVerde;

//AUXILIARES
@property NSMutableArray *listaDeGalos;
@property NSMutableArray *listaDeVolumes;
@property NSString *nomeDoGaloCorreto;
@property int indiceDoVolumeCorreto;
@property float volumeCorreto;

//CONTROLES DE JOGO
@property BOOL estaAguardandoOuvirTodosOsGalos;
@property BOOL estaAguardandoEscolherOGaloCorreto;
@property BOOL ehPraDescobrirOSomMaior;

@property int totalDeJogadas;
@property int totalDeAcertos;


@end
