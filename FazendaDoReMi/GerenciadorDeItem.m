//
//  GerenciadorDeItem.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "GerenciadorDeItem.h"

@implementation GerenciadorDeItem

-(id)init{
    self = [super init];
    
    if(self){
        self.listaDeItens = [[NSMutableArray alloc] init];
        [self instanciaItens];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

//Singleton
+(GerenciadorDeItem*)sharedManager{
    static GerenciadorDeItem *gerenciadorDeItem = nil;
    
    if(!gerenciadorDeItem){
        gerenciadorDeItem = [[super allocWithZone: nil] init];
    }
    return gerenciadorDeItem;
}


-(void)instanciaItens{
    
    [self addItemPiano];
    [self addItemXilofone];
    [self addItemFlauta];
    [self addItemTambor];
    [self addItemViolao];
    
}


-(void)addItemPiano{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"piano";
    item.image = [UIImage imageNamed:@"piano.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"somPianoAcorde";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"somPiano" ofType:@"wav"]];
    [item.listaSonsURL addObject:somitem];
    
    
    //Cria sprite(somente imagens)
    SpriteItem *itemsprite = [[SpriteItem alloc]init];
    itemsprite.nomeAnimacao = @"pianoTocando";
    UIImage *img1 = [UIImage imageNamed:@"piano.png"];
    UIImage *img2 = [UIImage imageNamed:@"piano2.png"];
    [itemsprite.listaImagens addObject:img1];
    [itemsprite.listaImagens addObject:img2];
    [item.listaSprites addObject:itemsprite];
    
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
    
}

-(void)addItemXilofone{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"xilofone";
    item.image = [UIImage imageNamed:@"piano.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"somXilofoneAcorde";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"somPiano" ofType:@"wav"]];
    [item.listaSonsURL addObject:somitem];
    
    
    //Cria sprite(somente imagens)
    SpriteItem *itemsprite = [[SpriteItem alloc]init];
    itemsprite.nomeAnimacao = @"xilofoneTocando";
    UIImage *img1 = [UIImage imageNamed:@"piano.png"];
    UIImage *img2 = [UIImage imageNamed:@"piano2.png"];
    [itemsprite.listaImagens addObject:img1];
    [itemsprite.listaImagens addObject:img2];
    [item.listaSprites addObject:itemsprite];
    
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
    
}

-(void)addItemFlauta{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"flauta";
    item.image = [UIImage imageNamed:@"piano.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"somFlautaAcorde";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"somPiano" ofType:@"wav"]];
    [item.listaSonsURL addObject:somitem];
    
    
    //Cria sprite(somente imagens)
    SpriteItem *itemsprite = [[SpriteItem alloc]init];
    itemsprite.nomeAnimacao = @"flautaTocando";
    UIImage *img1 = [UIImage imageNamed:@"piano.png"];
    UIImage *img2 = [UIImage imageNamed:@"piano2.png"];
    [itemsprite.listaImagens addObject:img1];
    [itemsprite.listaImagens addObject:img2];
    [item.listaSprites addObject:itemsprite];
    
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
    
}

-(void)addItemViolao{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"violao";
    item.image = [UIImage imageNamed:@"piano.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"somViolaoAcorde";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"somPiano" ofType:@"wav"]];
    [item.listaSonsURL addObject:somitem];
    
    
    //Cria sprite(somente imagens)
    SpriteItem *itemsprite = [[SpriteItem alloc]init];
    itemsprite.nomeAnimacao = @"violaoTocando";
    UIImage *img1 = [UIImage imageNamed:@"piano.png"];
    UIImage *img2 = [UIImage imageNamed:@"piano2.png"];
    [itemsprite.listaImagens addObject:img1];
    [itemsprite.listaImagens addObject:img2];
    [item.listaSprites addObject:itemsprite];
    
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
    
}

-(void)addItemTambor{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"tambor";
    item.image = [UIImage imageNamed:@"piano.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"somTamborAcorde";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"somPiano" ofType:@"wav"]];
    [item.listaSonsURL addObject:somitem];
    
    
    //Cria sprite(somente imagens)
    SpriteItem *itemsprite = [[SpriteItem alloc]init];
    itemsprite.nomeAnimacao = @"tamborTocando";
    UIImage *img1 = [UIImage imageNamed:@"piano.png"];
    UIImage *img2 = [UIImage imageNamed:@"piano2.png"];
    [itemsprite.listaImagens addObject:img1];
    [itemsprite.listaImagens addObject:img2];
    [item.listaSprites addObject:itemsprite];
    
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
    
}

/////////////////////// METODOS AUXILIARES ///////////////////////


-(void)retornaItem:(NSString*)nome :(Item*)viewContainer :(NSString*)nomeGesture{
    
    //Procura o item na lista
    for (Item *item in self.listaDeItens) {
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
    
    [self addGestureItem:nomeGesture :viewContainer];
    
}

-(void)addGestureItem:(NSString*)nomeGesture :(Item*)viewContainer{
    
    if([nomeGesture isEqualToString:@"gestureTap"]){
        GestureItem *gesture = [[GestureItem alloc]initWithTarget:self action:@selector(acaoToqueObjeto:)];
        gesture.numberOfTapsRequired = 1;
        gesture.numberOfTouchesRequired = 1;
        gesture.item = viewContainer;
        viewContainer.userInteractionEnabled = YES;
        [viewContainer addGestureRecognizer:gesture];
        
    }else if([nomeGesture isEqualToString:@"gestureLong"]){
       
        
    }else if([nomeGesture isEqualToString:@"gesturePinch"]){
        
        
    }else if([nomeGesture isEqualToString:@"gestureRotation"]){
        
        
    }else if([nomeGesture isEqualToString:@"gestureSwipe"]){
       
        
    }else if([nomeGesture isEqualToString:@"gesturePan"]){
        
        
    }else{
        
        
    }
}

-(void)tocarSomItem:(GestureItem*)gestureItem{
    SomItem *somItem = gestureItem.item.listaSonsURL.firstObject;
    [[GerenciadorAudio sharedManager]playAudio:somItem.caminhoAudio];
}

-(void)alteraEstadoPressionado:(GestureItem*)gestureItem{
    gestureItem.item.estadoPressionado = YES;
}

-(void)acaoToqueObjeto:(GestureItem*)gestureItem{
    
    
    [[GerenciadorAnimacoes sharedManager]animacaozoomImagem:gestureItem.item];
    
}

@end
