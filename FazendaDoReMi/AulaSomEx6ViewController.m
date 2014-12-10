//
//  AulaSomEx6ViewController.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 17/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "AulaSomEx6ViewController.h"

@interface AulaSomEx6ViewController ()
@end

@implementation AulaSomEx6ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Chama o update a cada milesegundo
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(update) userInfo:nil repeats: YES];
    
    //Carregamento inicial
    [self carregarComponentesIniciais];

}

-(void)verificaLimiteJogo{
    [[ControladorDeItem sharedManager] chamaVerificadorDeJogo :3 :self.totalDeJogadas];
}

-(void)carregarComponentesIniciais{
    
    //Inicia variaveis de controle do jogo
    self.totalDeAcertos = 0;
    self.totalDeJogadas = 0;
    self.tentativasPorJogada = 1;
    self.estaAguardandoArrastarODisco = true;
    self.estaAguardandoEscolherOItem = true;
    self.jogoFinalizado = false;
    
    //LISTA DE ITENS
    self.listaDeItens = [[NSMutableArray alloc] initWithObjects:
                         @"chocalho",
                         @"flauta",
                         @"piano",
                         @"saxofone",
                         @"tambor",
                         @"violao",
                         @"violino",
                         @"xilofone",
                         
                         @"batedeira",
                         @"frigideira",
                         @"latinhaRefri",
                         @"liquidificador",
                         @"microondas",
                         @"tabuaLegumes",
                         @"talheres",
                         @"torradeira",
                         
                         @"bola",
                         @"caixaDeMusica",
                         @"carro",
                         @"guitarra",
                         @"helicoptero",
                         @"relogio",
                         @"robo",
                         @"skate",
                         @"trem",
                         @"ursoPelucia",
                         nil];
    
    //Botão voltar e gramofone
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoPausaAula: self];
    
    [self criaNovaJogada];

}


/////////////////////////////////////////////////////////////////////////////////////     UPDATE     /////////////////////////////////////////////////////////////////////////////////////////////////


-(void)update{
    
    if (!self.jogoFinalizado) {
        if (self.totalDeJogadas <= 9) {
            
            
            //AGUARDANDO DISCO SER ARRASTADO
            if (_estaAguardandoArrastarODisco) {
                
                if(self.disco1.estadoPressionado){
                    
                    NSLog(@"JOGADA ATUAL: %i", self.totalDeJogadas);
                    NSLog(@"TENTATIVA ATUAL: %i", self.tentativasPorJogada);
                    NSLog(@"Item correto: %@", self.itemCorreto);
                    
                    [self bloqueiaDiscoParaJogada];
                    [self mostrarImagensDosItensParaEscolha];
                }
            }
            
            
            //AGUARDANDO ESCOLHER ITEM
            if (_estaAguardandoEscolherOItem) {
                
                //ESCOLHEU OPCAO 1
                if (self.imagemOpcao1.estadoPressionado){
                    self.estaAguardandoEscolherOItem = false;
                    
                    //ACERTOU
                    if ([self.imagemOpcao1.nome isEqualToString: self.itemCorreto]){
                        [self criaNovaJogada];
                        
                        //ERROU
                    }else{
                        
                        //NOVA TENTATIVA
                        if (self.tentativasPorJogada < 2){
                            [self voltarParaMaisUmaTentativa];
                            
                            //NOVA JOGADA
                        }else{
                            [self criaNovaJogada];
                        }
                    }
                    
                    return;
                    
                    //ESCOLHEU OPCAO 2
                }else if (self.imagemOpcao2.estadoPressionado){
                    self.estaAguardandoEscolherOItem = false;
                    
                    //ACERTOU
                    if ([self.imagemOpcao2.nome isEqualToString: self.itemCorreto]){
                        [self criaNovaJogada];
                        
                        //ERROU
                    }else{
                        
                        //NOVA TENTATIVA
                        if (self.tentativasPorJogada < 2){
                            [self voltarParaMaisUmaTentativa];
                            
                            //NOVA JOGADA
                        }else{
                            [self criaNovaJogada];
                        }
                        
                    }
                    
                    return;
                    
                    //ESCOLHEU OPCAO 3
                }else if (self.imagemOpcao3.estadoPressionado){
                    self.estaAguardandoEscolherOItem = false;
                    
                    //ACERTOU
                    if ([self.imagemOpcao3.nome isEqualToString: self.itemCorreto]){
                        [self criaNovaJogada];
                        
                        //ERROU
                    }else{
                        
                        //NOVA TENTATIVA
                        if (self.tentativasPorJogada < 2){
                            [self voltarParaMaisUmaTentativa];
                            
                            //NOVA JOGADA
                        }else{
                            [self criaNovaJogada];
                        }
                        
                    }
                }
            }
            
            
        }else{
            self.jogoFinalizado = true;
            [[GerenciadorAudio sharedManager] stopAudio];
            [[GerenciadorNavigationController sharedManager].controladorApp popToViewController:[[GerenciadorNavigationController sharedManager]retornaViewControllerStoryBoard:@"mapa"] animated:YES];
        }
        

    }
    
    
}



