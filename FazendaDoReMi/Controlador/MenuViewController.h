//
//  MenuViewController.h
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 26/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GerenciadorNavigationController.h"
#import "GerenciadorComponenteView.h"
#import "GerenciadorAnimacoes.h"
#import "GerenciadorDeMascote.h"
#import "GerenciadorDeItem.h"
#import "ControladorDeItem.h"

@interface MenuViewController : UIViewController

//Botões
@property (weak, nonatomic) IBOutlet UIButton *btoJornada;
@property (weak, nonatomic) IBOutlet UIButton *btoEstudio;
@property (weak, nonatomic) IBOutlet UIButton *btoJogos;

//Imagens animadas
@property (weak, nonatomic) IBOutlet UIImageView *nuvemDireita;
@property (weak, nonatomic) IBOutlet UIImageView *nuvemEsquerda;
@property (weak, nonatomic) IBOutlet UIImageView *porteira;


@property (weak, nonatomic) IBOutlet UIImageView *imgMascote;



@property NSMutableArray *listaImagensMascote;



@end
