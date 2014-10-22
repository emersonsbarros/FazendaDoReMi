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


//Cria aulas
-(void)instanciaAulas{
    
    [self criaAulaCasa];
    
}


////////////////////////////// AULA CASA ////////////////////////////////

//Cria Aula
-(void)criaAulaCasa{
    
    Aula *aula = [[Aula alloc]init];
    aula.frame = CGRectMake(323, 619, 205, 218);
    aula.nomeDoLugar = @"Casa";
    [aula setBackgroundImage:[UIImage imageNamed:@"btnlixeira.png"] forState:UIControlStateNormal];
    
    //Exercicios
    [self criaCasaExercicio1:aula];
    
    
    
    //Add aula no banco
    [self.listaDeAulas addObject:aula];
    
}

//Cria exercicio
-(void)criaCasaExercicio1:(Aula*)aula{
    
    //Exercícios
    Exercicio *exercicio = [[Exercicio alloc]init:0 nome:@"Som" :@"AulaSomEx1ViewController" :NO];
    
    //Fala
    Fala *fala = [[Fala alloc] init];
    fala.caminhoDoAudio = [NSURL URLWithString: @""];
    
    Fala *fala2 = [[Fala alloc] init];
    fala2.caminhoDoAudio = [NSURL URLWithString: @""];
    
    
    //Conversa
    Conversa *conversa = [[Conversa alloc] init];
    [[conversa listaDeFalas] addObject: fala];
    [[conversa listaDeFalas] addObject: fala2];
    [[[exercicio mascote] listaDeConversas] addObject:conversa];
    
    
    [[aula listaDeExercicios]addObject:exercicio];
    
}



////////////////////// AULA GALINHEIRO ////////////////////////////////



@end
