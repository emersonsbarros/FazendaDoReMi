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

@interface PianoViewController : UIViewController



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


@end
