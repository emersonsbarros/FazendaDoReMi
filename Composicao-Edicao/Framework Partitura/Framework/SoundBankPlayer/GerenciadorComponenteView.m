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
-(void)addComponentesEscolhaInstrumentoPartitura:(UIViewController*)viewAtual{
    
    ListaInstrumentoViewController *bar = [[ListaInstrumentoViewController alloc]init];
    bar.view.frame = CGRectMake(120, 640, bar.view.frame.size.width,bar.view.frame.size.height);
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



////////////////////////// EXERCICIOS ////////////////////////////////////

-(void)addComponentesBotaoVoltaMapa:(UIViewController*)viewAtual{
    BotaoVoltarMapaViewController *bar = [[BotaoVoltarMapaViewController alloc]init];
    bar.view.frame = CGRectMake(10,10, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}


-(void)addComponentesMascote:(UIViewController*)viewAtual :(float)posX :(float)posY :(NSString*)nomeMascote{
    MascoteViewController *bar = [[MascoteViewController alloc]initMascote:nomeMascote];
    bar.view.frame = CGRectMake(posX,posY, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}

////////////////////////// Instrumentos ////////////////////////////////////

-(void)addComponentesPiano:(UIViewController*)viewAtual :(float)posX :(float)posY{
    PianoViewController *bar = [[PianoViewController alloc]init];
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
        // [img removeFromSuperview];
    }
    
    //    for(UIViewController *img in contr.childViewControllers){
    //        [img removeFromParentViewController];
    //    }
    //
    //
    //    [contr.view removeFromSuperview];
    //    [contr removeFromParentViewController];
    //    [contr didMoveToParentViewController:nil];
    //    contr = nil;
    
    
}

@end



