//
//  Sinfonia.m
//  DesenhoPartitura
//
//  Created by Vinicius Resende Fialho on 07/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "Sinfonia.h"

#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#define CASE(str)                       if ([__s__ isEqualToString:(str)])
#define SWITCH(s)                       for (NSString *__s__ = (s); ; )
#define DEFAULT


#define n64th 0.0620
#define n32th 0.120
#define n16th 0.20
#define eighth 0.4
#define quarter 1.0
#define half 1.5
#define whole 3.5

//#define n64th 0.0625
//#define n32th 0.125
//#define n16th 0.25
//#define eighth 0.5
//#define quarter 1.0
//#define half 2.0
//#define whole 4.0

@implementation Sinfonia

///////////////////////////////////// Sington ///////////////////////////////////////

+(Sinfonia*)sharedManager{
    static Sinfonia *unicoInstrumento = nil;
    if(!unicoInstrumento){
        unicoInstrumento = [[super allocWithZone:nil]init];
    }
    return unicoInstrumento;
}

-(id)init{
    self = [super init];
    if(self){
        
        self.listaPartiturasSinfonia = [[NSMutableArray alloc]init];
        self.controleVelocidaTranNota = 0.0;
        [[DataBaseInstrumento sharedManager] addInstrumentosPadroesDoApplicativo];
        
        self.estadoBotaoLimpar = true;
        self.estadoBotaoPlay = true;
        
        [self criaSoundBank];
        
        self.auxPlayPartituraProblema = NO;
        
    }
    
    return self;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


-(void)criaSoundBank{
    
    auxListaSoundBank = 1;
    self.listaSoundBank = [[NSMutableArray alloc]init];
    
    for(int i=0;i<8;i++){
        PartituraSinfonia *bank = [[PartituraSinfonia alloc]init];
        [self.listaSoundBank addObject:bank];
    }
    
}

////////////////////////////////// Efeitos para Notas //////////////////////////////////

-(void)mostraEfeito:(Nota*)notes{
    
    Nota *notaBrilha = notes;
    notaBrilha.imagemNota.alpha = 0.5;
    
}


-(void)desapareceEfeito:(Nota*)notes{
    
    Nota *notaBrilha = notes;
    notaBrilha.imagemNota.alpha = 1.0;
    
}


/////////////////////////////// Metodos Tocar Notas ///////////////////////////////////////////

-(void)trocaInstrumentoESoundBank{
    
    [self.listaSoundBank removeAllObjects];
    
    auxListaSoundBank = 1;
    //self.listaSoundBank = [[NSMutableArray alloc]init];
    
    for(int i=0;i<8;i++){
        PartituraSinfonia *bank = [[PartituraSinfonia alloc]init];
        [self.listaSoundBank addObject:bank];
    }
    
}

//Toca uma nota
-(void)tocarUmaNota:(NSMutableArray*)listaSons :(NSString*)nomeInstrumentoPlist{
    
    PartituraSinfonia *partituraPararNota = [self.listaSoundBank objectAtIndex:auxListaSoundBank-1];
    [partituraPararNota.soundBank allNotesOff];
    
    if(auxListaSoundBank == 8) {
        auxListaSoundBank = 1;
    }else {
        auxListaSoundBank += 1;
    }
    
    PartituraSinfonia *partitura = [self.listaSoundBank objectAtIndex:auxListaSoundBank-1];
    
    partitura.instrumento = [[DataBaseInstrumento sharedManager]retornaInstrumento:nomeInstrumentoPlist];
    [partitura.soundBank setSoundBank:partitura.instrumento.nomeInstrumento];
    
    partitura.auxIndiceNotas = 0;

    partitura.listaOrdemInstrumento = partitura.instrumento.ordemNotasInstrumento;
    
    partitura.listaPartituraSinfonia = [[NSMutableArray alloc]init];
    
    Partitura *part = [[Partitura alloc]init];
    [partitura.listaPartituraSinfonia addObject:part];
    [[partitura.listaPartituraSinfonia objectAtIndex:0]setListaNotasPartitura:listaSons];

    [self tocarPlayerPartitura];
}



//Toca uma lista de notas
-(void)tocarTodasNotasEdicao:(NSMutableArray*)listaSons :(NSString*)nomeInstrumentoPlist{
   
    PartituraSinfonia *partituraPararNota = [self.listaSoundBank objectAtIndex:auxListaSoundBank-1];
    [partituraPararNota.soundBank allNotesOff];
    
    if(auxListaSoundBank == 8) {
        auxListaSoundBank = 1;
    }else {
        auxListaSoundBank += 1;
    }
    
    PartituraSinfonia *partitura = [self.listaSoundBank objectAtIndex:auxListaSoundBank-1];

    
    partitura.instrumento = [[DataBaseInstrumento sharedManager]retornaInstrumento:nomeInstrumentoPlist];
    
    [partitura.soundBank setSoundBank:partitura.instrumento.nomeInstrumento];
    
    partitura.auxIndiceNotas = 0;
    
    partitura.listaOrdemInstrumento = partitura.instrumento.ordemNotasInstrumento;
    
    partitura.listaPartituraSinfonia = [[NSMutableArray alloc]init];
    
    Partitura *part = [[Partitura alloc]init];
    [partitura.listaPartituraSinfonia addObject:part];
    [[partitura.listaPartituraSinfonia objectAtIndex:0]setListaNotasPartitura:listaSons];
    
    self.auxPlayPartituraProblema = YES;
    
    [self tocarPlayerPartitura];
    

    [PlayerPartituraEdicaoViewController sharedManager].lblStopPartitura.hidden = NO;

}


////////////////////////////// Metodos Player ////////////////////////////////////

-(void)tocarPlayerPartitura{
        
    PartituraSinfonia *partitura = [self.listaSoundBank objectAtIndex:auxListaSoundBank-1];
    
    partitura.auxIndiceNotas = auxIndiceNotasPausa;
    
    NSString *nomePrimeiroMetodo = partitura.instrumento.metodoPrimeiroTocar;
    
    SEL selectors1 = NSSelectorFromString(nomePrimeiroMetodo);
    
    [self performSelector:selectors1 withObject:NULL afterDelay:0.0];
    

}

-(void)pausePlayerPartitura {
    auxIndiceNotasPausa = auxIndiceNotas;
    auxIndiceNotas = [[[[self listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]count]-1;
}

-(void)repetePlayerPartitura{
    Nota *nota = [[[[self listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:auxIndiceNotas-1];
    
    self.contadorScrollDesloca = 500;
    self.compassoAtual = 0;
    
    nota.imagemNota.alpha = 1.0;
    auxIndiceNotas = 0;
}

-(void)pararPlayerPartitura{
    
     PartituraSinfonia *partitura = [self.listaSoundBank objectAtIndex:auxListaSoundBank-1];
     Partitura *listaNotas = [partitura.listaPartituraSinfonia firstObject];
    
     if(listaNotas.listaNotasPartitura.count > 0){
        
         for(Nota *not in listaNotas.listaNotasPartitura){
             not.imagemNota.alpha = 1.0;
         }
         
         partitura.auxIndiceNotas = listaNotas.listaNotasPartitura.count;
        
         CGPoint bottomOffset = CGPointMake(0,0);
         [[ComponenteScrollEdicao sharedManager].scrollPartitura setContentOffset:bottomOffset animated:YES];
         [ComponenteScrollEdicao sharedManager].contadorIndiceNota = [DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count-1;
        
     }
    
}

///////////////////////////////  Piano  ///////////////////////////////////////////////

-(float)pegaTempoNota:(Nota*)nota{
    
    float tempo = 0.0;
    
    if([nota.tipoNota isEqualToString:@"64th"]){
        tempo = n64th;
    }else if([nota.tipoNota isEqualToString:@"32th"]){
        tempo = n32th;
    }else if([nota.tipoNota isEqualToString:@"16th"]){
        tempo = n16th;
    }else if([nota.tipoNota isEqualToString:@"eighth"]){
        tempo = eighth;
    }else if([nota.tipoNota isEqualToString:@"quarter"]){
        tempo = quarter;
    }else if([nota.tipoNota isEqualToString:@"half"]){
        tempo = half;
    }else if([nota.tipoNota isEqualToString:@"whole"]){
        tempo = whole;
    }else{
        NSLog(@"deu errado temopo");
    }
    
    return tempo;
}


-(void)teste{
    self.estadoBotaoLimpar = true;
    self.estadoBotaoPlay = true;
    NSLog(@"oiii");
}


-(void)liberaInserirNota:(PartituraSinfonia*)part{
    
    part.auxIndiceNotas = 0;
    
    [PlayerPartituraEdicaoViewController sharedManager].lblLimparPartitura.hidden = NO;
    [PlayerPartituraEdicaoViewController sharedManager].lblPlayPartitura.hidden = NO;
    [ListaInstrumentoViewController sharedManager].view.hidden = NO;
    [ComponenteScrollEdicao sharedManager].tocandoBloqueioInserirNota = YES;
    [PlayerPartituraEdicaoViewController sharedManager].lblStopPartitura.hidden = YES;
    
    self.auxPlayPartituraProblema = NO;
    
    self.estadoBotaoLimpar = true;
    self.estadoBotaoPlay = true;
    NSLog(@"play");
    
    
}

-(void)tocarpentagrama1{
    
    PartituraSinfonia *partitura = [self.listaSoundBank objectAtIndex:auxListaSoundBank-1];
    
    if(partitura.auxIndiceNotas >= [[[partitura.listaPartituraSinfonia objectAtIndex:0]listaNotasPartitura]count]){
        int v = [[[partitura.listaPartituraSinfonia objectAtIndex:0]listaNotasPartitura]count] - 1;
        Nota *ultimaNota = [[[partitura.listaPartituraSinfonia objectAtIndex:0]listaNotasPartitura]objectAtIndex:v];
        if(self.auxPlayPartituraProblema)[self performSelector:@selector(liberaInserirNota:) withObject:partitura afterDelay:[self pegaTempoNota:ultimaNota]+0.0];
        else [self performSelector:@selector(teste) withObject:nil afterDelay:[self pegaTempoNota:ultimaNota]+0.0];
        
    }else{
        
        Nota *nota = [[[partitura.listaPartituraSinfonia objectAtIndex:0]listaNotasPartitura]objectAtIndex:partitura.auxIndiceNotas];

        NSString *nomeNota = [nota nomeNota];
        NSString *nomeNotaTransformada;
        
        if([nomeNota isEqualToString:@"C"]){
            nomeNotaTransformada = @"Dó";
        }else if([nomeNota isEqualToString:@"D"]){
            nomeNotaTransformada = @"Ré";
        }
        else if([nomeNota isEqualToString:@"E"]){
            nomeNotaTransformada = @"Mi";
        }
        else if([nomeNota isEqualToString:@"F"]){
            nomeNotaTransformada = @"Fá";
        }
        else if([nomeNota isEqualToString:@"G"]){
            nomeNotaTransformada = @"Sol";
        }
        else if([nomeNota isEqualToString:@"A"]){
            nomeNotaTransformada = @"La";
        }
        else if([nomeNota isEqualToString:@"B"]){
            nomeNotaTransformada = @"Si";
        }else{
            nomeNotaTransformada = @"Pausa";
        }
        
        NSString *nivelNota = [nota oitava];
        NSString *tomEncurtado = [nota tom];
        NSString *notaFinal = [NSString stringWithFormat:@"%@%@",nivelNota,nomeNota];
        NSString *tempoNota = [nota tipoNota];
        self.compassoAtual = [[nota numeroCompasso]intValue];
        self.textoDescricaoNota = [NSString stringWithFormat:@"%@%@%@",nivelNota,@" ",nomeNotaTransformada];


        float tempo = 0.0;
        float volume = 0.4;


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
            volume = 10.0;
        }else{
            NSLog(@"deu errado temopo");
        }


        if ([tomEncurtado rangeOfString:@"-1"].location != NSNotFound){
            int indiceDescerEscala = -1;
            
            NSLog(@"antes %@",notaFinal);
            notaFinal  = [partitura.instrumento retornaIndiceListaMusicas:notaFinal:indiceDescerEscala];
            NSLog(@"depois- %@",notaFinal);
            
        }else if ([tomEncurtado rangeOfString:@"1"].location != NSNotFound){
            int indiceSubirEscala = 1;
            
            NSLog(@"antes %@",notaFinal);
            notaFinal  = [partitura.instrumento retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
            NSLog(@"depois+ %@",notaFinal);
            
        }else if ([tomEncurtado rangeOfString:@"-2"].location != NSNotFound){
            int indiceDescerEscala = -2;
            
            NSLog(@"antes %@",notaFinal);
            notaFinal  = [partitura.instrumento retornaIndiceListaMusicas:notaFinal:indiceDescerEscala];
            NSLog(@"depois-- %@",notaFinal);
            
        }else if ([tomEncurtado rangeOfString:@"2"].location != NSNotFound){
            int indiceSubirEscala = 2;
            
            NSLog(@"antes %@",notaFinal);
            [partitura.instrumento retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
            NSLog(@"depois++ %@",notaFinal);
            
        }else if([notaFinal isEqualToString:@""]){
            
            volume = 0.0;
            
        }else{
            
        }

        if(partitura.auxIndiceNotas >0){
            Nota *nota = [[[partitura.listaPartituraSinfonia objectAtIndex:0]listaNotasPartitura]objectAtIndex:partitura.auxIndiceNotas-1];
           [self desapareceEfeito:nota];
        }

        [self mostraEfeito:nota];

        
        int retornaNotadoXML = [partitura.instrumento retornarNumeroNotaInstrumento:partitura.listaOrdemInstrumento:notaFinal];
        
    
        [partitura.soundBank queueNote:retornaNotadoXML gain:volume];
        [partitura.soundBank  playQueuedNotes];

        
        partitura.auxIndiceNotas++;
        NSLog(@"notas %d %f %@-%@",partitura.auxIndiceNotas,tempo,nota.oitava,nota.nomeNota);

        
        if([tempoNota isEqualToString:@"quarter"]) tempo = tempo-self.controleVelocidaTranNota;
        [NSTimer scheduledTimerWithTimeInterval:tempo target:self selector:@selector(tocarpentagrama1) userInfo:nil repeats:NO];
            

    
    }
    
}

/////////////////////////////// Violao ///////////////////////////////////////////////


-(void)tocarPrimeiroPentagramaViolao{
    
    PartituraSinfonia *partitura = [self.listaSoundBank objectAtIndex:auxListaSoundBank-1];

    if(partitura.auxIndiceNotas >= [[[partitura.listaPartituraSinfonia objectAtIndex:0]listaNotasPartitura]count]){
        int v = [[[partitura.listaPartituraSinfonia objectAtIndex:0]listaNotasPartitura]count] - 1;
        Nota *ultimaNota = [[[partitura.listaPartituraSinfonia objectAtIndex:0]listaNotasPartitura]objectAtIndex:v];
        if(self.auxPlayPartituraProblema)[self performSelector:@selector(liberaInserirNota:) withObject:partitura afterDelay:[self pegaTempoNota:ultimaNota]+0.0];
        else [self performSelector:@selector(teste) withObject:nil afterDelay:[self pegaTempoNota:ultimaNota]+0.0];
        
    }else{
        
    Nota *nota = [[[partitura.listaPartituraSinfonia objectAtIndex:0]listaNotasPartitura]objectAtIndex:partitura.auxIndiceNotas];
        
    NSString *nomeNota = [nota nomeNota];
    NSString *nomeNotaTransformada;
    
    if([nomeNota isEqualToString:@"C"]){
        nomeNotaTransformada = @"Dó";
    }else if([nomeNota isEqualToString:@"D"]){
        nomeNotaTransformada = @"Ré";
    }
    else if([nomeNota isEqualToString:@"E"]){
        nomeNotaTransformada = @"Mi";
    }
    else if([nomeNota isEqualToString:@"F"]){
        nomeNotaTransformada = @"Fá";
    }
    else if([nomeNota isEqualToString:@"G"]){
        nomeNotaTransformada = @"Sol";
    }
    else if([nomeNota isEqualToString:@"A"]){
        nomeNotaTransformada = @"La";
    }
    else if([nomeNota isEqualToString:@"B"]){
        nomeNotaTransformada = @"Si";
    }else{
        nomeNotaTransformada = @"Pausa";
    }
    
    NSString *nivelNota = [nota oitava];
    NSString *tomEncurtado = [nota tom];
    NSString *notaFinal = [NSString stringWithFormat:@"%@%@",nivelNota,nomeNota];
    NSString *tempoNota = [nota tipoNota];
    self.compassoAtual = [[nota numeroCompasso]intValue];
    self.textoDescricaoNota = [NSString stringWithFormat:@"%@%@%@",nivelNota,@" ",nomeNotaTransformada];
        
       
    float tempo = 0.0;
    float volume = 0.4;
    
    
    
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
        volume = 10.0;
    }else{
        NSLog(@"deu errado temopo");
    }
    
    
    if ([tomEncurtado rangeOfString:@"-1"].location != NSNotFound){
        int indiceDescerEscala = -1;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [partitura.instrumento retornaIndiceListaMusicas:notaFinal:indiceDescerEscala];
        NSLog(@"depois- %@",notaFinal);
        
    }else if ([tomEncurtado rangeOfString:@"1"].location != NSNotFound){
        int indiceSubirEscala = 1;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [partitura.instrumento retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois+ %@",notaFinal);
        
    }else if ([tomEncurtado rangeOfString:@"-2"].location != NSNotFound){
        int indiceDescerEscala = -2;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [partitura.instrumento retornaIndiceListaMusicas:notaFinal:indiceDescerEscala];
        NSLog(@"depois-- %@",notaFinal);
        
    }else if ([tomEncurtado rangeOfString:@"2"].location != NSNotFound){
        int indiceSubirEscala = 2;
        
        NSLog(@"antes %@",notaFinal);
        [partitura.instrumento retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois++ %@",notaFinal);
        
    }else if([notaFinal isEqualToString:@""]){
        
        volume = 0.0;
        
    }else{
        
    }
  
    if(partitura.auxIndiceNotas >0){
        Nota *nota = [[[partitura.listaPartituraSinfonia objectAtIndex:0]listaNotasPartitura]objectAtIndex:partitura.auxIndiceNotas-1];
        [self desapareceEfeito:nota];
    }
    
    [self mostraEfeito:nota];
    
    
    int retornaNotadoXML = [partitura.instrumento retornarNumeroNotaInstrumento:partitura.listaOrdemInstrumento:notaFinal];
    
    
    [partitura.soundBank queueNote:retornaNotadoXML gain:volume];
    [partitura.soundBank  playQueuedNotes];
    
    
    partitura.auxIndiceNotas++;
    NSLog(@"notas %d %f %@-%@",partitura.auxIndiceNotas,tempo,nota.oitava,nota.nomeNota);
    auxIndiceNotas++;
    
            if([tempoNota isEqualToString:@"quarter"]) tempo = tempo-self.controleVelocidaTranNota;
        [NSTimer scheduledTimerWithTimeInterval:tempo target:self selector:@selector(tocarPrimeiroPentagramaViolao) userInfo:nil repeats:NO];
    
    }
    
    
}

/////////////////////////////// Flauta ///////////////////////////////////////////////

-(void)tocarPrimeiroPentagramaFlauta{
    
    PartituraSinfonia *partitura = [self.listaSoundBank objectAtIndex:auxListaSoundBank-1];
    [partitura.soundBank allNotesOff];
    
    
    if(partitura.auxIndiceNotas >= [[[partitura.listaPartituraSinfonia objectAtIndex:0]listaNotasPartitura]count]){
        int v = [[[partitura.listaPartituraSinfonia objectAtIndex:0]listaNotasPartitura]count] - 1;
        Nota *ultimaNota = [[[partitura.listaPartituraSinfonia objectAtIndex:0]listaNotasPartitura]objectAtIndex:v];
        if(self.auxPlayPartituraProblema)[self performSelector:@selector(liberaInserirNota:) withObject:partitura afterDelay:[self pegaTempoNota:ultimaNota]+0.0];
        else [self performSelector:@selector(teste) withObject:nil afterDelay:[self pegaTempoNota:ultimaNota]+0.0];
        
    }else{

        
    Nota *nota = [[[partitura.listaPartituraSinfonia objectAtIndex:0]listaNotasPartitura]objectAtIndex:partitura.auxIndiceNotas];

    NSString *nomeNota = [nota nomeNota];
    NSString *nomeNotaTransformada;
    
    if([nomeNota isEqualToString:@"C"]){
        nomeNotaTransformada = @"Dó";
    }else if([nomeNota isEqualToString:@"D"]){
        nomeNotaTransformada = @"Ré";
    }
    else if([nomeNota isEqualToString:@"E"]){
        nomeNotaTransformada = @"Mi";
    }
    else if([nomeNota isEqualToString:@"F"]){
        nomeNotaTransformada = @"Fá";
    }
    else if([nomeNota isEqualToString:@"G"]){
        nomeNotaTransformada = @"Sol";
    }
    else if([nomeNota isEqualToString:@"A"]){
        nomeNotaTransformada = @"La";
    }
    else if([nomeNota isEqualToString:@"B"]){
        nomeNotaTransformada = @"Si";
    }else{
        nomeNotaTransformada = @"Pausa";
    }
    
    NSString *nivelNota = [nota oitava];
    NSString *tomEncurtado = [nota tom];
    NSString *notaFinal = [NSString stringWithFormat:@"%@%@",nivelNota,nomeNota];
    NSString *tempoNota = [nota tipoNota];
    self.compassoAtual = [[nota numeroCompasso]intValue];
    self.textoDescricaoNota = [NSString stringWithFormat:@"%@%@%@",nivelNota,@" ",nomeNotaTransformada];
    
    float tempo = 0.0;
    float volume = 0.4;
    
    
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
        //volume = 10.0;
    }else{
        NSLog(@"deu errado temopo");
    }
    
    
    if ([tomEncurtado rangeOfString:@"-1"].location != NSNotFound){
        int indiceDescerEscala = -1;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [partitura.instrumento retornaIndiceListaMusicas:notaFinal:indiceDescerEscala];
        NSLog(@"depois- %@",notaFinal);
        
    }else if ([tomEncurtado rangeOfString:@"1"].location != NSNotFound){
        int indiceSubirEscala = 1;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [partitura.instrumento retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois+ %@",notaFinal);
        
    }else if ([tomEncurtado rangeOfString:@"-2"].location != NSNotFound){
        int indiceDescerEscala = -2;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [partitura.instrumento retornaIndiceListaMusicas:notaFinal:indiceDescerEscala];
        NSLog(@"depois-- %@",notaFinal);
        
    }else if ([tomEncurtado rangeOfString:@"2"].location != NSNotFound){
        int indiceSubirEscala = 2;
        
        NSLog(@"antes %@",notaFinal);
        [partitura.instrumento retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois++ %@",notaFinal);
        
    }else if([notaFinal isEqualToString:@""]){
        
        volume = 0.0;
        
    }else{
        
    }

    
    if(partitura.auxIndiceNotas >0){
        Nota *nota = [[[partitura.listaPartituraSinfonia objectAtIndex:0]listaNotasPartitura]objectAtIndex:partitura.auxIndiceNotas-1];
        [self desapareceEfeito:nota];
    }
    
    [self mostraEfeito:nota];
    
    
    int retornaNotadoXML = [partitura.instrumento retornarNumeroNotaInstrumento:partitura.listaOrdemInstrumento:notaFinal];
    [partitura.soundBank queueNote:retornaNotadoXML gain:volume];
    [partitura.soundBank  playQueuedNotes];
    
    
    partitura.auxIndiceNotas++;
    NSLog(@"notas %d %f %@-%@",partitura.auxIndiceNotas,tempo,nota.oitava,nota.nomeNota);
    
    
    if([tempoNota isEqualToString:@"quarter"]) tempo = tempo-self.controleVelocidaTranNota;
    [NSTimer scheduledTimerWithTimeInterval:tempo target:self selector:@selector(tocarPrimeiroPentagramaFlauta) userInfo:nil repeats:NO];
        
        
    }
}
    
@end





