//
//  DesenhaPartituraEdicao.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 06/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "DesenhaPartituraEdicao.h"

@implementation DesenhaPartituraEdicao

//Sington
+(DesenhaPartituraEdicao*)sharedManager{
    static DesenhaPartituraEdicao *unicoInstrumento = nil;
    if(!unicoInstrumento){
        unicoInstrumento = [[super allocWithZone:nil]init];
    }
    return unicoInstrumento;
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


/////////////////////////// Partitura Edicao /////////////////////////////////

//Add gesture a uma nota para deletar
-(void)addGestureSegurarNotasTela:(Nota*)notaSegura :(int)direcao{
    
    NotaEdicaoGesture *swipeGesture2 = [[NotaEdicaoGesture alloc] initWithTarget:self action:@selector(deletarNota:)];
    if(direcao == 0)swipeGesture2.direction = UISwipeGestureRecognizerDirectionDown;
    else swipeGesture2.direction = UISwipeGestureRecognizerDirectionUp;
    
    [swipeGesture2 setNumberOfTouchesRequired:1];
    notaSegura.imagemNota.userInteractionEnabled = YES;
    swipeGesture2.notaEdicaoGesture = notaSegura;

    [notaSegura.imagemNota addGestureRecognizer:swipeGesture2];
    
}


//Deleta a nota da scroll view
-(void)deletarNota:(id)sender{
    
    NotaEdicaoGesture *touch = (NotaEdicaoGesture*)sender;
    self.notaParaEdicao = touch.notaEdicaoGesture;
    
    [UIView animateWithDuration:1.0
                     animations:^(void){
                         CGRect moveNotaParaBaixo = CGRectMake(self.notaParaEdicao.posicaoNotaEdicao,600,self.notaParaEdicao.imagemNota.frame.size.width,self.notaParaEdicao.imagemNota.frame.size.height);
                         self.notaParaEdicao.imagemNota.frame = moveNotaParaBaixo;
                     } completion:^(BOOL finished){
                         [self rearranjaPosicoesNotas:self.notaParaEdicao.posicaoNotaEdicao];
                         
                         for (UIView *subView in [ComponenteScrollEdicao sharedManager].scrollPartitura.subviews){
                             if ([subView isEqual:self.notaParaEdicao.imagemNota]){
                                 [subView removeFromSuperview];
                             }
                         }
                         
                         [self.listaNotasEdicao removeObject:self.notaParaEdicao];
                     }];
    
}


//Faz o rearranjo das notas quando deleta uma do scroll view
-(void)rearranjaPosicoesNotas:(int)posicaoNotaDeletada{
    Nota *pegaPosicaoDaUltimaNota = [self.listaNotasEdicao lastObject];
    self.posicaoX = pegaPosicaoDaUltimaNota.posicaoNotaEdicao;
    NSMutableArray *aux = [[NSMutableArray alloc] init];
    
    for(Nota *auxs in self.listaNotasEdicao){
        Nota *t = [[Nota alloc]init];
        t.posicaoNotaEdicao = auxs.posicaoNotaEdicao;
        [aux addObject:t];
    }
    
    int k=0;
    
    for(int i=0;i<self.listaNotasEdicao.count;i++){
        Nota *notaPosicao = [self.listaNotasEdicao objectAtIndex:i];
        if(notaPosicao.posicaoNotaEdicao == posicaoNotaDeletada){
            for(int j=i;j<self.listaNotasEdicao.count-1;j++){
                k=j+1;
                Nota *notaPosicaoProx = [self.listaNotasEdicao objectAtIndex:k];
                Nota *notaPosicaoAtual = [aux objectAtIndex:j];
                notaPosicaoProx.posicaoNotaEdicao = notaPosicaoAtual.posicaoNotaEdicao;
                
                [UIView animateWithDuration:0.5
                                 animations:^(void){
                                     CGRect moveNotaParaBaixo = CGRectMake(notaPosicaoProx.posicaoNotaEdicao,
                                                                           notaPosicaoProx.imagemNota.frame.origin.y,
                                                                           notaPosicaoProx.imagemNota.frame.size.width,
                                                                           notaPosicaoProx.imagemNota.frame.size.height);
                                     notaPosicaoProx.imagemNota.frame = moveNotaParaBaixo;
                                 } completion:^(BOOL finished){
                                     
                                 }];
            }
            
            
            break;
        }
        
    }
    
}


//Metodo que controla a posicao tocada pelo usuario transformando em um nota especifica
-(Nota*)retornaNotaCriadaPeloUsuario:(float)j :(UIImageView*)t :(UIImageView*)t2 :(UIImageView*)ultimoTraco{
    
    Nota *aux;
    int ajusteNota = -105;
    int tamanhoHor = 100;
    int tamanhoVert = 150;
    
    ///////////////// 5A ////////////////
     if(j==0){
        aux = [[Nota alloc]init];
        
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"A";
        aux.oitava = @"5";
        aux.duracao = @"0";
        aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
        
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[DataBaseNotaPadrao sharedManager]retornaNotaPadraoCrianca:aux.nomeNota].imagemNota.image];
         
        float degrees = 180; //the value in degrees
         aux.imagemNota.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
         
        [self addComponentesImangesNota:aux:aux.oitava];
         
        [[aux imagemNota]setFrame:CGRectMake(self.posicaoX-60,t.frame.origin.y-aux.imagemNota.frame.size.height-ajusteNota+100,tamanhoHor,tamanhoVert)];
         
        UIImageView *traco = [[UIImageView alloc]init];
        traco.backgroundColor = [UIColor whiteColor];
        traco.frame = CGRectMake(-51, 122, 125, 4);
        [aux.imagemNota addSubview:traco];
        traco.layer.zPosition = -1;
         
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = self.posicaoX;
        self.posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux:1];
        return aux;
        
        
    }
    ///////////////// 5G ////////////////
    else if(j==0.5){
        aux = [[Nota alloc]init];
       
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"G";
        aux.oitava = @"5";
        aux.duracao = @"0";
        aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
        
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[DataBaseNotaPadrao sharedManager]retornaNotaPadraoCrianca:aux.nomeNota].imagemNota.image];
        
        float degrees = 180; //the value in degrees
        aux.imagemNota.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
        
        [self addComponentesImangesNota:aux:aux.oitava];
        
        float pos = (((t2.frame.origin.y-t.frame.origin.y)/2)+t.frame.origin.y);
        [[aux imagemNota]setFrame:CGRectMake(self.posicaoX-60,(pos)-aux.imagemNota.frame.size.height-ajusteNota+100,tamanhoHor,tamanhoVert)];
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = self.posicaoX;
        self.posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux:1];
        return aux;
        
        
    }
    ///////////////// 5F ////////////////
    if(j==1){
        aux = [[Nota alloc]init];
       
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"F";
        aux.oitava = @"5";
        aux.duracao = @"0";
        aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
        
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[DataBaseNotaPadrao sharedManager]retornaNotaPadraoCrianca:aux.nomeNota].imagemNota.image];
        
        float degrees = 180; //the value in degrees
        aux.imagemNota.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
        
        [self addComponentesImangesNota:aux:aux.oitava];
        
        [[aux imagemNota]setFrame:CGRectMake(self.posicaoX-60,t.frame.origin.y-aux.imagemNota.frame.size.height-ajusteNota+100,tamanhoHor,tamanhoVert)];
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = self.posicaoX;
        self.posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux:1];
        return aux;
        
        
    }
    //////////////// 5E ////////////////
    else if(j==1.5){
        aux = [[Nota alloc]init];
        
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"E";
        aux.oitava = @"5";
        aux.duracao = @"0";
        aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
        
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[DataBaseNotaPadrao sharedManager]retornaNotaPadraoCrianca:aux.nomeNota].imagemNota.image];
        
        float degrees = 180; //the value in degrees
        aux.imagemNota.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
        
        [self addComponentesImangesNota:aux:aux.oitava];
        
        float pos = (((t2.frame.origin.y-t.frame.origin.y)/2)+t.frame.origin.y);
        [[aux imagemNota]setFrame:CGRectMake(self.posicaoX-60,(pos)-aux.imagemNota.frame.size.height-ajusteNota+100,tamanhoHor,tamanhoVert)];
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = self.posicaoX;
        self.posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux:1];
        return aux;
        
        
    }
    //////////////// 5D ////////////////
    else if(j==2.0){
        aux = [[Nota alloc]init];
        
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"D";
        aux.oitava = @"5";
        aux.duracao = @"0";
        aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
        
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[DataBaseNotaPadrao sharedManager]retornaNotaPadraoCrianca:aux.nomeNota].imagemNota.image];
        
        float degrees = 180; //the value in degrees
        aux.imagemNota.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
        
        [self addComponentesImangesNota:aux:aux.oitava];
        
        [[aux imagemNota]setFrame:CGRectMake(self.posicaoX-60,t.frame.origin.y-aux.imagemNota.frame.size.height-ajusteNota+100,tamanhoHor,tamanhoVert)];
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = self.posicaoX;
        self.posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux:1];
        return aux;
        
        
    }
    //////////////// 5C ////////////////
    else if(j==2.5){
        aux = [[Nota alloc]init];
                aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"C";
        aux.oitava = @"5";
        aux.duracao = @"0";
        aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
        
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[DataBaseNotaPadrao sharedManager]retornaNotaPadraoCrianca:aux.nomeNota].imagemNota.image];
        
        float degrees = 180; //the value in degrees
        aux.imagemNota.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
        
        [self addComponentesImangesNota:aux:aux.oitava];
        
        float pos = (((t2.frame.origin.y-t.frame.origin.y)/2)+t.frame.origin.y);
        [[aux imagemNota]setFrame:CGRectMake(self.posicaoX-60,(pos)-aux.imagemNota.frame.size.height-ajusteNota+100,tamanhoHor,tamanhoVert)];
        

        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = self.posicaoX;
        self.posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux:1];
        return aux;
        
        
    }
    //////////////// 4B ////////////////
    else if(j==3.0){
        aux = [[Nota alloc]init];
        
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"B";
        aux.oitava = @"4";
        aux.duracao = @"0";
        aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
        
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[DataBaseNotaPadrao sharedManager]retornaNotaPadraoCrianca:aux.nomeNota].imagemNota.image];
        [self addComponentesImangesNota:aux:aux.oitava];
        
        [[aux imagemNota]setFrame:CGRectMake(self.posicaoX,t.frame.origin.y-aux.imagemNota.frame.size.height-ajusteNota,tamanhoHor,tamanhoVert)];
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = self.posicaoX;
        self.posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux:0];
        return aux;
        
        
    }
    //////////////// 4A ////////////////
    else if(j==3.5){
        aux = [[Nota alloc]init];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"A";
        aux.oitava = @"4";
        aux.duracao = @"0";
        aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
        
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[DataBaseNotaPadrao sharedManager]retornaNotaPadraoCrianca:aux.nomeNota].imagemNota.image];
        [self addComponentesImangesNota:aux:aux.oitava];
        
        float pos = (((t2.frame.origin.y-t.frame.origin.y)/2)+t.frame.origin.y);
        [[aux imagemNota]setFrame:CGRectMake(self.posicaoX,(pos)-aux.imagemNota.frame.size.height-ajusteNota,tamanhoHor,tamanhoVert)];

        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = self.posicaoX;
        self.posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux:0];
        return aux;
        
        
    }
    //////////////// 4G ////////////////
    else if(j==4){
        aux = [[Nota alloc]init];
        
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"G";
        aux.oitava = @"4";
        aux.duracao = @"0";
        aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
        
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[DataBaseNotaPadrao sharedManager]retornaNotaPadraoCrianca:aux.nomeNota].imagemNota.image];
        [self addComponentesImangesNota:aux:aux.oitava];
        
        [[aux imagemNota]setFrame:CGRectMake(self.posicaoX,t.frame.origin.y-aux.imagemNota.frame.size.height-ajusteNota,tamanhoHor,tamanhoVert)];
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = self.posicaoX;
        self.posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux:0];
        return aux;
        
        
    }
    //////////////// 4F ////////////////
    else if(j==4.5){
        aux = [[Nota alloc]init];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"F";
        aux.oitava = @"4";
        aux.duracao = @"0";
        aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
        
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[DataBaseNotaPadrao sharedManager]retornaNotaPadraoCrianca:aux.nomeNota].imagemNota.image];
        [self addComponentesImangesNota:aux:aux.oitava];
        
        float pos = (((t2.frame.origin.y-t.frame.origin.y)/2)+t.frame.origin.y);
        [[aux imagemNota]setFrame:CGRectMake(self.posicaoX,(pos)-aux.imagemNota.frame.size.height-ajusteNota,tamanhoHor,tamanhoVert)];

        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = self.posicaoX;
        self.posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux:0];
        return aux;
        
        
    }
    //////////////// 4E ////////////////
    else if(j==5.0){
        aux = [[Nota alloc]init];
        
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"E";
        aux.oitava = @"4";
        aux.duracao = @"0";
        aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
        
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[DataBaseNotaPadrao sharedManager]retornaNotaPadraoCrianca:aux.nomeNota].imagemNota.image];
        [self addComponentesImangesNota:aux:aux.oitava];
        
        [[aux imagemNota]setFrame:CGRectMake(self.posicaoX,t.frame.origin.y-aux.imagemNota.frame.size.height-ajusteNota,tamanhoHor,tamanhoVert)];
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = self.posicaoX;
        self.posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux:0];
        
        return aux;
        
        
    }
    //////////////// 4D ////////////////
    else if(j==5.5){
        aux = [[Nota alloc]init];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"D";
        aux.oitava = @"4";
        aux.duracao = @"0";
        aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
        
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[DataBaseNotaPadrao sharedManager]retornaNotaPadraoCrianca:aux.nomeNota].imagemNota.image];
        [self addComponentesImangesNota:aux:aux.oitava];
        
        float pos = (((t2.frame.origin.y-t.frame.origin.y)/2)+t.frame.origin.y);
        [[aux imagemNota]setFrame:CGRectMake(self.posicaoX,(pos)-aux.imagemNota.frame.size.height-ajusteNota,tamanhoHor,tamanhoVert)];
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = self.posicaoX;
        self.posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux:0];
        return aux;
        
        
    }
    //////////////// 4C ////////////////
    else if(j==6.0){
        aux = [[Nota alloc]init];
        
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"C";
        aux.oitava = @"4";
        aux.duracao = @"0";
        aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
        
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[DataBaseNotaPadrao sharedManager]retornaNotaPadraoCrianca:aux.nomeNota].imagemNota.image];
        [self addComponentesImangesNota:aux:aux.oitava];
        
        [[aux imagemNota]setFrame:CGRectMake(self.posicaoX,(ultimoTraco.frame.origin.y-aux.imagemNota.frame.size.height-ajusteNota),tamanhoHor,tamanhoVert)];
        
        UIImageView *traco = [[UIImageView alloc]init];
        traco.backgroundColor = [UIColor whiteColor];
        traco.frame = CGRectMake(-51, 122, 125, 4);
        [aux.imagemNota addSubview:traco];
        traco.layer.zPosition = -1;
        
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = self.posicaoX;
        self.posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux:0];
        return aux;
        
        
    }

    
    return NULL;
    
}


