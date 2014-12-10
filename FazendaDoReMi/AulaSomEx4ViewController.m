//
//  AulaSomEx4ViewController.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 17/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "AulaSomEx4ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface AulaSomEx4ViewController ()
@end

@implementation AulaSomEx4ViewController

//Deve descobrir o maior ou menor - ALTURA DO SOM PADRÃO: 1

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Chama o update a cada milesegundo
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(update) userInfo:nil repeats: YES];
    
    //Botão voltar
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoPausaAula:self];

    //Carregamento inicial
     [self carregarComponentesIniciais];
    
    //Verificador de termino do jogo
    [[ControladorDeItem sharedManager] chamaVerificadorDeJogo: 5 :self.totalDeJogadas];
}


-(void)carregarComponentesIniciais{
    
    //Controles de jogo
    self.totalDeAcertos = 0;
    self.totalDeJogadas = 0;
    self.estaAguardandoOuvirTodosOsGalos = true;
    self.estaAguardandoEscolherOGaloCorreto = false;
    
    //Inicia a lista de volumes zerada
    self.listaDeVolumes = [[NSMutableArray alloc] initWithObjects:
                           [NSNumber numberWithFloat: 0.0],
                           [NSNumber numberWithFloat: 0.0],
                           [NSNumber numberWithFloat: 0.0],
                           [NSNumber numberWithFloat: 0.0],
                           [NSNumber numberWithFloat: 0.0],
                           [NSNumber numberWithFloat: 0.0],
                           nil];
    //Nome dos galos
    self.listaDeGalos = [[NSMutableArray alloc] initWithObjects:
                         @"galoVerde",
                         @"galinhaLaranja",
                         @"galinhaRoxa",
                         @"galoAzul",
                         @"galinhaRosa",
                         @"galinhaAmarela",
                         nil];

    //Nova jogada
    [self criarJogada];
}


-(void)update{
    
//LIMITE DE JOGADAS
    if (self.totalDeJogadas <= 5) {
        
        
    //OUVIR TODOS
        if (_estaAguardandoOuvirTodosOsGalos){
            
            //TODOS FORAM PRESSIONADOS
            if (self.galoVerde.estadoPressionado && self.galinhaLaranja.estadoPressionado && self.galinhaRoxa.estadoPressionado && self.galoAzul.estadoPressionado && self.galinhaRosa.estadoPressionado && self.galinhaAmarela.estadoPressionado){
                
                self.estaAguardandoEscolherOGaloCorreto = true;
                [self bloquearGalosParaEscolha];
            }
        }
        
        
    //ESCOLHER O GALO CORRETO
        if (_estaAguardandoEscolherOGaloCorreto){
            
            //ALGUM FOI PRESSIONADO
            if (self.galoVerde.estadoPressionado || self.galinhaLaranja.estadoPressionado || self.galinhaRoxa.estadoPressionado || self.galoAzul.estadoPressionado || self.galinhaRosa.estadoPressionado || self.galinhaAmarela.estadoPressionado){
                
                self.estaAguardandoEscolherOGaloCorreto = false;
                
                //GALO VERDE
                if (self.galoVerde.estadoPressionado) {
                    
                    //ACERTOU
                    if ([self.nomeDoGaloCorreto isEqualToString: self.galoVerde.nome]) {
                        [self acertou];
                        //ERROU
                    }else{
                        [self errou];
                    }
                    
                    return;
                }
                
                //GALO LARANJA
                if (self.galinhaLaranja.estadoPressionado) {
                    
                    //ACERTOU
                    if ([self.nomeDoGaloCorreto isEqualToString: self.galinhaLaranja.nome]) {
                        [self acertou];
                        //ERROU
                    }else{
                        [self errou];
                    }
                    
                    return;
                }
                
                //GALO ROXA
                if (self.galinhaRoxa.estadoPressionado) {
                    
                    //ACERTOU
                    if ([self.nomeDoGaloCorreto isEqualToString: self.galinhaRoxa.nome]) {
                        [self acertou];
                        //ERROU
                    }else{
                        [self errou];
                    }
                    
                    return;
                }
                
                //GALO AZUL
                if (self.galoAzul.estadoPressionado) {
                    
                    //ACERTOU
                    if ([self.nomeDoGaloCorreto isEqualToString: self.galoAzul.nome]) {
                        [self acertou];
                        //ERROU
                    }else{
                        [self errou];
                    }
                    
                    return;
                }
                
                //GALO ROSA
                if (self.galinhaRosa.estadoPressionado) {
                    
                    //ACERTOU
                    if ([self.nomeDoGaloCorreto isEqualToString: self.galinhaRosa.nome]) {
                        [self acertou];
                        //ERROU
                    }else{
                        [self errou];
                    }
                    
                    return;
                }
                
                //GALO AMARELA
                if (self.galinhaAmarela.estadoPressionado) {
                    
                    //ACERTOU
                    if ([self.nomeDoGaloCorreto isEqualToString: self.galinhaAmarela.nome]) {
                        [self acertou];
                        //ERROU
                    }else{
                        [self errou];
                    }
                    
                    return;
                }
                
            }
        }

        
    }else{
        NSLog(@"Jogo encerrado!");
        [[GerenciadorAudio sharedManager] ajustaVolume: 0];
        [[GerenciadorComponenteView sharedManager]addComponentesMenuPausa: [GerenciadorNavigationController sharedManager].controladorApp.visibleViewController];
    }
    
}

