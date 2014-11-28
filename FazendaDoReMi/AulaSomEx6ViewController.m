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

//================================================================= LOGICA DO JOGO; 9 chances, mínimo de 5 acertos e a cada 2x jogadas troca o disco. 3 itens para advinha no quadro.

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Chama o update a cada milesegundo
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(update) userInfo:nil repeats: YES];
    
    //Carregamento inicial
    [self carregarComponentesIniciais];
    
}

-(void)carregarComponentesIniciais{
    
    //Inicia variaveis de controle do jogo
    self.totalDeAcertos = 0;
    self.totalDeJogadas = 0;
    self.tentativasPorJogada = 1;
    self.estaAguardandoArrastarODisco = YES;
    self.estaAguardandoEscolherOItem = YES;
    
    //LISTA DE ITENS
    self.listaDeItens = [[NSMutableArray alloc] initWithObjects: @"piano", @"xilofone", @"violino", @"violao", @"saxofone", @"tambor", @"batedeira", @"tabuaLegumes", @"frigideira", @"latinhaRefri", @"liquidificador", @"microondas", @"talheres", @"torradeira", @"bola", @"caixaDeMusica", @"carro", @"guitarra", @"helicoptero", @"relogio", @"robo", @"skate", @"trem", @"ursoPelucia", nil];
    
    //Botão voltar e gramofone
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoPausaAula: self];
    [[ControladorDeItem sharedManager]retornaItem:@"gramofone": self.gramofone:@"gestureTap:1:1"];
    
    [self criaNovaJogada];
}

-(void)update{
    
    
    //LIMITE DE JOGADAS
    if (self.totalDeJogadas <= 9) {
        
        //ARRASTAR DISCO
        if (_estaAguardandoArrastarODisco) {
            
            if(self.disco1.estadoPressionado){
                
                NSLog(@"\n\nJOGADA ATUAL: %i", self.totalDeJogadas);
                NSLog(@"TENTATIVA ATUAL: %i", self.tentativasPorJogada);
                
                [self bloqueiaDiscoParaJogada];
                [self mostrarImagensDosItensParaEscolha];
            }
        }
        
        
        //ESCOLHER ITEM
        if (_estaAguardandoEscolherOItem) {
            
            //Cadeia de ifs para checar a opcao escolhida
            if (self.imagemOpcao1.estadoPressionado){
                
                //Reconhece uma jogada feita
                self.imagemOpcao1.estadoPressionado = NO;
                
                if ([self.imagemOpcao1.nome isEqualToString: self.itemCorreto]){
                    NSLog(@"\n\nOPC1 - Acertou");
                    
                    [self criaNovaJogada];
                    
                }else{
                    
                    if (self.tentativasPorJogada <= 2){
                        NSLog(@"\n\nERRADO - NOVA TENTATIVA");
                        [self voltarParaMaisUmaTentativa];
                    }else{
                        NSLog(@"\n\nERRADO - NOVA JOGADA");
                        [self criaNovaJogada];
                    }
                    
                }
                
                return;
                
            }else if (self.imagemOpcao2.estadoPressionado){
                
                //Reconhece uma jogada feita
                self.imagemOpcao2.estadoPressionado = NO;
                
                if ([self.imagemOpcao2.nome isEqualToString: self.itemCorreto]){
                    NSLog(@"\n\nOPC2 - Acertou");
                    [self criaNovaJogada];
                    
                }else{
                    
                    if (self.tentativasPorJogada <= 2){
                        NSLog(@"\n\nERRADO - NOVA TENTATIVA");
                        [self voltarParaMaisUmaTentativa];
                    }else{
                        NSLog(@"\n\nERRADO - NOVA JOGADA");
                        [self criaNovaJogada];
                    }
                    
                }
                
                return;
                
            }else if (self.imagemOpcao3.estadoPressionado){
                
                //Reconhece uma jogada feita
                self.imagemOpcao3.estadoPressionado = NO;
                
                if ([self.imagemOpcao3.nome isEqualToString: self.itemCorreto]){
                    NSLog(@"\n\nOPC3 - Acertou");
                    
                    [self criaNovaJogada];
                    
                }else{
                    
                    if (self.tentativasPorJogada <= 2){
                        NSLog(@"\n\nERRADO - NOVA TENTATIVA");
                        [self voltarParaMaisUmaTentativa];
                        
                    }else{
                        NSLog(@"\n\nERRADO - NOVA JOGADA");
                        [self criaNovaJogada];
                    }
                    
                }
            }
            
            
        }
        
        
    }else{
        NSLog(@"\n\nJOGO FINALIZADO!");
    }
    
    
}



/////////////////////////////////////////////////////////////////////////////////////     SORTEIOS     /////////////////////////////////////////////////////////////////////////////////////////////////

//MUSICA DO DISCO
-(void)sortearMusicaDoDisco{
    
    //Sorteia o indice da musica (sempre diferente do ultimo)
    int auxiliarDoSorteio;
    do {
        auxiliarDoSorteio = arc4random() % self.listaDeItens.count;
    } while (auxiliarDoSorteio == self.indiceDoItemCorreto);
    
    self.indiceDoItemCorreto = auxiliarDoSorteio;
    self.itemCorreto = (NSString*)[self.listaDeItens objectAtIndex: self.indiceDoItemCorreto];
    
    
}

//POSICAO DA ALTERNATIVA CORRETA
-(void)sorteiaPosicaoCorreta{
    
    int auxiliarPosicaoCorreta;
    do {
        auxiliarPosicaoCorreta = arc4random() % 3;
    } while (auxiliarPosicaoCorreta == self.posicaoCorretaDoItem);
    self.posicaoCorretaDoItem = auxiliarPosicaoCorreta;
    
}