//Add os componetens a mais em uma nota (chapeu,rosto animal) dependendo da sua posicao(cima,baixo)
-(void)addComponentesImangesNota:(Nota*)aux :(NSString*)oitava{
    
    NotaAnimadaPadrao *padrao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadraoCrianca:aux.nomeNota];
    
    UIImage *imgCarinha = [[DataBaseNotaPadrao sharedManager]retornaCarinhaNota:aux.nomeNota];
    
    if([oitava isEqualToString:@"4"]){
        if(padrao.carinha == 1){
            UIImageView *carinha = [[UIImageView alloc]initWithImage:imgCarinha];
            [carinha setFrame:CGRectMake(-65,-15,150,180)];
            [aux.imagemNota addSubview:carinha];
        }
        
        if(padrao.chapeu == 1){
            UIImageView *chapeu = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"chapeu.png"]];
            [chapeu setFrame:CGRectMake(-33,50,80,50)];
            [aux.imagemNota addSubview:chapeu];
        }
    }else{
        if(padrao.carinha == 1){
            UIImageView *carinha = [[UIImageView alloc]initWithImage:imgCarinha];
            float degrees = 180; //the value in degrees
            carinha.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
            [carinha setFrame:CGRectMake(-63,85,150,180)];
            [aux.imagemNota addSubview:carinha];
        }
        
        if(padrao.chapeu == 1){
            UIImageView *chapeu = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"chapeu.png"]];
            float degrees = 180; //the value in degrees
            chapeu.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
            [chapeu setFrame:CGRectMake(-30,145,80,50)];
            [aux.imagemNota addSubview:chapeu];
        }
    }
    
    
}


