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

//ITENS
//Gramofone e disco
@property (weak, nonatomic) IBOutlet Item *gramofone;
@property (weak, nonatomic) IBOutlet Item *disco1;

//Opcoes de imagem
@property (weak, nonatomic) IBOutlet Item *imagemOpcao1;
@property (weak, nonatomic) IBOutlet Item *imagemOpcao2;
@property (weak, nonatomic) IBOutlet Item *imagemOpcao3;


//Auxiliares
//Itens
@property NSMutableArray *listaDeItens;
@property NSString *itemCorreto;
@property int posicaoCorretaDoItem;
@property int indiceDoItemCorreto;
@property int indiceDoItemSecundario1;
@property int indiceDoItemSecundario2;

//Controladores de jogo
@property BOOL estaAguardandoArrastarODisco;
@property BOOL estaAguardandoEscolherOItem;
@property int tentativasPorJogada;
@property int totalDeJogadas;
@property int totalDeAcertos;

@end
