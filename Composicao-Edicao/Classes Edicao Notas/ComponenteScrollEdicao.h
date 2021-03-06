//
//  ComponenteScrollEdicao.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 06/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sinfonia.h"
#import "NotaEdicaoGesture.h"
#import "DesenhaPartituraEdicao.h"
#import "ListaInstrumentoViewController.h"


@interface ComponenteScrollEdicao : NSObject <UIScrollViewDelegate> {
    int posicaoX ;
     int espacamentoEntreNotas;
    
    NSMutableArray *listaSons;
}

@property int limiteDeNotas;
@property BOOL tocandoBloqueioInserirNota;

@property float tempoUltimaNota;

//Atributos
@property UIScrollView *scrollPartitura;
@property float posNotaTocando;
@property int contadorIndiceNota;
@property CGPoint posOriginalScroll;


//Metodos
+(ComponenteScrollEdicao*)sharedManager;
-(void)recebeScroll:(UIScrollView*)scroll;
-(void)desenhaLinhasPengrama;
-(void)addGesturePrintarNotasTela;
-(void)tocaPartituraEdicao;
-(void)limparPartituraEdicao;
-(void)addNotaNaTelaInstrumento:(NSValue*)touchPoint;


//Vassoura
@property UIImageView *imgVassoura;


@end