//TIPO DO DESAFIO: DESCOBRIR MAIOR OU MENOR SOM
-(void)sortearTipoDoDesafio{
    
    do{
        self.ehPraDescobrirOSomMaior = arc4random() % 2;
    }while (self.ehPraDescobrirOSomMaior == -1);
}

//SORTEIA VALOR PARA UM
-(void)sortearVolumes{
    
    
    //Sorteia o galo
    do{
        self.indiceDoVolumeCorreto = arc4random() % self.listaDeVolumes.count;
    }while (self.indiceDoVolumeCorreto == -1);
    
    //Guarda o nome do galo correto
    self.nomeDoGaloCorreto = (NSString*)[self.listaDeGalos objectAtIndex: self.indiceDoVolumeCorreto];
    
    /* SOM MAIOR = 3
       SOM MENOR = 1 */
    if (_ehPraDescobrirOSomMaior) {
        
        [self.listaDeVolumes replaceObjectAtIndex: self.indiceDoVolumeCorreto withObject: [NSNumber numberWithFloat: 10.0]];
        
        for (int i = 0; i < self.listaDeVolumes.count; i++) {
            if (i != self.indiceDoVolumeCorreto) {
                [self.listaDeVolumes replaceObjectAtIndex: i withObject: [NSNumber numberWithFloat: 0.1]];
            }
        }
    }else{
        
        [self.listaDeVolumes replaceObjectAtIndex: self.indiceDoVolumeCorreto withObject: [NSNumber numberWithFloat: 0.1]];
        
        for (int i = 0; i < self.listaDeVolumes.count; i++) {
            if (i != self.indiceDoVolumeCorreto) {
                [self.listaDeVolumes replaceObjectAtIndex: i withObject: [NSNumber numberWithFloat: 10.0]];
            }
        }
    }

}

