//
//  MenuViewController.h
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 26/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController

//Botões
@property (weak, nonatomic) IBOutlet UIButton *btoJornada;
@property (weak, nonatomic) IBOutlet UIButton *btoEstudio;
@property (weak, nonatomic) IBOutlet UIButton *btoJogos;

//Imagens animadas
@property (weak, nonatomic) IBOutlet UIImageView *nuvemDireita;
@property (weak, nonatomic) IBOutlet UIImageView *nuvemEsquerda;
@property (weak, nonatomic) IBOutlet UIImageView *porteira;


@property (weak, nonatomic) IBOutlet UIButton *lblBtnJornda;
@property (weak, nonatomic) IBOutlet UIButton *lblBtnEstudio;
@property (weak, nonatomic) IBOutlet UIButton *lblBtnJogos;


@end
