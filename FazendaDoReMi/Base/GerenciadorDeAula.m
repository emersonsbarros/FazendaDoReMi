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
    [self criaAulaGalinheiro];
    [self criaAulaLago];
    [self criaAulaCurral];
    [self criaAulaCeleiro];
    [self criaAulaHorta];
    [self criaAulaCatavento];
    [self criaAulaEstabulo];
    
    [self criaAulaJogos];
}

//////////////////////////// JOGOS PARTE /////////////////////////////////

-(NSArray*)retornaExercicio:(NSString*)nomeAula :(NSString*)nomeExercicio{
    for(Aula *aula in self.listaDeAulas){
        if([aula.nomeDoLugar isEqualToString:nomeAula]){
            for(Exercicio *ex in aula.listaDeExercicios){
                if([ex.nome isEqualToString:nomeExercicio]){
                    NSArray *lista = [NSArray arrayWithObjects:aula,ex, nil];
                    return lista;
                }
            }
        }
    }
    return NULL;
}


-(void)criaAulaJogos{
    Aula *aula = [[Aula alloc] init];
    aula.frame = CGRectMake(0, 0, 0, 0);
    aula.nomeDoLugar = @"Jogos";
    [aula setBackgroundImage:[UIImage imageNamed:@"btoCasa.png"] forState:UIControlStateNormal];
    
    //Exercicios
    [self criaJogo1: aula];
   
    
    //Add aula no banco
    [self.listaDeAulas addObject: aula];

}

-(void)criaJogo1:(Aula*)aula{
    //Exercícios
    Exercicio *exercicio = [[Exercicio alloc]init:0 nome:@"FlapCao" :@"JogoFlapCaoViewController": NO];
    
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
    
    //Add o exercício a aula
    [[aula listaDeExercicios]addObject: exercicio];

}

////////////////////////////// AULA CASA ////////////////////////////////

//Cria Aula
-(void)criaAulaCasa{
    
    Aula *aula = [[Aula alloc] init];
    aula.frame = CGRectMake(435, 20, 156, 152);
    aula.nomeDoLugar = @"Casa";
    [aula setBackgroundImage:[UIImage imageNamed:@"btoCasa.png"] forState:UIControlStateNormal];
    
    //Exercicios
    [self criaCasaExercicio1: aula];
    //    [self criaCasaExercicio2: aula];
    [self criaCasaExercicio3: aula];
    [self criaCasaExercicio4: aula];
    [self criaCasaExercicio5: aula];
    [self criaCasaExercicio6: aula];
    
    //Add aula no banco
    [self.listaDeAulas addObject: aula];
}

//Exercicio - CASA / SALA
-(void)criaCasaExercicio1:(Aula*)aula{
    
    //Exercícios
    Exercicio *exercicio = [[Exercicio alloc]init:0 nome:@"Som" :@"AulaSomEx1ViewController": NO];
    
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
    
    //Add o exercício a aula
    [[aula listaDeExercicios]addObject: exercicio];
    
}

//Exercicio - CASA / COZINHA
-(void)criaCasaExercicio2:(Aula*)aula{
    
    //Exercícios
    Exercicio *exercicio = [[Exercicio alloc]init:1 nome:@"Som" :@"AulaSomEx2ViewController": NO];
    
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
    
    //Add o exercício a aula
    [[aula listaDeExercicios]addObject: exercicio];
    
}

//Exercicio - CASA / BRINQUEDOTECA
-(void)criaCasaExercicio3:(Aula*)aula{
    
    //Exercícios
    Exercicio *exercicio = [[Exercicio alloc]init:2 nome:@"Som" :@"AulaSomEx3ViewController": NO];
    
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
    
    //Add o exercício a aula
    [[aula listaDeExercicios]addObject: exercicio];
    
}

//Exercicio - GALINHEIRO
-(void)criaCasaExercicio4:(Aula*)aula{
    
    //Exercícios
    Exercicio *exercicio = [[Exercicio alloc]init:3 nome:@"Som" :@"AulaSomEx4ViewController": NO];
    
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
    
    //Add o exercício a aula
    [[aula listaDeExercicios]addObject: exercicio];
    
}

