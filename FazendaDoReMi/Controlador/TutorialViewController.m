//
//  TutorialViewController.m
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 30/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "TutorialViewController.h"

@interface TutorialViewController ()

@end

@implementation TutorialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self limparDados];
    
    self.result = @"vini";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnTodos:(id)sender {
    [[GerenciadorUsuario sharedManager]retornaTodosUsuarios];
    [[GerenciadorUsuario sharedManager]retornaNumeroUsuarios];
}

- (IBAction)btnDeletar:(id)sender {
    [[GerenciadorUsuario sharedManager]deletarUsuario:self.txtCampoNome.text];
}

- (IBAction)btnAtualizar:(id)sender {
    [[GerenciadorUsuario sharedManager]atualizarNomeUsuario:@"vini":self.txtCampoNome.text];
}

- (IBAction)btnCadastrarUsuario:(id)sender {
    UsuarioAplicativo *user = [[UsuarioAplicativo alloc]init];
    user.nome = self.txtCampoNome.text;
    [[GerenciadorUsuario sharedManager]cadastrarUsuario:user];
}

- (IBAction)btnPesquisar:(id)sender {
    [[GerenciadorUsuario sharedManager]retornaUsuario:self.txtCampoNome.text];
}

-(void)limparDados{
    [[GerenciadorUsuario sharedManager]limparDadosBanco];
}




@end
