//
//  GerenciadorDeAula.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "GerenciadorDeAula.h"

@implementation GerenciadorDeAula

-(id)init{
    self = [super init];
    
    if(self){
        self.listaDeAulas = [[NSMutableArray alloc] init];
        self.listaDeViewControllers = [[NSMutableArray alloc] init];
        [self instanciaAulas];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

//Singleton
+(GerenciadorDeAula*)sharedManager{
    static GerenciadorDeAula *gerenciadorDeAula = nil;
    
    if(!gerenciadorDeAula){
        gerenciadorDeAula = [[super allocWithZone: nil] init];
    }
    return gerenciadorDeAula;
}


-(void)instanciaAulas{
    
    //Exercícios
    Exercicio *aula1Exe1 = [[Exercicio alloc]init:0 nome:@"Som" :@"AulaSomViewController" :NO];
    //Falas do Mascote
    
    
    //Fala
    Fala *aula1Exe1fala1 = [[Fala alloc] init];
    aula1Exe1fala1.caminhoDoAudio = [NSURL URLWithString: @""];
    
    Fala *aula1Exe1fala2 = [[Fala alloc] init];
    aula1Exe1fala2.caminhoDoAudio = [NSURL URLWithString: @""];
    
    
    //Conversa
    Conversa *aula1Exe1conversa1 = [[Conversa alloc] init];
    [[aula1Exe1conversa1 listaDeFalas] addObject: aula1Exe1fala1];
    [[aula1Exe1conversa1 listaDeFalas] addObject: aula1Exe1fala2];
   
    [[[aula1Exe1 mascote] listaDeConversas] addObject:aula1Exe1conversa1];
    
    Aula *aula1 = [[Aula alloc]init];
    aula1.imagemDoBotao = [UIImage imageNamed:@"btnlixeira.png"];
    aula1.frame = CGRectMake(323, 619, 205, 218);
    aula1.nomeDoLugar = @"Casa";
    [aula1 setBackgroundImage:[aula1 imagemDoBotao] forState:UIControlStateNormal];
    [[aula1 listaDeExercicios]addObject: aula1Exe1];

    
    [self.listaDeAulas addObject:aula1];
    
}

@end
