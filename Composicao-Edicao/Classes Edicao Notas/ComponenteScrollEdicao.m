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
    }
    return self;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


//////////////////////////////////////////////////////////////////////

//Add gesture ao scorll view
-(void)addGesturePrintarNotasTela{
    
    self.limiteDeNotas = 200;
    
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
        
        float posx = touchPoint.x;
        float posy = touchPoint.y;
        NSLog(@"nota x = %f, y =%f ",posx,posy);
        
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


//toca a partitura
-(void)tocaPartituraEdicao{
    
    self.tocandoBloqueioInserirNota = NO;
    
    if([Sinfonia sharedManager].estadoBotaoPlay){
        
        [[Sinfonia sharedManager]desapareceEfeito:[[DesenhaPartituraEdicao sharedManager].listaNotasEdicao lastObject]];
        
        self.contadorIndiceNota = 0;
        self.posOriginalScroll = self.scrollPartitura.contentOffset;
        if([DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count != 0)[self atualizaPosicaoTocando];
        
        if([[DesenhaPartituraEdicao sharedManager].listaNotasEdicao lastObject] != NULL)[[Sinfonia sharedManager]tocarTodasNotasEdicao:[DesenhaPartituraEdicao sharedManager].listaNotasEdicao:[EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura];
    }

}


//limpa a partitura
-(void)limparPartituraEdicao{
    
    if([Sinfonia sharedManager].estadoBotaoLimpar){
        
        if([DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count != 0){
            
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

@end
