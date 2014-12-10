//
//  AulaSomEx2ViewController.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 20/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "ControladorDeItem.h"
#import "GerenciadorDeItem.h"
#import "GerenciadorComponenteView.h"

@interface AulaSomEx2ViewController : UIViewController

@property (weak, nonatomic) IBOutlet Item *imgTabuaDeLegumes;
@property (weak, nonatomic) IBOutlet Item *imgTalheres;
@property (weak, nonatomic) IBOutlet Item *imgLataDeRefrigerante;
@property (weak, nonatomic) IBOutlet Item *imgMicroondas;
@property (weak, nonatomic) IBOutlet Item *imgBatedeira;
@property (weak, nonatomic) IBOutlet Item *imgLiquidificador;
@property (weak, nonatomic) IBOutlet Item *imgTorradeira;
@property (weak, nonatomic) IBOutlet Item *imgFrigideira;

@end
