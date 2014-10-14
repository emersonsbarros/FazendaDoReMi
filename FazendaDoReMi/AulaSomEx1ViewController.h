//
//  AulaSomViewController.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 07/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "ControladorDeItem.h"
#import "GerenciadorDeItem.h"
#import "GerenciadorComponenteView.h"


@interface AulaSomEx1ViewController : UIViewController



@property (weak, nonatomic) IBOutlet Item *imgViolao;

@property (weak, nonatomic) IBOutlet Item *imgPiano;

@property (weak, nonatomic) IBOutlet Item *imgFlauta;

@property (weak, nonatomic) IBOutlet Item *imgTambor;

@property (weak, nonatomic) IBOutlet Item *imgXilofone;

@property (weak, nonatomic) IBOutlet Item *imgChocalho;

@property (weak, nonatomic) IBOutlet Item *imgViolino;

@property (weak, nonatomic) IBOutlet Item *imgSaxfone;

@property (weak, nonatomic) IBOutlet Item *imgQuadro;

@property (weak, nonatomic) IBOutlet Item *imgFlorGiratoria;

@property (weak, nonatomic) IBOutlet Item *imgFlorAgua;


@end
