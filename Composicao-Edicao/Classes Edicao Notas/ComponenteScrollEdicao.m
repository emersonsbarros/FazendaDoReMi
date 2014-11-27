//
//  ComponenteScrollEdicao.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 06/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "ComponenteScrollEdicao.h"

#define n64th 0.0620
#define n32th 0.120
#define n16th 0.20
#define eighth 0.4
#define quarter 1.0
#define half 1.5
#define whole 3.5

@implementation ComponenteScrollEdicao

//Sington
+(ComponenteScrollEdicao*)sharedManager{
    static ComponenteScrollEdicao *unicoInstrumento = nil;
    if(!unicoInstrumento){
        unicoInstrumento = [[super allocWithZone:nil]init];
    }
    return unicoInstrumento;
}

-(id)init{
    self = [super init];
    if(self){
        self.tocandoBloqueioInserirNota = YES;
        self.imgVassoura = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"vassoura-01.png"]];
        self.imgVassoura.frame = CGRectMake(950, 150, 212, 278);
        self.imgVassoura.hidden = YES;
    }
    
    return self;
}



+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


//////////////////////////////////////////////////////////////////////

//Add gesture ao scorll view
-(void)addGesturePrintarNotasTela{
    
    self.limiteDeNotas = 50;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addNotaNaTela:)];
    singleTap.numberOfTouchesRequired = 1;
    self.scrollPartitura.userInteractionEnabled = YES;
    [self.scrollPartitura addGestureRecognizer:singleTap];
    
}


