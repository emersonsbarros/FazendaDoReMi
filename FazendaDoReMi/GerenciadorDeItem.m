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
    
    //SALA
    [self addItemChocalho];
    [self addItemFlauta];
    [self addItemPiano];
    [self addItemSaxfone];
    [self addItemTambor];
    [self addItemViolao];
    [self addItemViolino];
    [self addItemXilofone];
    
    [self addItemFlorRocha];
    [self addItemFlorRosa];
    [self addItemQuadroZecao];
    
    //COZINHA
    [self addItemBatedeira];
    [self addItemFrigideira];
    [self addItemLataDeRefrigerante];
    [self addItemLiquidificador];
    [self addItemMicroondas];
    [self addItemTabuaDeLegumes];
    [self addItemTalheres];
    [self addItemTorradeira];
    
    //BRINQUEDOTECA
    [self addItemTocaTreco];
    [self addItemTocaTrecoAnimado];
    
    [self addItemBola];
    [self addItemCaixaDeMusica];
    [self addItemCarro];
    [self addItemGuitarra];
    [self addItemHelicoptero];
    [self addItemRelogio];
    [self addItemRobo];
    [self addItemSkate];
    [self addItemTrem];
    [self addItemUrsoPelucia];
    
    //GALINHEIRO
    [self addItemGalinhaAmarela];
    [self addItemGaloAzul];
    [self addItemGalinhaLaranja];
    [self addItemGalinhaRosa];
    [self addItemGalinhaRoxa];
    [self addItemGaloVerde];
    
    //VIVEIRO
    [self addItemPassaroAmarelo];
    [self addItemPassaroAzul];
    [self addItemPassaroLaranja];
    [self addItemPassaroRosa];
    [self addItemPassaroRoxo];
    [self addItemPassaroVerde];
    
    //QUARTO
    [self addItemGramofone];
    [self addItemDiscoAzul];
    [self addItemDiscoMarron];
    [self addItemDiscoVerde];
    
}

//Cria Piano
-(void)addItemPiano{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"piano";
    item.image = [UIImage imageNamed:@"piano.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"piano";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"piano" ofType:@"mp3"]];
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
    somitem.nomeSom = @"xilofone";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"xilofone" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Cria sprite(somente imagens)
    SpriteItem *itemsprite = [[SpriteItem alloc]init];
    itemsprite.nomeAnimacao = @"xilofoneTocando";
    UIImage *img1 = [UIImage imageNamed:@"xilofone1.png"];
    UIImage *img2 = [UIImage imageNamed:@"xilofone2.png"];
    UIImage *img3 = [UIImage imageNamed:@"xilofone3.png"];
    UIImage *img4 = [UIImage imageNamed:@"xilofone4.png"];
    UIImage *img5 = [UIImage imageNamed:@"xilofone5.png"];
    [itemsprite.listaImagens addObject: img1];
    [itemsprite.listaImagens addObject: img2];
    [itemsprite.listaImagens addObject: img3];
    [itemsprite.listaImagens addObject: img4];
    [itemsprite.listaImagens addObject: img5];
    [item.listaSprites addObject: itemsprite];
    
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
    somitem.nomeSom = @"flauta";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"flauta" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
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
    somitem.nomeSom = @"violao";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"violao" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
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
    somitem.nomeSom = @"tambor";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"tambor" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somitem];
    
    
    //Cria sprite(somente imagens)
    SpriteItem *itemsprite = [[SpriteItem alloc]init];
    itemsprite.nomeAnimacao = @"tamborTocando";
    UIImage *img1 = [UIImage imageNamed:@"tambor1.png"];
    UIImage *img2 = [UIImage imageNamed:@"tambor2.png"];
    [itemsprite.listaImagens addObject: img1];
    [itemsprite.listaImagens addObject: img2];
    [item.listaSprites addObject: itemsprite];
    
    
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
    somitem.nomeSom = @"chocalho";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"chocalho" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somitem];
    
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
    
}