/////////////////////////////////////////////////////////////////////////////////////     SORTEIOS     /////////////////////////////////////////////////////////////////////////////////////////////////

//MUSICA DO DISCO
-(void)sortearMusicaDoDisco{
    
    //Limpa
    self.itemCorreto = @"";
    
    //Sorteia o indice da musica (sempre diferente do ultimo)
    int auxiliarDoSorteio;
    do {
        auxiliarDoSorteio = arc4random() % self.listaDeItens.count;
    } while (auxiliarDoSorteio == self.indiceDoItemCorreto);
    
    self.indiceDoItemCorreto = auxiliarDoSorteio;
    self.itemCorreto = (NSString*)[self.listaDeItens objectAtIndex: self.indiceDoItemCorreto];
}

//POSICAO DA ALTERNATIVA CORRETA
-(void)sorteiaPosicaoDoItemCorreto{
    
    int auxiliarPosicaoCorreta;
    do {
        auxiliarPosicaoCorreta = arc4random() % 3;
    } while (auxiliarPosicaoCorreta == self.posicaoCorretaDoItem);
    
    //Guarda a posicao
    self.posicaoCorretaDoItem = auxiliarPosicaoCorreta;
    
}

//OUTRAS ALTERNATIVAS
-(void)sorteiaItens{
    
    //SORTEIA ATÉ O INDICE SER DIFERENTE DO CORRETO
    do{
        self.indiceDoItemSecundario1 = arc4random() % self.listaDeItens.count;
    }while(self.indiceDoItemSecundario1 == self.indiceDoItemCorreto);
    
    do{
        self.indiceDoItemSecundario2 = arc4random() % self.listaDeItens.count;
    }while((self.indiceDoItemSecundario2 == self.indiceDoItemCorreto) || (self.indiceDoItemSecundario2 == self.indiceDoItemSecundario1));
    
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(void)mostrarImagensDosItensParaEscolha{
    
//SORTEIA APENAS A 1a TENTATIVA
    if(self.tentativasPorJogada == 1) {
        
        //Sorteia o indice da posicao correta do item (sempre diferente do ultimo)
        [self sorteiaPosicaoDoItemCorreto];
        [self sorteiaItens];
        
        //A partir da posicao correta do item é setado as demais
        switch (self.posicaoCorretaDoItem) {
                
        //POSICAO 1
            case 0:
                [[ControladorDeItem sharedManager]retornaItem:self.itemCorreto: self.imagemOpcao1:@"gestureTap:1:1 + 1"];
                [[ControladorDeItem sharedManager]retornaItem:[NSString stringWithFormat: @"%@", [self.listaDeItens objectAtIndex: self.indiceDoItemSecundario1]]: self.imagemOpcao2:@"gestureTap:1:1 + 1"];
                [[ControladorDeItem sharedManager]retornaItem:[NSString stringWithFormat: @"%@", [self.listaDeItens objectAtIndex: self.indiceDoItemSecundario2]]: self.imagemOpcao3:@"gestureTap:1:1 + 1"];
                
                break;
                
        //POSICAO 2
            case 1:
                [[ControladorDeItem sharedManager]retornaItem:self.itemCorreto: self.imagemOpcao2:@"gestureTap:1:1 + 1"];
                [[ControladorDeItem sharedManager]retornaItem:[NSString stringWithFormat: @"%@", [self.listaDeItens objectAtIndex: self.indiceDoItemSecundario1]]: self.imagemOpcao1:@"gestureTap:1:1 + 1"];
                [[ControladorDeItem sharedManager]retornaItem:[NSString stringWithFormat: @"%@", [self.listaDeItens objectAtIndex: self.indiceDoItemSecundario2]]: self.imagemOpcao3:@"gestureTap:1:1 + 1"];
                
                break;
                
        //POSICAO 3
            case 2:
                [[ControladorDeItem sharedManager]retornaItem:self.itemCorreto: self.imagemOpcao3:@"gestureTap:1:1 + 1"];
                [[ControladorDeItem sharedManager]retornaItem:[NSString stringWithFormat: @"%@", [self.listaDeItens objectAtIndex: self.indiceDoItemSecundario1]]: self.imagemOpcao1:@"gestureTap:1:1 + 1"];
                [[ControladorDeItem sharedManager]retornaItem:[NSString stringWithFormat: @"%@", [self.listaDeItens objectAtIndex: self.indiceDoItemSecundario2]]: self.imagemOpcao2:@"gestureTap:1:1 + 1"];
                
                break;
        }
    }
    
    //Mostra opcoes
    self.imagemOpcao1.hidden = NO;
    self.imagemOpcao2.hidden = NO;
    self.imagemOpcao3.hidden = NO;
    
}

/////////////////////////////////////////////////////////////////////////////////////     JOGADAS     /////////////////////////////////////////////////////////////////////////////////////////////////

//DISCO BLOQUEADO
-(void)bloqueiaDiscoParaJogada{
    
    self.disco1.frame = CGRectMake(200, 600, self.disco1.frame.size.width, self.disco1.frame.size.height);
    self.disco1.userInteractionEnabled = false;
    self.estaAguardandoArrastarODisco = false;
}

//DISCO LIBERADO
-(void)liberaDiscoParaJogada{
    
    self.disco1.hidden = false;
    self.disco1.frame = CGRectMake(200, 600, self.disco1.frame.size.width, self.disco1.frame.size.height);
    self.disco1.userInteractionEnabled = true;
    self.disco1.estadoPressionado = false;
    self.gramofone.estadoPressionado = false;
    
    //Variaveis de controle para update
    self.estaAguardandoArrastarODisco = true;
    self.estaAguardandoEscolherOItem
    += true;
    
    //Mostra discos
    self.imagemOpcao1.hidden = YES;
    self.imagemOpcao2.hidden = YES;
    self.imagemOpcao3.hidden = YES;
    
    //Bloqueia
    self.imagemOpcao1.estadoPressionado = false;
    self.imagemOpcao2.estadoPressionado = false;
    self.imagemOpcao3.estadoPressionado = false;
    
    //Gesture de arrastar p/ o gramofone + Tocar áudio + Esconder disco (opacidade)
    [[ControladorDeItem sharedManager] retornaItemGesture:@"discoAzul" :self.disco1 :self.gramofone :[NSString stringWithFormat: @"gesturePan + 1 + 2:%d:1 + 6:5:0:0:0", self.indiceDoItemCorreto]];
    [[ControladorDeItem sharedManager]retornaItemGesture:@"gramofone" :self.gramofone :self.disco1 :@"gesturePan:1:1 + 7:gramofoneTocando:5:NO:YES:0"];

}

//NOVA TENTATIVA
-(void)voltarParaMaisUmaTentativa{
    self.tentativasPorJogada += 1;

    [self liberaDiscoParaJogada];
}

//NOVA JOGADA
-(void)criaNovaJogada{
    
    //Incrementa as jogadas e restaura as tentaticas
    self.totalDeJogadas += 1;
    self.tentativasPorJogada = 1;
    
    [self sortearMusicaDoDisco];
    [self liberaDiscoParaJogada];
}

-(void)pausarJogo{
}

@end
