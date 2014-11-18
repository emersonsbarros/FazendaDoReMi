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

@interface TecladoViewController : UIViewController


///////4
- (IBAction)tecla4c:(id)sender;
- (IBAction)tecla4d:(id)sender;
- (IBAction)tecla4e:(id)sender;
- (IBAction)tecla4f:(id)sender;
- (IBAction)tecla4g:(id)sender;
- (IBAction)tecla4a:(id)sender;
- (IBAction)tecla4b:(id)sender;

@property Nota *nota4c;
@property Nota *nota4d;
@property Nota *nota4e;
@property Nota *nota4f;
@property Nota *nota4g;
@property Nota *nota4a;
@property Nota *nota4b;



///////5
- (IBAction)tecla5c:(id)sender;
- (IBAction)tecla5d:(id)sender;
- (IBAction)tecla5e:(id)sender;
- (IBAction)tecla5f:(id)sender;
- (IBAction)tecla5g:(id)sender;
- (IBAction)tecla5a:(id)sender;


@property Nota *nota5c;
@property Nota *nota5d;
@property Nota *nota5e;
@property Nota *nota5f;
@property Nota *nota5g;
@property Nota *nota5a;
@property Nota *nota5b;




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



// Insttrumento
@property NSString *nomeInstrumento;

- (IBAction)btnTelefone:(id)sender;
- (IBAction)btnPiano:(id)sender;
- (IBAction)btnFlauta:(id)sender;
- (IBAction)btnViolao:(id)sender;
- (IBAction)btnSaxfone:(id)sender;
- (IBAction)btnGuitarra:(id)sender;
- (IBAction)btnTambor:(id)sender;
- (IBAction)btnOrgao:(id)sender;
- (IBAction)btnAgogo:(id)sender;
- (IBAction)btnBanjo:(id)sender;
- (IBAction)btnTrompete:(id)sender;
- (IBAction)btnXilofone:(id)sender;





@end