//Pega a nota escolhida pelo usuario atraves do metodo retornaNotaCriadaPeloUsuario e coloca dentro da ScrollView
-(Nota*)retornaPosicaoNotaEdicao:(float)posx :(float)posy{
    
    Nota *aux;
    
    int precisaoTouchLinha = 10;
    UIImageView *linhaPausa = [[[DesenhaPartituraEdicao sharedManager]listaImagensTracoPentagrama]objectAtIndex:3];
    
    if([[[EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao nomeNota] rangeOfString:@"Pausa"].location != NSNotFound){
      
        if([[[EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao nomeNota] isEqualToString:@"semibrevePausa"]){
            aux = [[Nota alloc]init];
            aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
            aux.imagemNota = [[UIImageView alloc]initWithImage:[[[EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao imagemNota]image]];
            [[aux imagemNota]setFrame:CGRectMake(self.posicaoX,linhaPausa.frame.origin.y+3,60,20)];
            aux.nomeNota = @"";
            aux.oitava = @"";
            aux.tom = @"";
            aux.posicaoNotaEdicao = self.posicaoX;
            self.posicaoX += espacamentoEntreNotas;
            [self addGestureSegurarNotasTela:aux:0];
            return aux;
            
        }else if([[[EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao nomeNota] isEqualToString:@"minimaPausa"]){
            aux = [[Nota alloc]init];
            aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
            aux.imagemNota = [[UIImageView alloc]initWithImage:[[[EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao imagemNota]image]];
            [[aux imagemNota]setFrame:CGRectMake(self.posicaoX,linhaPausa.frame.origin.y+41,60,18)];
            aux.nomeNota = @"";
            aux.oitava = @"";
            aux.tom = @"";
            aux.posicaoNotaEdicao = self.posicaoX;
            self.posicaoX += espacamentoEntreNotas;
            [self addGestureSegurarNotasTela:aux:0];
            return aux;
            
        }else if([[[EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao nomeNota] isEqualToString:@"seminimaPausa"]){
            aux = [[Nota alloc]init];
            aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
            aux.imagemNota = [[UIImageView alloc]initWithImage:[[[EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao imagemNota]image]];
            [[aux imagemNota]setFrame:CGRectMake(self.posicaoX,linhaPausa.frame.origin.y-10,60,80)];
            aux.nomeNota = @"";
            aux.oitava = @"";
            aux.tom = @"";
            aux.posicaoNotaEdicao = self.posicaoX;
            self.posicaoX += espacamentoEntreNotas;
            [self addGestureSegurarNotasTela:aux:0];
            return aux;
            
        }else if([[[EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao nomeNota] isEqualToString:@"colcheiaPausa"]){
            aux = [[Nota alloc]init];
            aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
            aux.imagemNota = [[UIImageView alloc]initWithImage:[[[EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao imagemNota]image]];
            [[aux imagemNota]setFrame:CGRectMake(self.posicaoX,linhaPausa.frame.origin.y-10,60,80)];
            aux.nomeNota = @"";
            aux.oitava = @"";
            aux.tom = @"";
            aux.posicaoNotaEdicao = self.posicaoX;
            self.posicaoX += espacamentoEntreNotas;
            [self addGestureSegurarNotasTela:aux:0];
            return aux;
            
        }else if([[[EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao tipoNota] isEqualToString:@"semicolcheiaPausa"]){
            aux = [[Nota alloc]init];
            aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
            aux.imagemNota = [[UIImageView alloc]initWithImage:[[[EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao imagemNota]image]];
            [[aux imagemNota]setFrame:CGRectMake(self.posicaoX,linhaPausa.frame.origin.y+30,60,80)];
            aux.nomeNota = @"";
            aux.oitava = @"";
            aux.tom = @"";
            aux.posicaoNotaEdicao = self.posicaoX;
            self.posicaoX += espacamentoEntreNotas;
            [self addGestureSegurarNotasTela:aux:0];
            return aux;
            
        }else if([[[EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao tipoNota] isEqualToString:@"fusaPausa"]){
            aux = [[Nota alloc]init];
            aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
            aux.imagemNota = [[UIImageView alloc]initWithImage:[[[EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao imagemNota]image]];
            [[aux imagemNota]setFrame:CGRectMake(self.posicaoX,linhaPausa.frame.origin.y+30,60,80)];
            aux.nomeNota = @"";
            aux.oitava = @"";
            aux.tom = @"";
            aux.posicaoNotaEdicao = self.posicaoX;
            self.posicaoX += espacamentoEntreNotas;
            [self addGestureSegurarNotasTela:aux:0];
            return aux;
            
        }else if([[[EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao tipoNota] isEqualToString:@"semifusaPausa"]){
            aux = [[Nota alloc]init];
            aux.tipoNota = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
            aux.imagemNota = [[UIImageView alloc]initWithImage:[[[EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao imagemNota]image]];
            [[aux imagemNota]setFrame:CGRectMake(self.posicaoX,linhaPausa.frame.origin.y+30,60,80)];
            aux.nomeNota = @"";
            aux.oitava = @"";
            aux.tom = @"";
            aux.posicaoNotaEdicao = self.posicaoX;
            self.posicaoX += espacamentoEntreNotas;
            [self addGestureSegurarNotasTela:aux:0];
            return aux;
            
        }
        
        
        
    }else{
        
        int iniciaLinha = 0;
        int qtTotalLinhasPentagrama = [DesenhaPartituraEdicao sharedManager].listaImagensTracoPentagrama.count-1+iniciaLinha;
       
        for (int j=iniciaLinha;j<qtTotalLinhasPentagrama;j++) {
            
            
            
            UIImageView *t = [[[DesenhaPartituraEdicao sharedManager]listaImagensTracoPentagrama]objectAtIndex:j];
            UIImageView *t2 = [[[DesenhaPartituraEdicao sharedManager]listaImagensTracoPentagrama]objectAtIndex:j+1];
            UIImageView *ultimoTraco = [[[DesenhaPartituraEdicao sharedManager]listaImagensTracoPentagrama]lastObject];
            
            
            //na linha
            if((posy <= t.frame.origin.y+precisaoTouchLinha)&&(posy >= t.frame.origin.y-precisaoTouchLinha)){
                aux =  [self retornaNotaCriadaPeloUsuario:j:t:t2:ultimoTraco];
                return aux;
                
            //no espaco
            }else if((posy >= t.frame.origin.y+precisaoTouchLinha)&&(posy <= t2.frame.origin.y-precisaoTouchLinha)){
                aux =  [self retornaNotaCriadaPeloUsuario:j+0.5:t:t2:ultimoTraco];
                return aux;
                
            //linha do ultimo
            }else if((posy <= ultimoTraco.frame.origin.y+precisaoTouchLinha)&&(posy >= ultimoTraco.frame.origin.y-precisaoTouchLinha)){
                aux =  [self retornaNotaCriadaPeloUsuario:6.0:t:t2:ultimoTraco];
                return aux;
                
            }
            
        }
        
    }
    return NULL;
}


//Aumenta o tamanho da scroll de acordo com inserir de notas
-(void)aumentarLinhasPentagrama{
    for (UIImageView *t in [DesenhaPartituraEdicao sharedManager].listaImagensTracoPentagrama) {
        [t setFrame:CGRectMake(t.frame.origin.x, t.frame.origin.y, self.posicaoX + 500.0f, 2.0f)];

    }
}


//Carrega e monta as Linhas do Pentagrama
-(void)desenhaContornoPartituraParaEdicao:(int)qtLinhas :(BOOL)estadoGesture{
    
    self.posicaoX = 250;
    espacamentoEntreNotas = 180;
    
    
    //Pos Linha em X | Espamento entre linhas
    float posHorizontalRiscoPentagrama = 60.0f;
    float espacamentoRiscoPentagrama = 60.0f;
    
    self.listaImagensTracoPentagrama = [[NSMutableArray alloc]init];
    
    
    // Insere linhas no pentragrama
    for(int i=0;i<=qtLinhas;i++){
        UIImageView *linha = [[UIImageView alloc]
                              initWithFrame:CGRectMake(0.0f, posHorizontalRiscoPentagrama + espacamentoRiscoPentagrama, 1500, 4.0f)];
        posHorizontalRiscoPentagrama = posHorizontalRiscoPentagrama + espacamentoRiscoPentagrama;
        linha.backgroundColor = [UIColor whiteColor];
        linha.alpha = 0.5;
        
        if((i>0)&&(i<6)){
            linha.backgroundColor = [UIColor whiteColor];
            linha.alpha = 1.0;
        }
        
        [ self.listaImagensTracoPentagrama addObject:linha];
    }
    
    [self desenhaContornoPartituraScroll:estadoGesture];
    
}


//Chama o metodo de desenhar pentagra e add o gesture ao scroll para poder inserir notas
-(void)desenhaContornoPartituraScroll:(BOOL)estadoGesture{
    [[ComponenteScrollEdicao sharedManager]desenhaLinhasPengrama];
    [ComponenteScrollEdicao sharedManager].limiteDeNotas = 200;
    
    if(estadoGesture){
        [[ComponenteScrollEdicao sharedManager]addGesturePrintarNotasTela];
    }
    
}







@end
