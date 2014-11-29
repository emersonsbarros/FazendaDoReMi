//
//  XilofoneVirtualViewController.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 19/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EscolhaUsuarioPartitura.h"
#import "ComponenteScrollEdicao.h"


@interface XilofoneVirtualViewController : UIViewController



//Botoes
- (IBAction)btnTecla1:(id)sender;
- (IBAction)btnTecla2:(id)sender;
- (IBAction)btnTecla3:(id)sender;
- (IBAction)btnTecla4:(id)sender;
- (IBAction)btnTecla5:(id)sender;
- (IBAction)btnTecla6:(id)sender;
- (IBAction)btnTecla7:(id)sender;
- (IBAction)btnTecla8:(id)sender;
- (IBAction)btnTecla9:(id)sender;
- (IBAction)btnTecla10:(id)sender;
- (IBAction)btnTecla11:(id)sender;
- (IBAction)btnTecla12:(id)sender;
- (IBAction)btnTecla13:(id)sender;


//Valores para passar como um touch (x,y)
@property NSValue *nota4c;
@property NSValue *nota4d;
@property NSValue *nota4e;
@property NSValue *nota4f;
@property NSValue *nota4g;
@property NSValue *nota4a;
@property NSValue *nota4b;
@property NSValue *nota5c;
@property NSValue *nota5d;
@property NSValue *nota5e;
@property NSValue *nota5f;
@property NSValue *nota5g;
@property NSValue *nota5a;
@property NSValue *nota5b;


@end