//Adiciona nota ao scroll
-(void)addNotaNaTelaInstrumento:(NSValue*)touchPoint{
 
    if(self.tocandoBloqueioInserirNota){
        
        float posx = touchPoint.CGPointValue.x;
        float posy = touchPoint.CGPointValue.y;
        
        
        Nota *not = [[DesenhaPartituraEdicao sharedManager] retornaPosicaoNotaEdicao:posx:posy];
        
        if((not != NULL)&&([DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count <= self.limiteDeNotas)){
            [DesenhaPartituraEdicao sharedManager].notaParaEdicao = not;
            
            listaSons = [[NSMutableArray alloc]init];
            [listaSons addObject:not];
            
            [[Sinfonia sharedManager]tocarUmaNota:listaSons:[EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura];
            
            [[DesenhaPartituraEdicao sharedManager].listaNotasEdicao addObject:not];
            
            for(Nota *img in [DesenhaPartituraEdicao sharedManager].listaNotasEdicao){
                [[Sinfonia sharedManager]desapareceEfeito:img];
            }
            
            [[self scrollPartitura]addSubview:[not imagemNota]];
            
            
            [[self scrollPartitura] setContentSize:CGSizeMake((self.scrollPartitura.bounds.size.width+[DesenhaPartituraEdicao sharedManager].posicaoX)-700, self.scrollPartitura.bounds.size.height)];
            
            if([DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count > 4){
                [[DesenhaPartituraEdicao sharedManager] aumentarLinhasPentagrama];
                CGPoint bottomOffset = CGPointMake(([DesenhaPartituraEdicao sharedManager].posicaoX-600),0);
                [[self scrollPartitura] setContentOffset:bottomOffset animated:YES];
            }
        }else{
            NSLog(@"Passou do limite de notas");
        }

    }
    
}

//Adiciona nota ao scroll
-(void)addNotaNaTela:(id)sender{
    UITapGestureRecognizer *touch = (UITapGestureRecognizer*)sender;
    CGPoint touchPoint = [touch locationInView:self.scrollPartitura];
    
    if(self.tocandoBloqueioInserirNota){
        
//        [Sinfonia sharedManager].estadoBotaoLimpar = NO;
//        [Sinfonia sharedManager].estadoBotaoPlay = NO;
        
        float posx = touchPoint.x;
        float posy = touchPoint.y;
        
        Nota *not = [[DesenhaPartituraEdicao sharedManager] retornaPosicaoNotaEdicao:posx:posy];
        
        if((not != NULL)&&([DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count <= self.limiteDeNotas)){
            [DesenhaPartituraEdicao sharedManager].notaParaEdicao = not;
            
            listaSons = [[NSMutableArray alloc]init];
            [listaSons addObject:not];
            
            [[Sinfonia sharedManager]tocarUmaNota:listaSons:[EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura];
            
            [[DesenhaPartituraEdicao sharedManager].listaNotasEdicao addObject:not];
            
            for(Nota *img in [DesenhaPartituraEdicao sharedManager].listaNotasEdicao){
                [[Sinfonia sharedManager]desapareceEfeito:img];
            }
            
            [[self scrollPartitura]addSubview:[not imagemNota]];
            self.tempoUltimaNota = [[Sinfonia sharedManager]pegaTempoNota:not];
            
            [[self scrollPartitura] setContentSize:CGSizeMake((self.scrollPartitura.bounds.size.width+[DesenhaPartituraEdicao sharedManager].posicaoX)-700, self.scrollPartitura.bounds.size.height)];
            
            if([DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count > 4){
                [[DesenhaPartituraEdicao sharedManager] aumentarLinhasPentagrama];
                CGPoint bottomOffset = CGPointMake(([DesenhaPartituraEdicao sharedManager].posicaoX-600),0);
                [[self scrollPartitura] setContentOffset:bottomOffset animated:YES];
            }
        }else{
            NSLog(@"Passou do limite de notas");
        }

    }
    
}


//Acompanha a nota no scroll quando está tocando
-(void)atualizaPosicaoTocando{
    
    Nota *notaAtual = [[DesenhaPartituraEdicao sharedManager].listaNotasEdicao objectAtIndex:self.contadorIndiceNota];
    self.posNotaTocando = notaAtual.imagemNota.frame.origin.x;
    
    
    NSString *tempoNota = notaAtual.tipoNota;
    float tempo = 0.0;
    
    if([tempoNota isEqualToString:@"64th"]){
        tempo = n64th;
    }else if([tempoNota isEqualToString:@"32th"]){
        tempo = n32th;
    }else if([tempoNota isEqualToString:@"16th"]){
        tempo = n16th;
    }else if([tempoNota isEqualToString:@"eighth"]){
        tempo = eighth;
    }else if([tempoNota isEqualToString:@"quarter"]){
        tempo = quarter;
    }else if([tempoNota isEqualToString:@"half"]){
        tempo = half;
    }else if([tempoNota isEqualToString:@"whole"]){
        tempo = whole;
    }else{
    }
    
    
    if([DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count-1 != self.contadorIndiceNota){
        CGPoint bottomOffset = CGPointMake((self.posNotaTocando-350),0);
        [[self scrollPartitura] setContentOffset:bottomOffset animated:YES];
        
        self.contadorIndiceNota++;
        [NSTimer scheduledTimerWithTimeInterval:tempo
                                         target: self
                                       selector: @selector(atualizaPosicaoTocando)
                                       userInfo: nil
                                        repeats: NO];
    }
    
}


//desenha o pentagrama e clave no scroll
-(void)desenhaLinhasPengrama{
    
    for (UIImageView *t in [DesenhaPartituraEdicao sharedManager].listaImagensTracoPentagrama) {
        [[self scrollPartitura]addSubview:t];
    }
    
    UIImageView *clave = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"claveSolBranca.png"]];
    clave.frame = CGRectMake(-30, 100, 200, 400);
    [self.scrollPartitura addSubview:clave];
    
    
    [DesenhaPartituraEdicao sharedManager].listaNotasEdicao = [[NSMutableArray alloc]init];
    
    [self.scrollPartitura addSubview:self.imgVassoura];
    [self addAnimacaoSpriteVassoura];


}

-(void)removeViewDoScroll{
    
    [Sinfonia sharedManager].compassoAtual = 0;
    [Sinfonia sharedManager].contadorScrollDesloca = 500;
    [Sinfonia sharedManager].controleVelocidaTranNota = 0.5;
    [self.scrollPartitura setContentOffset:CGPointMake(0,0) animated:YES];
    
    for (UIView *subView in self.scrollPartitura.subviews){
        [subView removeFromSuperview];
    }
    
}


//Recebe o scroll de edicao
-(void)recebeScroll:(UIScrollView*)scroll{
    
    self.scrollPartitura = scroll;
    self.scrollPartitura.delegate = self;
    
}

//Reseta o tamanho original do scroll
-(void)resetaScroll{
    
    [self.scrollPartitura setContentOffset:CGPointMake(0,0) animated:YES];
}

-(void)esperaTocar{
    
    [[Sinfonia sharedManager]desapareceEfeito:[[DesenhaPartituraEdicao sharedManager].listaNotasEdicao lastObject]];
    
    self.contadorIndiceNota = 0;
    self.posOriginalScroll = self.scrollPartitura.contentOffset;
    if([DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count != 0)[self atualizaPosicaoTocando];
    
    if([[DesenhaPartituraEdicao sharedManager].listaNotasEdicao lastObject] != NULL){
        [[Sinfonia sharedManager]tocarTodasNotasEdicao:[DesenhaPartituraEdicao sharedManager].listaNotasEdicao:[EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura];
    }
    
    
}


//toca a partitura
-(void)tocaPartituraEdicao{
    
    if(([Sinfonia sharedManager].estadoBotaoPlay) && ([DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count != 0)){
        
        self.tocandoBloqueioInserirNota = NO;

        [PlayerPartituraEdicaoViewController sharedManager].lblLimparPartitura.hidden = YES;
        [PlayerPartituraEdicaoViewController sharedManager].lblPlayPartitura.hidden = YES;
        [ListaInstrumentoViewController sharedManager].view.hidden = YES;
        
        float tempo = self.tempoUltimaNota;
        
        for(int i=0;i<8;i++){
            PartituraSinfonia *bank = [[Sinfonia sharedManager].listaSoundBank objectAtIndex:i];
            [bank.soundBank allNotesOff];
        }
        
        CGPoint bottomOffset = CGPointMake(0,0);
        [[self scrollPartitura] setContentOffset:bottomOffset animated:YES];
        
        [self performSelector:@selector(esperaTocar) withObject:nil afterDelay:tempo+0.1];
    }

}


//limpa a partitura
-(void)limparPartituraEdicao{
    
    if([Sinfonia sharedManager].estadoBotaoLimpar){
        
        if([DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count != 0){
            self.tocandoBloqueioInserirNota = NO;
            [self movimentaVassoura];
            
            for (UIView *subView in self.scrollPartitura.subviews)
            {
                for(int i=0;i<[DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count;i++){
                    Nota *coord = [[DesenhaPartituraEdicao sharedManager].listaNotasEdicao  objectAtIndex:i];
                    
                    if ([subView isEqual:coord.imagemNota])
                    {
                        [subView removeFromSuperview];
                    }
                    
                }
            }
            
            [DesenhaPartituraEdicao sharedManager].listaNotasEdicao = [[NSMutableArray alloc]init];
            
            CGPoint bottomOffset = CGPointMake(0,0);
            [[self scrollPartitura] setContentOffset:bottomOffset animated:YES];
            [DesenhaPartituraEdicao sharedManager].posicaoX = 250;
            
     
        }
    }
}


-(void)movimentaVassoura{
   
    [PlayerPartituraEdicaoViewController sharedManager].lblLimparPartitura.hidden = YES;
    [PlayerPartituraEdicaoViewController sharedManager].lblPlayPartitura.hidden = YES;

    
    self.imgVassoura.hidden = NO;
   
    CABasicAnimation *moveNuvemDireita= [CABasicAnimation animationWithKeyPath:@"position"];
    moveNuvemDireita.duration = 2.0;
    moveNuvemDireita.repeatCount = 1;
    moveNuvemDireita.fromValue = [NSValue valueWithCGPoint: CGPointMake(self.imgVassoura.frame.origin.x+100,self.imgVassoura.frame.origin.y+120)];
    moveNuvemDireita.toValue = [NSValue valueWithCGPoint: CGPointMake(self.imgVassoura.frame.origin.x-700,self.imgVassoura.frame.origin.y+120)];
    moveNuvemDireita.fillMode = kCAFillModeBackwards;
    moveNuvemDireita.removedOnCompletion = NO;
    [self.imgVassoura.layer addAnimation: moveNuvemDireita forKey:@"animacaoMovimento"];

    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(finalizaLimparTela) userInfo:nil repeats:NO];
    
}

-(void)finalizaLimparTela{
    self.tocandoBloqueioInserirNota = YES;
    self.imgVassoura.hidden = YES;
    [PlayerPartituraEdicaoViewController sharedManager].lblLimparPartitura.hidden = NO;
    [PlayerPartituraEdicaoViewController sharedManager].lblPlayPartitura.hidden = NO;
}



//Aux que converte para CGImage, unico jeito para dar certo
-(NSArray*)animationCGImagesArray:(UIImageView*)imgAddAnimacao {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[imgAddAnimacao.animationImages count]];
    for (UIImage *image in imgAddAnimacao.animationImages) {
        [array addObject:(id)[image CGImage]];
    }
    return [NSArray arrayWithArray:array];
}

-(void)addAnimacaoSpriteVassoura{
    
    UIImage *image1 = [UIImage imageNamed:@"vassoura-01.png"];
    UIImage *image2 = [UIImage imageNamed:@"vassoura-02.png"];
    UIImage *image3 = [UIImage imageNamed:@"vassoura-03.png"];
    UIImage *image4 = [UIImage imageNamed:@"vassoura-04.png"];
    UIImage *image5 = [UIImage imageNamed:@"vassoura-05.png"];
    UIImage *image6 = [UIImage imageNamed:@"vassoura-06.png"];
    UIImage *image7 = [UIImage imageNamed:@"vassoura-07.png"];
    UIImage *image8 = [UIImage imageNamed:@"vassoura-08.png"];
    
    NSArray *imageArray = [NSArray arrayWithObjects:image1, image2, image3, image4, image5, image6, image7, image8, nil];
    
    self.imgVassoura.animationImages = imageArray;
    
    CAKeyframeAnimation *animacao = [CAKeyframeAnimation animationWithKeyPath: @"contents"];
    animacao.calculationMode = kCAAnimationDiscrete;
    animacao.duration = 0.5;
    animacao.repeatCount = INFINITY;
    animacao.autoreverses = YES;
    animacao.beginTime = CACurrentMediaTime() + 0.2;
    animacao.fillMode = kCAFillModeForwards;
    animacao.removedOnCompletion = YES;
    animacao.additive = NO;
    animacao.values = [self animationCGImagesArray:self.imgVassoura];
    [self.imgVassoura.layer addAnimation: animacao forKey:@"animacaoSprite"];
    
}






@end