//Cria saxfone
-(void)addItemSaxfone{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"saxofone";
    item.image = [UIImage imageNamed:@"saxofone.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"saxofone";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"saxofone" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Cria sprite(somente imagens)
    SpriteItem *itemsprite = [[SpriteItem alloc]init];
    itemsprite.nomeAnimacao = @"saxofoneTocando";
    UIImage *img1 = [UIImage imageNamed:@"saxofone1.png"];
    UIImage *img2 = [UIImage imageNamed:@"saxofone2.png"];
    UIImage *img3 = [UIImage imageNamed:@"saxofone3.png"];
    UIImage *img4 = [UIImage imageNamed:@"saxofone4.png"];
    UIImage *img5 = [UIImage imageNamed:@"saxofone5.png"];
    UIImage *img6 = [UIImage imageNamed:@"saxofone6.png"];
    [itemsprite.listaImagens addObject: img1];
    [itemsprite.listaImagens addObject: img2];
    [itemsprite.listaImagens addObject: img3];
    [itemsprite.listaImagens addObject: img4];
    [itemsprite.listaImagens addObject: img5];
    [itemsprite.listaImagens addObject: img6];
    [item.listaSprites addObject: itemsprite];
    
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
    somitem.nomeSom = @"violino";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"violino" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
    
}

//Cria Flor Rocha
-(void)addItemFlorRocha{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"florRocha";
    item.image = [UIImage imageNamed:@"florRocha.png"];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
    
}

//Cria Flor Rosa
-(void)addItemFlorRosa{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"florRosa";
    item.image = [UIImage imageNamed:@"florRosa.png"];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
    
}


//Cria Quadro Zecao
-(void)addItemQuadroZecao{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"quadroZecao";
    item.image = [UIImage imageNamed:@"quadroZecao.png"];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
    
}

//Cria Liquidificador
-(void)addItemLiquidificador{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"liquidificador";
    item.image = [UIImage imageNamed:@"liquidificador.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"liquidificador";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"liquidificador" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Talher
-(void)addItemTalheres{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"talheres";
    item.image = [UIImage imageNamed:@"talheres.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"talheres";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"talheres" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Frigideira
-(void)addItemFrigideira{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"frigideira";
    item.image = [UIImage imageNamed:@"frigideira.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"frigideira";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"frigideira" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Microondas
-(void)addItemMicroondas{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"microondas";
    item.image = [UIImage imageNamed:@"microondas.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"microondas";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"microondas" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Cria sprite(somente imagens)
    SpriteItem *itemsprite = [[SpriteItem alloc]init];
    itemsprite.nomeAnimacao = @"microondasLigado";
    UIImage *img1 = [UIImage imageNamed:@"microondas1.png"];
    UIImage *img2 = [UIImage imageNamed:@"microondas2.png"];
    UIImage *img3 = [UIImage imageNamed:@"microondas3.png"];
    UIImage *img4 = [UIImage imageNamed:@"microondas4.png"];
    [itemsprite.listaImagens addObject: img1];
    [itemsprite.listaImagens addObject: img2];
    [itemsprite.listaImagens addObject: img3];
    [itemsprite.listaImagens addObject: img4];
    
    [item.listaSprites addObject: itemsprite];
    
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Torradeira
-(void)addItemTorradeira{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"torradeira";
    item.image = [UIImage imageNamed:@"torradeira.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"torradeira";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"torradeira" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Batedeira
-(void)addItemBatedeira{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"batedeira";
    item.image = [UIImage imageNamed:@"batedeira.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"batedeira";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"batedeira" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Faca de legume
-(void)addItemTabuaDeLegumes{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"tabuaLegumes";
    item.image = [UIImage imageNamed:@"tabuaLegumes.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"tabuaLegumes";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"tabuaLegumes" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject: item];
}

//Cria Lata de refrigerante
-(void)addItemLataDeRefrigerante{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"latinhaRefri";
    item.image = [UIImage imageNamed:@"latinhaRefri.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"latinhaRefri";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"latinhaRefri" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Gramofone
-(void)addItemGramofone{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"gramofone";
    item.image = [UIImage imageNamed:@"gramofone.png"];
    
    //Cria sprite(somente imagens)
    SpriteItem *itemsprite = [[SpriteItem alloc]init];
    itemsprite.nomeAnimacao = @"gramofoneTocando";
    UIImage *img1 = [UIImage imageNamed:@"gramofone1.png"];
    UIImage *img2 = [UIImage imageNamed:@"gramofone2.png"];
    UIImage *img3 = [UIImage imageNamed:@"gramofone3.png"];
    UIImage *img4 = [UIImage imageNamed:@"gramofone4.png"];
    [itemsprite.listaImagens addObject: img1];
    [itemsprite.listaImagens addObject: img2];
    [itemsprite.listaImagens addObject: img3];
    [itemsprite.listaImagens addObject: img4];
    
    [item.listaSprites addObject: itemsprite];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Disco Azul
-(void)addItemDiscoAzul{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"discoAzul";
    item.image = [UIImage imageNamed:@"discoAzul.png"];
    
    
    //SALA
    //chocalho
    SomItem *somChocalho = [[SomItem alloc]init];
    somChocalho.nomeSom = @"chocalho";
    somChocalho.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"chocalho" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somChocalho];
    
    //flauta
    SomItem *somFlauta = [[SomItem alloc]init];
    somFlauta.nomeSom = @"flauta";
    somFlauta.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"flauta" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somFlauta];
    
    //piano
    SomItem *somPiano = [[SomItem alloc]init];
    somPiano.nomeSom = @"piano";
    somPiano.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"piano" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somPiano];
    
    //saxofone
    SomItem *somSaxofone = [[SomItem alloc]init];
    somSaxofone.nomeSom = @"saxofone";
    somSaxofone.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"saxofone" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somSaxofone];
    
    //tambor
    SomItem *somTambor = [[SomItem alloc]init];
    somTambor.nomeSom = @"tambor";
    somTambor.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"tambor" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somTambor];
    
    //violao
    SomItem *somViolao = [[SomItem alloc]init];
    somViolao.nomeSom = @"violao";
    somViolao.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"violao" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somViolao];
    
    //violino
    SomItem *somViolino = [[SomItem alloc]init];
    somViolino.nomeSom = @"violino";
    somViolino.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"violino" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somViolino];
    
    //xilofone
    SomItem *somXilofone = [[SomItem alloc]init];
    somXilofone.nomeSom = @"xilofone";
    somXilofone.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"xilofone" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somXilofone];
    
    
    //COZINHA
    //batedeira
    SomItem *somBatedeira = [[SomItem alloc]init];
    somBatedeira.nomeSom = @"batedeira";
    somBatedeira.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"batedeira" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somBatedeira];
    
    //frigideira
    SomItem *somFrigideira = [[SomItem alloc]init];
    somFrigideira.nomeSom = @"frigideira";
    somFrigideira.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"frigideira" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somFrigideira];
    
    //latinhaRefri
    SomItem *somLatinhaRefri = [[SomItem alloc]init];
    somLatinhaRefri.nomeSom = @"latinhaRefri";
    somLatinhaRefri.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"latinhaRefri" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somLatinhaRefri];
    
    //liquidificador
    SomItem *somLiquidificador = [[SomItem alloc]init];
    somLiquidificador.nomeSom = @"liquidificador";
    somLiquidificador.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"liquidificador" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somLiquidificador];
    
    //microondas
    SomItem *somMicroondas = [[SomItem alloc]init];
    somMicroondas.nomeSom = @"microondas";
    somMicroondas.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"microondas" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somMicroondas];
    
    //tabuaLegumes
    SomItem *somTabuaLegumes = [[SomItem alloc]init];
    somTabuaLegumes.nomeSom = @"tabuaLegumes";
    somTabuaLegumes.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"tabuaLegumes" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somTabuaLegumes];
    
    //talheres
    SomItem *somTalheres = [[SomItem alloc]init];
    somTalheres.nomeSom = @"talheres";
    somTalheres.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"talheres" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somTalheres];
    
    //torradeira
    SomItem *somTorradeira = [[SomItem alloc]init];
    somTorradeira.nomeSom = @"torradeira";
    somTorradeira.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"torradeira" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somTorradeira];
    
    
    //BRINQUEDOTECA
    //bola
    SomItem *somBola = [[SomItem alloc]init];
    somBola.nomeSom = @"bola";
    somBola.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"bola" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somBola];
    
    //caixaDeMusica
    SomItem *somCaixaDeMusica = [[SomItem alloc]init];
    somCaixaDeMusica.nomeSom = @"caixaDeMusica";
    somCaixaDeMusica.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"caixaDeMusica" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somCaixaDeMusica];
    
    //carro
    SomItem *somCarro = [[SomItem alloc]init];
    somCarro.nomeSom = @"carro";
    somCarro.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"carro" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somCarro];
    
    //guitarra
    SomItem *somGuitarra = [[SomItem alloc]init];
    somGuitarra.nomeSom = @"guitarra";
    somGuitarra.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"guitarra" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somGuitarra];
    
    //helicoptero
    SomItem *somHelicoptero = [[SomItem alloc]init];
    somHelicoptero.nomeSom = @"helicoptero";
    somHelicoptero.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"helicoptero" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somHelicoptero];
    
    //relogio
    SomItem *somRelogio = [[SomItem alloc]init];
    somRelogio.nomeSom = @"relogio";
    somRelogio.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"relogio" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somRelogio];
    
    //robo
    SomItem *somRobo = [[SomItem alloc]init];
    somRobo.nomeSom = @"robo";
    somRobo.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"robo" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somRobo];
    
    //skate
    SomItem *somSkate = [[SomItem alloc]init];
    somSkate.nomeSom = @"skate";
    somSkate.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"skate" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somSkate];
    
    //trem
    SomItem *somTrem = [[SomItem alloc]init];
    somTrem.nomeSom = @"trem";
    somTrem.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"trem" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somTrem];
    
    //ursoPelucia
    SomItem *somUrsoPelucia = [[SomItem alloc]init];
    somUrsoPelucia.nomeSom = @"ursoPelucia";
    somUrsoPelucia.caminhoAudio = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"ursoPelucia" ofType:@"mp3"]];
    [item.listaSonsURL addObject: somUrsoPelucia];
    
    
    //Add Item ao banco
    [self.listaDeItens addObject: item];
}

