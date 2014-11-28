//
//  AulaSomEx6ViewController.h
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

@interface AulaSomEx6ViewController : UIViewController

@property (weak, nonatomic) IBOutlet Item *gramofone;
@property (weak, nonatomic) IBOutlet Item *disco1;
@property (weak, nonatomic) IBOutlet Item *disco2;
@property (weak, nonatomic) IBOutlet Item *disco3;

//Opcoes de imagem
@property (weak, nonatomic) IBOutlet Item *imagemOpcao1;
@property (weak, nonatomic) IBOutlet Item *imagemOpcao2;
@property (weak, nonatomic) IBOutlet Item *imagemOpcao3;

@property NSMutableArray *listaDeItens;
@property NSString *itemCorreto;
@property int indiceDoItemCorreto;

@property int posicaoCorretaDoItem;
@property int posicaoSecundaria1;
@property int posicaoSecundaria2;

@property int tentativasPorJogada;
@property int totalDeJogadas;
@property int totalDeAcertos;

@property BOOL estaAguardandoArrastarODisco;
@property BOOL estaAguardandoEscolherOItem;

@end
