//
//  PlayerPartituraEdicaoViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 07/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sinfonia.h"
#import "ComponenteScrollEdicao.h"
#import "DesenhaPartituraEdicao.h"

@interface PlayerPartituraEdicaoViewController : UIViewController

//Label para mostrar quantidade de notas inseridas
@property (weak, nonatomic) IBOutlet UILabel *txtQtd;

//timer
@property NSTimer *timerAutualizaQtNotas;

+(PlayerPartituraEdicaoViewController*)sharedManager;



@property (weak, nonatomic) IBOutlet UIButton *lblPlayPartitura;
@property (weak, nonatomic) IBOutlet UIButton *lblLimparPartitura;


@end