-(void)criarGalos{
    
    NSLog(@"Volume: %f", [[self.listaDeVolumes objectAtIndex: 0] floatValue]);
    NSLog(@"Volume: %f", [[self.listaDeVolumes objectAtIndex: 1] floatValue]);
    NSLog(@"Volume: %f", [[self.listaDeVolumes objectAtIndex: 2] floatValue]);
    NSLog(@"Volume: %f", [[self.listaDeVolumes objectAtIndex: 3] floatValue]);
    NSLog(@"Volume: %f", [[self.listaDeVolumes objectAtIndex: 4] floatValue]);
    NSLog(@"Volume: %f", [[self.listaDeVolumes objectAtIndex: 5] floatValue]);
    
        //Cria os galos mandando o volume especifico sorteado
        [[ControladorDeItem sharedManager]retornaItem:@"galoVerde": self.galoVerde: [NSString stringWithFormat: @"gestureTap:1:1 + 1 + 2:0:%.1f", [[self.listaDeVolumes objectAtIndex: 0] floatValue]]];
        [[ControladorDeItem sharedManager]retornaItem:@"galinhaLaranja": self.galinhaLaranja:[NSString stringWithFormat: @"gestureTap:1:1 + 1 + 2:0:%.1f", [[self.listaDeVolumes objectAtIndex: 1] floatValue]]];
        [[ControladorDeItem sharedManager]retornaItem:@"galinhaRoxa": self.galinhaRoxa:[NSString stringWithFormat: @"gestureTap:1:1 + 1 + 2:0:%.1f", [[self.listaDeVolumes objectAtIndex: 2] floatValue]]];
        [[ControladorDeItem sharedManager]retornaItem:@"galoAzul": self.galoAzul:[NSString stringWithFormat: @"gestureTap:1:1 + 1 + 2:0:%.1f", [[self.listaDeVolumes objectAtIndex: 3] floatValue]]];
        [[ControladorDeItem sharedManager]retornaItem:@"galinhaRosa": self.galinhaRosa:[NSString stringWithFormat: @"gestureTap:1:1 + 1 + 2:0:%.1f", [[self.listaDeVolumes objectAtIndex: 4] floatValue]]];
        [[ControladorDeItem sharedManager]retornaItem:@"galinhaAmarela": self.galinhaAmarela:[NSString stringWithFormat: @"gestureTap:1:1 + 1 + 2:0:%.1f", [[self.listaDeVolumes objectAtIndex: 5] floatValue]]];
    
}

-(void)voltarParaOEstadoInicial{
    
    self.galoVerde.estadoPressionado = false;
    self.galinhaLaranja.estadoPressionado = false;
    self.galinhaRoxa.estadoPressionado = false;
    self.galoAzul.estadoPressionado = false;
    self.galinhaRosa.estadoPressionado = false;
    self.galinhaAmarela.estadoPressionado = false;
}

-(void)bloquearGalosParaEscolha{

    [self voltarParaOEstadoInicial];
    
    self.galoVerde.userInteractionEnabled = false;
    self.galinhaLaranja.userInteractionEnabled = false;
    self.galinhaRoxa.userInteractionEnabled = false;
    self.galoAzul.userInteractionEnabled = false;
    self.galinhaRosa.userInteractionEnabled = false;
    self.galinhaAmarela.userInteractionEnabled = false;
    
    //MASCOTE FALA P/ ESCOLHER O GALO COM SOM MAIOR OU MENOR
    if (_ehPraDescobrirOSomMaior) {
        
        [self liberarGalos];
    }else{
        
        [self liberarGalos];
    }

}

-(void)liberarGalos{
    
    self.galoVerde.userInteractionEnabled = true;
    self.galinhaLaranja.userInteractionEnabled = true;
    self.galinhaRoxa.userInteractionEnabled = true;
    self.galoAzul.userInteractionEnabled = true;
    self.galinhaRosa.userInteractionEnabled = true;
    self.galinhaAmarela.userInteractionEnabled = true;
}

-(void)criarJogada{
    
    //Controles de jogo
    self.estaAguardandoOuvirTodosOsGalos = true;
    self.estaAguardandoEscolherOGaloCorreto = false;
    
    [self voltarParaOEstadoInicial];
    [self sortearTipoDoDesafio];
    [self sortearVolumes];
    [self criarGalos];
}

-(void)acertou{
    self.totalDeAcertos +=1;
    self.totalDeJogadas +=1;
    
    //Chama áudio
    
    [self criarJogada];
}

-(void)errou{
    self.totalDeJogadas +=1;
    
    //Chama áudio
    
    [self criarJogada];
}

- (IBAction)teste:(id)sender {
    
    NSURL *caminhoAudio= [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"tambor" ofType:@"mp3"]];
    AVAudioPlayer *somExercicioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:caminhoAudio error: nil];
    
    [somExercicioPlayer setVolume: 1];
    [somExercicioPlayer prepareToPlay];
    [somExercicioPlayer play];
}

@end
