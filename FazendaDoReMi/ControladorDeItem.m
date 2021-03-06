//
//  ControladorDeItem.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 13/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//
//[[GerenciadorAnimacoes sharedManager]animacaoSpriteEspecifica:self.imgTeste:@"pianoTocando":4:YES:NO:2.0];



#import "ControladorDeItem.h"

@implementation ControladorDeItem


-(id)init{
    self = [super init];
    
    if(self){
        self.listaObjetosPressionados = [[NSMutableArray alloc]init];
        self.contadorItensPressionados = 0;
        self.numeroDeJogadasAtual = 0;
        self.numeroLimiteDeJogadas = 0;
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

//Singleton
+(ControladorDeItem*)sharedManager{
    static ControladorDeItem *gerenciadorDeItem = nil;
    
    if(!gerenciadorDeItem){
        gerenciadorDeItem = [[super allocWithZone: nil] init];
    }
    return gerenciadorDeItem;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(void)chamaVerificadorDeJogo :(int)numeroLimiteDeJogadas :(int)numeroDeJogadasAtual{
//    
//    self.aulaFinalizada = false;
//    self.numeroLimiteDeJogadas = numeroLimiteDeJogadas;
//    self.numeroDeJogadasAtual = numeroDeJogadasAtual;
//    
//    
//    if(self.numeroLimiteDeJogadas == self.numeroDeJogadasAtual){
//        self.aulaFinalizada = true;
//        self.numeroDeJogadasAtual = 0;
//        self.numeroLimiteDeJogadas = 0;
//        [self.timerVerificadorJogoFinalizado invalidate];
//        
//        [[GerenciadorAudio sharedManager] ajustaVolume: 0];
//        [[GerenciadorComponenteView sharedManager]addComponentesMenuPausa: [GerenciadorNavigationController sharedManager].controladorApp.visibleViewController];
//
//    }
}


///////////////////////////////////////////////////////////////////////////// ITENS PRESSIONADOS
-(void)chamaVerificador:(NSArray*)listaItens{
    
    self.aulaFinalizada = false;
    
    self.timerVerificadorItemPressionado =  [NSTimer scheduledTimerWithTimeInterval: 0.5
                                                                             target: self
                                                                           selector: @selector(verificadorEstadoItemPressionado)
                                                                           userInfo: nil
                                                                            repeats: YES];
    
    for(Item *itemPressionado in listaItens){
        [self.listaObjetosPressionados addObject: itemPressionado];
    }
    
}

-(void)verificadorEstadoItemPressionado{
    self.contadorItensPressionados =0;
    
    for(Item *itemPressionado in self.listaObjetosPressionados){
        if(itemPressionado.estadoPressionado == true){
            self.contadorItensPressionados += 1;
        }
    }
    
    
    if(self.contadorItensPressionados == self.listaObjetosPressionados.count){
        
        self.aulaFinalizada = true;
        
        [[GerenciadorAudio sharedManager] ajustaVolume: 0];
        [[GerenciadorComponenteView sharedManager]addComponentesMenuPausa: [GerenciadorNavigationController sharedManager].controladorApp.visibleViewController];
        
        NSLog(@"Todos Pressionados");
        [self.listaObjetosPressionados removeAllObjects];
        self.contadorItensPressionados = 0;
        [self.timerVerificadorItemPressionado invalidate];
    }
    
}


//associa o item do banco a view passada e chama o gesture para ser inserido
-(void)retornaItem:(NSString*)nome :(Item*)viewContainer :(NSString*)nomeGesture{
    
    //Procura o item na lista
    for (Item *item in [GerenciadorDeItem sharedManager].listaDeItens) {
        if ([item.nome isEqualToString: nome]) {
            item.frame = viewContainer.frame;
            viewContainer.image = item.image;
            viewContainer.nome = item.nome;
            viewContainer.listaSonsURL = item.listaSonsURL;
            viewContainer.listaSprites = item.listaSprites;
            viewContainer.estadoPressionado = item.estadoPressionado;
            //return item;
        }
    }
    
    [[GerenciadorMetodo sharedManager] addGestureItem:nomeGesture :viewContainer];
    
}


//associa o item do banco a view passada e chama o gesture pan
-(void)retornaItemGesture:(NSString*)nome :(Item*)viewContainer :(Item*)viewColidir  :(NSString*)nomeGesture{
    
    //Procura o item na lista
    for (Item *item in [GerenciadorDeItem sharedManager].listaDeItens) {
        if ([item.nome isEqualToString: nome]) {
            item.frame = viewContainer.frame;
            viewContainer.image = item.image;
            viewContainer.nome = item.nome;
            viewContainer.listaSonsURL = item.listaSonsURL;
            viewContainer.listaSprites = item.listaSprites;
            viewContainer.estadoPressionado = item.estadoPressionado;
            //return item;
        }
    }
    
    [[GerenciadorMetodo sharedManager] addGestureItemPan:nomeGesture :viewContainer :viewColidir];
    
}

@end