//Cria Disco Marron
-(void)addItemDiscoMarron{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"discoMarron";
    item.image = [UIImage imageNamed:@"discoMarron.png"];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Disco Verde
-(void)addItemDiscoVerde{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"discoVerde";
    item.image = [UIImage imageNamed:@"discoVerde.png"];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Urso de Pelucia
-(void)addItemUrsoPelucia{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"ursoPelucia";
    item.image = [UIImage imageNamed:@"ursoPelucia.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"ursoPelucia";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"ursoPelucia" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Carro
-(void)addItemCarro{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"carro";
    item.image = [UIImage imageNamed:@"carro.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"carro";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"carro" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Skate
-(void)addItemSkate{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"skate";
    item.image = [UIImage imageNamed:@"skate.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"skate";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"skate" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}


//Cria TocaTreco (PARA COLISÃO)
-(void)addItemTocaTreco{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"tocaTreco";
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria TocaTreco (PARA ANIMAÇÃO)
-(void)addItemTocaTrecoAnimado{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"tocaTrecoAnimado";
    item.image = [UIImage imageNamed:@"tocaTreco.png"];
    
    //Cria sprite(somente imagens)
    SpriteItem *spritePulando = [[SpriteItem alloc]init];
    spritePulando.nomeAnimacao = @"tocaTrecoPulando";
    UIImage *img1 = [UIImage imageNamed:@"tocaTrecoPulando1.png"];
    UIImage *img2 = [UIImage imageNamed:@"tocaTrecoPulando2.png"];
    UIImage *img3 = [UIImage imageNamed:@"tocaTrecoPulando3.png"];
    UIImage *img4 = [UIImage imageNamed:@"tocaTrecoPulando4.png"];
    UIImage *img5 = [UIImage imageNamed:@"tocaTrecoPulando5.png"];
    UIImage *img6 = [UIImage imageNamed:@"tocaTrecoPulando6.png"];
    
    [spritePulando.listaImagens addObject:img1];
    [spritePulando.listaImagens addObject:img2];
    [spritePulando.listaImagens addObject:img3];
    [spritePulando.listaImagens addObject:img4];
    [spritePulando.listaImagens addObject:img5];
    [spritePulando.listaImagens addObject:img6];
    [item.listaSprites addObject: spritePulando];
    
    //Cria sprite(somente imagens)
    SpriteItem *spriteSeta = [[SpriteItem alloc]init];
    spriteSeta.nomeAnimacao = @"tocaTrecoSeta";
    UIImage *img7 = [UIImage imageNamed:@"tocaTrecoSeta1.png"];
    UIImage *img8 = [UIImage imageNamed:@"tocaTrecoSeta2.png"];
    UIImage *img9 = [UIImage imageNamed:@"tocaTrecoSeta3.png"];
    
    [spriteSeta.listaImagens addObject: img7];
    [spriteSeta.listaImagens addObject: img8];
    [spriteSeta.listaImagens addObject: img9];
    [item.listaSprites addObject: spriteSeta];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}


//Cria Relogio
-(void)addItemRelogio{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"relogio";
    item.image = [UIImage imageNamed:@"relogio.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"relogio";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"relogio" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}


//Cria Robo
-(void)addItemRobo{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"robo";
    item.image = [UIImage imageNamed:@"robo.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"robo";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"robo" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}


//Cria Helicoptero
-(void)addItemHelicoptero{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"helicoptero";
    item.image = [UIImage imageNamed:@"helicoptero.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"helicoptero";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"helicoptero" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Guitarra
-(void)addItemGuitarra{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"guitarra";
    item.image = [UIImage imageNamed:@"guitarra.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"guitarra";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"guitarra" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}


//Cria Trem
-(void)addItemTrem{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"trem";
    item.image = [UIImage imageNamed:@"trem.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"trem";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"trem" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Bola
-(void)addItemBola{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"bola";
    item.image = [UIImage imageNamed:@"bola.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"bola";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"bola" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Caixa De Musica
-(void)addItemCaixaDeMusica{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"caixaDeMusica";
    item.image = [UIImage imageNamed:@"caixaDeMusica.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"caixaDeMusica";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"caixaDeMusica" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Galo Verde
-(void)addItemGaloVerde{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"galoVerde";
    item.image = [UIImage imageNamed:@"galoVerde.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"galoVerde";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"galo" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Galinha Laranja
-(void)addItemGalinhaLaranja{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"galinhaLaranja";
    item.image = [UIImage imageNamed:@"galinhaLaranja.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"galinhaLaranja";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"galo" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Galinha Roxa
-(void)addItemGalinhaRoxa{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"galinhaRoxa";
    item.image = [UIImage imageNamed:@"galinhaRoxa.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"galinhaRoxa";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"galo" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Galo Azul
-(void)addItemGaloAzul{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"galoAzul";
    item.image = [UIImage imageNamed:@"galoAzul.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"galoAzul";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"galo" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Galinha Rosa
-(void)addItemGalinhaRosa{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"galinhaRosa";
    item.image = [UIImage imageNamed:@"galinhaRosa.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"galinhaRosa";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"galo" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Galinha Amarela
-(void)addItemGalinhaAmarela{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"galinhaAmarela";
    item.image = [UIImage imageNamed:@"galinhaAmarela.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"galinhaAmarela";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"galo" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Passaro Azul
-(void)addItemPassaroAzul{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"passaroAzul";
    item.image = [UIImage imageNamed:@"passaroAzul.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"passaroAzul";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"passaroAzul" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Passaro Laranja
-(void)addItemPassaroLaranja{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"passaroLaranja";
    item.image = [UIImage imageNamed:@"passaroLaranja.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"passaroLaranja";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"passaroLaranja" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Passaro Rosa
-(void)addItemPassaroRosa{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"passaroRosa";
    item.image = [UIImage imageNamed:@"passaroRosa.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"passaroRosa";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"passaroRosa" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Passaro Verde
-(void)addItemPassaroVerde{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"passaroVerde";
    item.image = [UIImage imageNamed:@"passaroVerde.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"passaroVerde";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"passaroVerde" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}


//Cria Passaro Amarelo
-(void)addItemPassaroAmarelo{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"passaroAmarelo";
    item.image = [UIImage imageNamed:@"passaroAmarelo.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"passaroAmarelo";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"passaroAmarelo" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}

//Cria Passaro Roxo
-(void)addItemPassaroRoxo{
    
    //Cria item
    Item *item = [[Item alloc]init];
    item.nome = @"passaroRoxo";
    item.image = [UIImage imageNamed:@"passaroRoxo.png"];
    
    //Add SOM
    SomItem *somitem = [[SomItem alloc]init];
    somitem.nomeSom = @"passaroRoxo";
    somitem.caminhoAudio=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"passaroRoxo" ofType:@"mp3"]];
    [item.listaSonsURL addObject:somitem];
    
    //Add Item ao banco
    [self.listaDeItens addObject:item];
}


@end
