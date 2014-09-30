//
//  ListaInstrumentoViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 04/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EscolhaUsuarioPartitura.h"


@interface ListaInstrumentoViewController : UIViewController



@property NSMutableArray *listaOutletBotoes;
@property int ajusteTamanhoBotaoInstrumento;

//Outlet botoes
@property (weak, nonatomic) IBOutlet UIButton *outBotaoViolao;
@property (weak, nonatomic) IBOutlet UIButton *outBotaoPiano;
@property (weak, nonatomic) IBOutlet UIButton *outBotaoFlauta;




@end
