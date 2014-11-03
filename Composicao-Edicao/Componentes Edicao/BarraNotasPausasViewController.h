//
//  BarraNotasPausasViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 06/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataBaseNotaPadrao.h"
#import "Nota.h"
#import "EscolhaUsuarioPartitura.h"

@interface BarraNotasPausasViewController : UIViewController

//Nota que é escolhida pelo usuario colocar na partitura
@property Nota *notaEscolhaEdicao;
@property NSMutableArray *listaOutletNotas;


//Outlet dos botoes
@property (weak, nonatomic) IBOutlet UIButton *outBotao4Tempos;
@property (weak, nonatomic) IBOutlet UIButton *outBotao2Tempos;
@property (weak, nonatomic) IBOutlet UIButton *outBotao1Tempos;
@property (weak, nonatomic) IBOutlet UIButton *outBotao12Tempos;

@property (weak, nonatomic) IBOutlet UIButton *outBotao4TemposPausa;
@property (weak, nonatomic) IBOutlet UIButton *outBotao2TemposPausa;
@property (weak, nonatomic) IBOutlet UIButton *outBotao1TemposPausa;
@property (weak, nonatomic) IBOutlet UIButton *outBotao12TemposPausa;

@property BOOL aux;

@property BOOL estadoAtivarBotao;
@property (weak, nonatomic) IBOutlet UIButton *outBtnSustenido;

-(void)removeBtnSustenido;

@end
