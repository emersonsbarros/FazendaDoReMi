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


-(id)init{
    self = [super init];
    
    if(self){
       
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

//Singleton
+(ComposicaoPartituraViewController*)sharedManager{
    static ComposicaoPartituraViewController *gerenciadorDeItem = nil;
    
    if(!gerenciadorDeItem){
        gerenciadorDeItem = [[super allocWithZone: nil] init];
    }
    return gerenciadorDeItem;
}

/////////////////// VIEWCONTROLLER ///////////////////

- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    [[Sinfonia sharedManager]trocaInstrumentoESoundBank];
    [EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura = @"Piano";
    
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Add componentes da Tela Edicao
    [[GerenciadorComponenteView sharedManager]addComponentesBarraMenuNotasPausa:self:NO];
    [[GerenciadorComponenteView sharedManager]addComponentesPlayerEdicao:self:830:670];
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoVoltar:self:0:-8];
    [[GerenciadorComponenteView sharedManager]addComponentesEscolhaInstrumentoPartitura:self:self.imgFundo:self.imgFundoSecundario];
    
    [self.view bringSubviewToFront:self.viewTelaCarregamento];
    
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



/////////////////// METODOS AUXILIARES ///////////////////

-(void)desapareceTelaCarregamento{
    [[Sinfonia sharedManager]trocaInstrumentoESoundBank];
    self.viewTelaCarregamento.hidden = YES;
}

-(void)chamaTelaCarregamento{
    self.viewTelaCarregamento.hidden = NO;
    [self performSelector:@selector(desapareceTelaCarregamento) withObject:nil afterDelay:4.1];
}



@end
