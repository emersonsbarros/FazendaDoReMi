//
//  PianoViewController.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 23/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sinfonia.h"
#import "Nota.h"
#import "ComponenteScrollEdicao.h"

@interface PianoViewController : UIViewController


///////4
- (IBAction)tecla4c:(id)sender;
- (IBAction)tecla4d:(id)sender;
- (IBAction)tecla4e:(id)sender;
- (IBAction)tecla4f:(id)sender;
- (IBAction)tecla4g:(id)sender;
- (IBAction)tecla4a:(id)sender;
- (IBAction)tecla4b:(id)sender;

@property NSValue *nota4c;
@property NSValue *nota4d;
@property NSValue *nota4e;
@property NSValue *nota4f;
@property NSValue *nota4g;
@property NSValue *nota4a;
@property NSValue *nota4b;



///////5
- (IBAction)tecla5c:(id)sender;
- (IBAction)tecla5d:(id)sender;
- (IBAction)tecla5e:(id)sender;
- (IBAction)tecla5f:(id)sender;
- (IBAction)tecla5g:(id)sender;
- (IBAction)tecla5a:(id)sender;


@property NSValue *nota5c;
@property NSValue *nota5d;
@property NSValue *nota5e;
@property NSValue *nota5f;
@property NSValue *nota5g;
@property NSValue *nota5a;
@property NSValue *nota5b;




//Sutenido
- (IBAction)teclas1:(id)sender;
- (IBAction)teclas2:(id)sender;
- (IBAction)teclas3:(id)sender;
- (IBAction)teclas4:(id)sender;
- (IBAction)teclas5:(id)sender;
- (IBAction)tecla6:(id)sender;
- (IBAction)teclas7:(id)sender;
- (IBAction)teclas8:(id)sender;
- (IBAction)tecla9:(id)sender;

@property Nota *notas1;
@property Nota *notas2;
@property Nota *notas3;
@property Nota *notas4;
@property Nota *notas5;
@property Nota *notas6;
@property Nota *notas7;
@property Nota *notas8;
@property Nota *notas9;

@property CGPoint pontoToque;

@end



