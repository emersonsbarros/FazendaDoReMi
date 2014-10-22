//
//  MenuViewController.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 26/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Fonte padrão
    [[UILabel appearance] setFont:[UIFont fontWithName:@"Kronika" size:17.0]];
    //Classe recebe navigation controller pai
    [GerenciadorNavigationController sharedManager].controladorApp = self.navigationController;
    
    //Mascote
    [[GerenciadorComponenteView sharedManager]addComponentesMascote:self:0:200:@"zecao"];
    [[MascoteViewController sharedManager]executaSomMascote:@"BemVindoFazenda":2.0];
    
       
    [self animacoesIntro];

}


- (void)viewDidDisappear:(BOOL)animated {
    
    [[GerenciadorComponenteView sharedManager]finalizaExercicio:self];
}


-(void)animacoesIntro{
    
    [self animacaoNuvem];

    [self animacaoPorteira];
}


-(void)animacaoNuvem{
    
    [[GerenciadorAnimacoes sharedManager]animacaoMoverLugar:self.nuvemDireita:@"120":@"INFINITY":@"YES":@"-1224":@"40"];
    [[GerenciadorAnimacoes sharedManager]animacaoMoverLugar:self.nuvemEsquerda:@"120":@"INFINITY":@"YES":@"1480":@"40"];
    
}

-(void)animacaoBotoes{
    
//    [[GerenciadorAnimacoes sharedManager]animacaoOpacidade:self.btoEstudio:@""1.0:1:NO:NO];
//    [[GerenciadorAnimacoes sharedManager]animacaoOpacidade:self.btoJogos:1.0:1:NO:NO];
//    [[GerenciadorAnimacoes sharedManager]animacaoOpacidade:self.btoJornada:1.0:1:NO:NO];
    
}


-(void)animacaoPorteira{
    
    UIImage *image1 = [UIImage imageNamed:@"porteira-1.png"];
    UIImage *image2 = [UIImage imageNamed:@"porteira-2.png"];
    UIImage *image3 = [UIImage imageNamed:@"porteira-3.png"];
    UIImage *image4 = [UIImage imageNamed:@"porteira-4.png"];
    UIImage *image5 = [UIImage imageNamed:@"porteira-5.png"];

    NSArray *imageArray = [NSArray arrayWithObjects:image1, image2, image3, image4, image5, nil];
    
    //[[GerenciadorAnimacoes sharedManager]animacaoSprite:self.porteira :imageArray :1 :1 :NO :NO :2];
    
    [self performSelector:@selector(animacaoBotoes) withObject:NULL afterDelay:5];
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    [[MascoteViewController sharedManager]colocaAnimacaoMascote:@"ZecaoTchau"];
    
}




@end
