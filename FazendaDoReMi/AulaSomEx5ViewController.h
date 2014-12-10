//
//  AulaSomEx5ViewController.h
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

@interface AulaSomEx5ViewController : UIViewController

@property (weak, nonatomic) IBOutlet Item *passaroAmarelo;
@property (weak, nonatomic) IBOutlet Item *passaroAzul;
@property (weak, nonatomic) IBOutlet Item *passaroLaranja;
@property (weak, nonatomic) IBOutlet Item *passaroRosa;
@property (weak, nonatomic) IBOutlet Item *passaroRoxo;
@property (weak, nonatomic) IBOutlet Item *passaroVerde;


@end
