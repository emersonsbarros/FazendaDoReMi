//
//  EfeitoComponeteView.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 12/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "GerenciadorComponenteView.h"

@implementation GerenciadorComponenteView


//////////////////Singleton
+(GerenciadorComponenteView*)sharedManager{
    static GerenciadorComponenteView *mascote = nil;
    if(!mascote){
        mascote = [[super allocWithZone:nil] init];
    }
    return mascote;
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




////////////////////////// LEITURA E EDICAO ////////////////////////////////////


-(void)addComponentesPlayerPartitura:(UIViewController*)viewAtual :(float)posX :(float)posY{
    
    PlayerPartituraEdicaoViewController *bar = [[PlayerPartituraEdicaoViewController alloc]init];
    bar.view.frame = CGRectMake(posX, posY, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
    //bar.view.frame = CGRectMake(460, 670, bar.view.frame.size.width,bar.view.frame.size.height);
}


//barra de escolha partitura
-(void)addComponentesEscolhaInstrumentoPartitura:(UIViewController*)viewAtual :(UIImageView*)imgFundo :(UIImageView*)imgFundoSecundario{
    
    ListaInstrumentoViewController *bar = [[ListaInstrumentoViewController alloc]init];
    bar.view.frame = CGRectMake(50, 640, bar.view.frame.size.width,bar.view.frame.size.height);
    [[GerenciadorBotaoInstrumento sharedManager] recebeImagensView:imgFundo :imgFundoSecundario];
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
    
}


//barra de menu de pausar e notas
-(void)addComponentesBarraMenuNotasPausa:(UIViewController*)viewAtual :(BOOL)estado{
    
    BarraNotasPausasViewController *bar = [[BarraNotasPausasViewController alloc]init];
    if(estado)bar.aux = YES;
    bar.view.frame = CGRectMake(101,5, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}


//barra de player (play,limpar)
-(void)addComponentesPlayerEdicao:(UIViewController*)viewAtual :(float)posX :(float)posY{
    
    PlayerPartituraEdicaoViewController *bar = [[PlayerPartituraEdicaoViewController alloc]init];
    bar.view.frame = CGRectMake(posX,posY, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}


//barra de player (play,limpar)
-(void)addComponentesBotaoVoltar:(UIViewController*)viewAtual :(float)posX :(float)posY{
    
    BotaoVoltarViewController *bar = [[BotaoVoltarViewController alloc]init];
    bar.view.frame = CGRectMake(posX,posY, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}


////////////////////////// EXERCICIOS ////////////////////////////////////

-(void)addComponentesBotaoPausaAula:(UIViewController*)viewAtual{
    BotaoPausaAulaViewController *bar = [[BotaoPausaAulaViewController alloc]init];
    bar.view.frame = CGRectMake(10,700, bar.view.frame.size.width, bar.view.frame.size.height);
    
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}

-(void)addComponentesBotaoPausaJogo:(UIViewController*)viewAtual{
    BotaoPausaJogoViewController *bar = [[BotaoPausaJogoViewController alloc]init];
    bar.view.frame = CGRectMake(10,700, bar.view.frame.size.width, bar.view.frame.size.height);
    
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}

-(void)addComponentesMascote:(UIViewController*)viewAtual :(float)posX :(float)posY :(NSString*)nomeMascote{
    MascoteViewController *bar = [[MascoteViewController alloc]initMascote:nomeMascote];
    bar.view.frame = CGRectMake(posX,posY, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}

-(void)addComponentesMenuPausaJogo:(UIViewController*)viewAtual :(BOOL)estagoMenu :(int)pontuacao{
    //estado menu --- > Yes - menu de pause | No - menu de gameOver
    MenuPausaJogoViewController *pausaMenu = [[MenuPausaJogoViewController alloc]init];
    pausaMenu.pontuacao = pontuacao;
    
    if(estagoMenu){
        pausaMenu.estadoMenu = YES;
    }else {
        pausaMenu.estadoMenu = NO;
    }
    
    pausaMenu.view.frame = CGRectMake(viewAtual.view.frame.origin.x, viewAtual.view.frame.origin.y, pausaMenu.view.frame.size.width, pausaMenu.view.frame.size.height);
    [viewAtual addChildViewController: pausaMenu];
    [viewAtual.view addSubview: pausaMenu.view];
}

-(void)addComponentesMenuPausa:(UIViewController*)viewAtual{
    MenuPausaAulaViewController *pausaMenu = [[MenuPausaAulaViewController alloc]init];
    pausaMenu.view.frame = CGRectMake(viewAtual.view.frame.origin.x, viewAtual.view.frame.origin.y, pausaMenu.view.frame.size.width, pausaMenu.view.frame.size.height);
    
    [viewAtual addChildViewController: pausaMenu];
    [viewAtual.view addSubview: pausaMenu.view];
}

////////////////////////// Instrumentos ////////////////////////////////////

-(void)addComponentesPiano:(UIViewController*)viewAtual :(float)posX :(float)posY{
    PianoVirtualViewController *bar = [[PianoVirtualViewController alloc]init];
    bar.view.frame = CGRectMake(posX,posY, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}

-(void)addComponentesTeclado:(UIViewController*)viewAtual :(float)posX :(float)posY{
    TecladoViewController *bar = [[TecladoViewController alloc]init];
    bar.view.frame = CGRectMake(posX,posY, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}


-(void)addComponentesXilofone:(UIViewController*)viewAtual :(float)posX :(float)posY{
    XilofoneVirtualViewController *bar = [[XilofoneVirtualViewController alloc]init];
    bar.view.frame = CGRectMake(posX,posY, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}

////////////////////////// AUXILIARES ////////////////////////////////////

//Finaliza exercicios
-(void)finalizaExercicio:(UIViewController*)contr{
    
    for(UIView *img in contr.view.subviews){
        img.alpha = 1;
        [img.layer removeAllAnimations];
    }

    
}

@end