//POSICAO DAS OUTRASALTERNATIVAS
-(void)sorteiaDemaisPosicoes{
    
    do{
        self.posicaoSecundaria1 = arc4random() % self.listaDeItens.count;
        
    }while(self.posicaoSecundaria1 == self.posicaoCorretaDoItem);
    
    do{
        self.posicaoSecundaria2 = arc4random() % self.listaDeItens.count;
        
    }while((self.posicaoSecundaria2 == self.posicaoCorretaDoItem) || (self.posicaoSecundaria2 == self.posicaoSecundaria1));
    
}

-(void)mostrarImagensDosItensParaEscolha{
    
    if (self.tentativasPorJogada != 2) {
        
        //Sorteia o indice da posicao correta do item (sempre diferente do ultimo)
        [self sorteiaPosicaoCorreta];
        [self sorteiaDemaisPosicoes];
        
        
        //A partir da posicao correta do item é sorteado as demais
        switch (self.posicaoCorretaDoItem) {
                
                //POSICAO 1
            case 0:
                [[ControladorDeItem sharedManager]retornaItem:self.itemCorreto: self.imagemOpcao1:@"gestureTap:1:1 + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];
                [[ControladorDeItem sharedManager]retornaItem:[NSString stringWithFormat: @"%@", [self.listaDeItens objectAtIndex: self.posicaoSecundaria1]]: self.imagemOpcao2:@"gestureTap:1:1 + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];
                [[ControladorDeItem sharedManager]retornaItem:[NSString stringWithFormat: @"%@", [self.listaDeItens objectAtIndex: self.posicaoSecundaria2]]: self.imagemOpcao3:@"gestureTap:1:1 + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];
                
                break;
                
                //POSICAO 2
            case 1:
                [[ControladorDeItem sharedManager]retornaItem:self.itemCorreto: self.imagemOpcao2:@"gestureTap:1:1 + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];
                [[ControladorDeItem sharedManager]retornaItem:[NSString stringWithFormat: @"%@", [self.listaDeItens objectAtIndex: self.posicaoSecundaria1]]: self.imagemOpcao1:@"gestureTap:1:1 + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];
                [[ControladorDeItem sharedManager]retornaItem:[NSString stringWithFormat: @"%@", [self.listaDeItens objectAtIndex: self.posicaoSecundaria2]]: self.imagemOpcao3:@"gestureTap:1:1 + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];
                
                break;
                
                //POSICAO 3
            case 2:
                [[ControladorDeItem sharedManager]retornaItem:self.itemCorreto: self.imagemOpcao3:@"gestureTap:1:1 + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];
                [[ControladorDeItem sharedManager]retornaItem:[NSString stringWithFormat: @"%@", [self.listaDeItens objectAtIndex: self.posicaoSecundaria1]]: self.imagemOpcao1:@"gestureTap:1:1 + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];
                [[ControladorDeItem sharedManager]retornaItem:[NSString stringWithFormat: @"%@", [self.listaDeItens objectAtIndex: self.posicaoSecundaria2]]: self.imagemOpcao2:@"gestureTap:1:1 + 1 + 2:0 + 3:5.0:5.0:1.0:1.5"];
                
                break;
        }
        
        self.imagemOpcao1.hidden = NO;
        self.imagemOpcao2.hidden = NO;
        self.imagemOpcao3.hidden = NO;
        
    }
    
    
}

-(void)bloqueiaDiscoParaJogada{
    
    self.disco1.frame = CGRectMake(160, 600, self.disco1.frame.size.width, self.disco1.frame.size.height);
    self.disco1.userInteractionEnabled = NO;
    
    self.estaAguardandoArrastarODisco = NO;
}

-(void)liberaDiscoParaJogada{
    
    self.disco1.hidden = NO;
    self.disco1.frame = CGRectMake(160, 600, self.disco1.frame.size.width, self.disco1.frame.size.height);
    self.disco1.userInteractionEnabled = YES;
    self.disco1.estadoPressionado = NO;
    
    self.estaAguardandoArrastarODisco = YES;
    
    //Gesture de arrastar p/ o gramofone + Tocar áudio + Esconder disco (opacidade)
    [[ControladorDeItem sharedManager] retornaItemGesture:@"discoAzul" :self.disco1 :self.gramofone :[NSString stringWithFormat: @"gesturePan + 1 + 2:%d + 6:5:0:0:0", self.indiceDoItemCorreto]];
    
    if (self.disco1.estadoPressionado) {
        NSLog(@"DISCO PRESSIONADO");
    }else{
        NSLog(@"DISCO NAO PRESSIONADO");
    }
    
}

-(void)voltarParaMaisUmaTentativa{
    self.tentativasPorJogada += 1;
    
    self.imagemOpcao1.hidden = YES;
    self.imagemOpcao2.hidden = YES;
    self.imagemOpcao3.hidden = YES;
    
    [self liberaDiscoParaJogada];
}

-(void)criaNovaJogada{
    
    self.totalDeJogadas += 1;
    self.tentativasPorJogada = 1;
    
    self.imagemOpcao1.hidden = YES;
    self.imagemOpcao2.hidden = YES;
    self.imagemOpcao3.hidden = YES;
    
    [self sortearMusicaDoDisco];
    [self liberaDiscoParaJogada];
    
}

-(void)pausarJogo{
    
}

@end
