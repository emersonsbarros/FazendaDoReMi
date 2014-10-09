//
//  GerenciadorDeMascote.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "GerenciadorDeMascote.h"

@implementation GerenciadorDeMascote


-(id)init{
    self = [super init];
    if(self){
        self.listaDeMascotes = [[NSMutableArray alloc]init];
        [self instanciaMascotes];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


//Singleton
+(GerenciadorDeMascote*)sharedManager{
    static GerenciadorDeMascote *gerenciadorDeMascote = nil;
    
    if(!gerenciadorDeMascote){
        gerenciadorDeMascote = [[super allocWithZone: nil] init];
    }
    return gerenciadorDeMascote;
}


-(void)instanciaMascotes{
    [self instanciaMascoteCachorro];
}

////////////////////////////// CACHORRO ////////////////////////////////////////////////

-(void)instanciaMascoteCachorro{

    
    //caracteristicas basicas do Mascote
    Mascote *mascoteCachorro = [[Mascote alloc]init];
    mascoteCachorro.image = [UIImage imageNamed:@"ZECAO10.png"];
    mascoteCachorro.nome = @"zecao";
    
    
    //Animacoes
    [self animacaoZecaoTchau:mascoteCachorro];

    
    
    
    
    //Add Mascotes na lista
    [self.listaDeMascotes addObject:mascoteCachorro];
    
}

-(void)animacaoZecaoTchau:(Mascote*)mascote{
    
    SpriteMascote *spriteTchau = [[SpriteMascote alloc]init];
    spriteTchau.nome = @"ZecaoTchau";
    spriteTchau = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    //spriteTchau.nome = @"ZecaoTchau";
    UIImage *image;
    NSString *nomeImagem;
    NSMutableArray *listaImagens = [[NSMutableArray alloc]init];
    for(int i=1;i<=73;i++){
        if(i<=9){
            nomeImagem = [NSString stringWithFormat:@"%@%d%@",@"ZECAO0",i,@".png"];
        }else{
            nomeImagem = [NSString stringWithFormat:@"%@%d%@",@"ZECAO",i,@".png"];
        }
        
        image = [UIImage imageNamed:nomeImagem];
        [listaImagens addObject:image];
    }
    
    mascote.animationImages = listaImagens;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 5;
    animationGroup.beginTime = CACurrentMediaTime() + 2;
    animationGroup.repeatCount = INFINITY;
    CAMediaTimingFunction *easeOut = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    spriteTchau.calculationMode = kCAAnimationDiscrete;
    spriteTchau.autoreverses = NO;
    spriteTchau.duration = 2.0;
    spriteTchau.repeatCount = 1;
    spriteTchau.timingFunction = easeOut;
    spriteTchau.values = [self animationCGImagesArray: mascote];
    spriteTchau.fillMode = kCAFillModeForwards;
    spriteTchau.removedOnCompletion = YES;
    
    animationGroup.animations = @[spriteTchau];
    
    [mascote.listaDeSprites addObject:animationGroup];

    
}


////////////////////////////////// METODOS AUXILIARES //////////////////////////////////////////////

-(SpriteMascote*)retornaAnimacaoMascote:(Mascote*)mascote :(NSString*)nomeAnimacao{
    
    //Procura o mascote na lista
    for (SpriteMascote *mascoteSprite in mascote.listaDeSprites) {
        if ([mascoteSprite.nome isEqualToString:nomeAnimacao]) {
            return mascoteSprite;
        }
    }
    
    //Se não encontra retorna o primeiro mascote
    return NULL;
}



//Aux que converte para CGImage, unico jeito para dar certo
-(NSArray*)animationCGImagesArray:(UIImageView*)imgAddAnimacao {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[imgAddAnimacao.animationImages count]];
    for (UIImage *image in imgAddAnimacao.animationImages) {
        [array addObject:(id)[image CGImage]];
    }
    return [NSArray arrayWithArray:array];
}

-(Mascote*)retornaMascote:(NSString*)nomeMascote{
    
    //Procura o mascote na lista
    for (Mascote *mascote in self.listaDeMascotes) {
        if ([mascote.nome isEqualToString: nomeMascote]) {
            return mascote;
        }
    }

    //Se não encontra retorna o primeiro mascote
    return self.listaDeMascotes.firstObject;
}

@end
