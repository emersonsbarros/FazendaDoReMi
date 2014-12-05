//
//  TutorialViewController.h
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 30/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GerenciadorUsuario.h"
#import "UsuarioAplicativo.h"
#import "GerenciadorDeAula.h"

@interface TutorialViewController : UIViewController

- (IBAction)btnTodos:(id)sender;
- (IBAction)btnDeletar:(id)sender;
- (IBAction)btnAtualizar:(id)sender;
- (IBAction)btnCadastrarUsuario:(id)sender;
- (IBAction)btnPesquisar:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *txtCampoNome;

@property NSString *result;


@property (weak, nonatomic) IBOutlet UIView *viewPrincipal;

@end
