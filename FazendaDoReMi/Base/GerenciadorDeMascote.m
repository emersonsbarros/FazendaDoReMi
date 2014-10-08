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


-(void)instanciaMascoteCachorro{
////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //caracteristicas basicas do Mascote
    Mascote *mascoteCachorro = [[Mascote alloc]init];
    mascoteCachorro.nome = @"zecao";
    
////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //Cria uma lista de sprites pra ele
    SpriteMascote *spriteTchau = [CAKeyframeAnimation animationWithKeyPath:@"chau"];
    
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
    
    mascoteCachorro.animationImages = listaImagens;
    
    spriteTchau.calculationMode = kCAAnimationDiscrete;
    spriteTchau.autoreverses = NO;
    spriteTchau.duration = 1;
    spriteTchau.repeatCount = 1;
    spriteTchau.beginTime = CACurrentMediaTime() + 2;
    spriteTchau.fillMode = kCAFillModeForwards;
    spriteTchau.removedOnCompletion = NO;
    spriteTchau.additive = NO;
    spriteTchau.values = [self animationCGImagesArray:mascoteCachorro];
    
////////////////////////////////////////////////////////////////////////////////////////////////////
    
    [mascoteCachorro.listaDeSprites addObject:spriteTchau];
    
////////////////////////////////////////////////////////////////////////////////////////////////////
    
    [self.listaDeMascotes addObject:mascoteCachorro];
    
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
