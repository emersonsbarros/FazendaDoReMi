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

//Cria Itens
-(void)instanciaItens{
    
    [self addItemPiano];
    [self addItemXilofone];
    [self addItemFlauta];
    [self addItemTambor];
    [self addItemViolao];
    [self addItemSaxfone];
    [self addItemViolino];
    [self addItemChocalho];
    
    [self addItemFlorRocha];
    [self addItemFlorRosa];
    
    [self addItemQuadroZecao];
    
}

//Cria Piano
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


//Cria xilofone
-(void)addItemXilofone{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"xilofone";
    item.image = [UIImage imageNamed:@"xilofone.png"];
    
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


//Cria Flauta
-(void)addItemFlauta{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"flauta";
    item.image = [UIImage imageNamed:@"flauta.png"];
    
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


//Cria Violao
-(void)addItemViolao{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"violao";
    item.image = [UIImage imageNamed:@"violao.png"];
    
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


//Cria tambor
-(void)addItemTambor{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"tambor";
    item.image = [UIImage imageNamed:@"tambor.png"];
    
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


//Cria chocalho
-(void)addItemChocalho{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"chocalho";
    item.image = [UIImage imageNamed:@"chocalho.png"];
    
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


//Cria saxfone
-(void)addItemSaxfone{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"saxfone";
    item.image = [UIImage imageNamed:@"saxfone.png"];
    
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


//Cria Violino
-(void)addItemViolino{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"violino";
    item.image = [UIImage imageNamed:@"violino.png"];
    
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

//Cria Flor Rocha
-(void)addItemFlorRocha{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"florRocha";
    item.image = [UIImage imageNamed:@"florRocha.png"];
    
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

//Cria Flor Rosa
-(void)addItemFlorRosa{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"florRosa";
    item.image = [UIImage imageNamed:@"florRosa.png"];
    
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


//Cria Quadro Zecao
-(void)addItemQuadroZecao{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"quadroZecao";
    item.image = [UIImage imageNamed:@"quadroZecao.png"];
    
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



@end