//Exercicio - VIVEIRO
-(void)criaCasaExercicio5:(Aula*)aula{
    
    //Exercícios
    Exercicio *exercicio = [[Exercicio alloc]init:4 nome:@"Som" :@"AulaSomEx5ViewController": NO];
    
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
    
    //Add o exercício a aula
    [[aula listaDeExercicios]addObject: exercicio];
    
}

//Exercicio - QUARTO
-(void)criaCasaExercicio6:(Aula*)aula{
    
    //Exercícios
    Exercicio *exercicio = [[Exercicio alloc]init:5 nome:@"Som" :@"AulaSomEx6ViewController": NO];
    
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
    
    //Add o exercício a aulak
    [[aula listaDeExercicios]addObject: exercicio];
    
}


////////////////////// AULA GALINHEIRO ////////////////////////////////

//Cria Aula
-(void)criaAulaGalinheiro{
    
    Aula *aula = [[Aula alloc]init];
    aula.frame = CGRectMake(260, 520, 100, 98);
    aula.nomeDoLugar = @"Galinheiro";
    [aula setBackgroundImage:[UIImage imageNamed:@"btoGalinheiro.png"] forState:UIControlStateNormal];
    
    //Exercicios
    
    //Add aula no banco
    [self.listaDeAulas addObject: aula];
}

//////////////////////////// AULA LAGO ////////////////////////////////

//Cria Aula
-(void)criaAulaLago{
    
    Aula *aula = [[Aula alloc]init];
    aula.frame = CGRectMake(115, 205, 257, 70);
    aula.nomeDoLugar = @"Lago";
    [aula setBackgroundImage:[UIImage imageNamed:@"btoLago.png"] forState:UIControlStateNormal];
    
    //Exercicios
    
    //Add aula no banco
    [self.listaDeAulas addObject: aula];
}

//////////////////////////// AULA CURRAL ////////////////////////////////

//Cria Curral
-(void)criaAulaCurral{
    
    Aula *aula = [[Aula alloc]init];
    aula.frame = CGRectMake(210, 320, 156, 134);
    aula.nomeDoLugar = @"Curral";
    [aula setBackgroundImage:[UIImage imageNamed:@"btoCurral.png"] forState:UIControlStateNormal];
    
    //Exercicios
    
    //Add aula no banco
    [self.listaDeAulas addObject: aula];
}

//////////////////////////// AULA CELEIRO ////////////////////////////////

//Cria Celeiro
-(void)criaAulaCeleiro{
    
    Aula *aula = [[Aula alloc]init];
    aula.frame = CGRectMake(185, 85, 94, 107);
    aula.nomeDoLugar = @"Celeiro";
    [aula setBackgroundImage:[UIImage imageNamed:@"btoCeleiro.png"] forState:UIControlStateNormal];
    
    //Exercicios
    
    //Add aula no banco
    [self.listaDeAulas addObject: aula];
}

//////////////////////////////// AULA HORTA ////////////////////////////////


//Cria Horta
-(void)criaAulaHorta{
    
    Aula *aula = [[Aula alloc]init];
    aula.frame = CGRectMake(650, 160, 194, 98);
    aula.nomeDoLugar = @"Horta";
    [aula setBackgroundImage:[UIImage imageNamed:@"btoHorta.png"] forState:UIControlStateNormal];
    
    //Exercicios
    
    //Add aula no banco
    [self.listaDeAulas addObject: aula];
}

//////////////////////////// AULA CATAVENTO ////////////////////////////////

//Cria Catavento
-(void)criaAulaCatavento{
    
    Aula *aula = [[Aula alloc]init];
    aula.frame = CGRectMake(810, 125, 139, 160);
    aula.nomeDoLugar = @"Catavento";
    [aula setBackgroundImage:[UIImage imageNamed:@"btoCatavento.png"] forState:UIControlStateNormal];
    
    //Exercicios
    
    //Add aula no banco
    [self.listaDeAulas addObject: aula];
}

//////////////////////////// AULA ESTÁBULO ////////////////////////////////

//Cria Estabulo
-(void)criaAulaEstabulo{
    
    Aula *aula = [[Aula alloc]init];
    aula.frame = CGRectMake(660, 400, 140, 81);
    aula.nomeDoLugar = @"Estabulo";
    [aula setBackgroundImage:[UIImage imageNamed:@"btoEstabulo.png"] forState:UIControlStateNormal];
    
    //Exercicios
    
    //Add aula no banco
    [self.listaDeAulas addObject: aula];
}


@end
