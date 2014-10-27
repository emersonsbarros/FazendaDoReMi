//
//  InstrumentoViewController.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 23/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GerenciadorComponenteView.h"
#import "ComponenteScrollEdicao.h"
#import "DesenhaPartituraEdicao.h"
#import "GerenciadorNavigationController.h"

@interface InstrumentoViewController : UIViewController <UIScrollViewDelegate>



@property (weak, nonatomic) IBOutlet UIScrollView *scrollPartitura;
@property UITapGestureRecognizer *gesture;

@end
