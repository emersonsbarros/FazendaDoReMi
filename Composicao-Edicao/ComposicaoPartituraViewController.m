//
//  ComposicaoPartituraViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 08/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "ComposicaoPartituraViewController.h"

@interface ComposicaoPartituraViewController ()

@end


@implementation ComposicaoPartituraViewController


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


-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear: animated];

    //Tira o som da partitura caso o usuario saia com a musica tocando
    [[Sinfonia sharedManager]pararPlayerPartitura];
    [Sinfonia sharedManager].estadoBotaoPlay = true;
    [Sinfonia sharedManager].estadoBotaoLimpar = true;
    
    
    for(UIView *view in self.view.subviews){
        [view removeFromSuperview];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"numerp = %d",[GerenciadorNavigationController sharedManager].controladorApp.viewControllers.count);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Add componentes da Tela Edicao
    [[GerenciadorComponenteView sharedManager]addComponentesBarraMenuNotasPausa:self];
    [[GerenciadorComponenteView sharedManager]addComponentesEscolhaInstrumentoPartitura:self];
    [[GerenciadorComponenteView sharedManager]addComponentesPlayerEdicao:self:560:670];

    
    //Manda o UIScrollView para a classe modeladora
    [[ComponenteScrollEdicao sharedManager]recebeScroll:self.scrollEdicao];
    //Desenha a partitura com 10 linhas de pentagrama
    [[DesenhaPartituraEdicao sharedManager]desenhaContornoPartituraParaEdicao:6:YES];
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)testa:(id)sender {
    [[GerenciadorNavigationController sharedManager].controladorApp popViewControllerAnimated:YES];
}



@end
