//
//  DataBaseNotaPadrao.m
//  DesenhoPartitura
//
//  Created by VINICIUS RESENDE FIALHO on 24/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "DataBaseNotaPadrao.h"

@implementation DataBaseNotaPadrao

///////////////////////////////////// Sington ///////////////////////////////////////

+(DataBaseNotaPadrao*)sharedManager{
    static DataBaseNotaPadrao *unicoInstrumento = nil;
    if(!unicoInstrumento){
        unicoInstrumento = [[super allocWithZone:nil]init];
    }
    return unicoInstrumento;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

-(id)init{
    self = [super init];
    if(self){
        self.listaNotasPadroes = [[NSMutableArray alloc]init];
        [self addNotasPadroesDoApplicativo];
    }
    return self;
}

/////////////////////////////////////////////////////////////////////////////////////

//C = DO --- D = RE -- E = MI --- F = FA --- G = SOL ---A = LA --- B = SI

//Notas/Pausas Padroes da Partitura
-(void)addNotasPadroesDoApplicativo {
    
    //UIImageView *carinha = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Do4tempo.png"]];
    //UIImageView *chapeu = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"chapeu.png"]];
    
    //Nota Dó
    NotaAnimadaPadrao *notaDo4 = [[NotaAnimadaPadrao alloc]init];
    notaDo4.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"imagemBranco.png"]];
    notaDo4.carinha = 1;
    notaDo4.chapeu = 0;
    notaDo4.sustenido = 1;
    notaDo4.nomeNota = @"C";
    notaDo4.tipoNota = @"whole";
    notaDo4.imgCarinha = [UIImage imageNamed:@"Do4tempos.png"];

    
    NotaAnimadaPadrao *notaDo2 = [[NotaAnimadaPadrao alloc]init];
    notaDo2.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Dotempo.png"]];
    notaDo2.carinha = 1;
    notaDo2.chapeu = 1;
    notaDo2.sustenido = 1;
    notaDo2.nomeNota = @"C";
    notaDo2.tipoNota = @"half";

    
    NotaAnimadaPadrao *notaDo1 = [[NotaAnimadaPadrao alloc]init];
    notaDo1.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Dotempo.png"]];
    notaDo1.carinha = 1;
    notaDo1.chapeu = 0;
    notaDo1.sustenido = 1;
    notaDo1.nomeNota = @"C";
    notaDo1.tipoNota = @"quarter";
    
    
    NotaAnimadaPadrao *notaDo12 = [[NotaAnimadaPadrao alloc]init];
    notaDo12.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"DoMeiotempo.png"]];
    notaDo12.carinha = 1;
    notaDo12.chapeu = 0;
    notaDo12.sustenido = 1;
    notaDo12.nomeNota = @"C";
    notaDo12.tipoNota = @"eighth";
    
    

    //Nota Re
    NotaAnimadaPadrao *notaRe4 = [[NotaAnimadaPadrao alloc]init];
    notaRe4.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"imagemBranco.png"]];
    notaRe4.carinha = 1;
    notaRe4.chapeu = 0;
    notaRe4.sustenido = 1;
    notaRe4.nomeNota = @"D";
    notaRe4.tipoNota = @"whole";
    notaRe4.imgCarinha = [UIImage imageNamed:@"Re4tempos.png"];
    
    NotaAnimadaPadrao *notaRe2 = [[NotaAnimadaPadrao alloc]init];
    notaRe2.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Retempo.png"]];
    notaRe2.carinha = 1;
    notaRe2.chapeu = 1;
    notaRe2.sustenido = 1;
    notaRe2.nomeNota = @"D";
    notaRe2.tipoNota = @"half";
    
    NotaAnimadaPadrao *notaRe1 = [[NotaAnimadaPadrao alloc]init];
    notaRe1.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Retempo.png"]];
    notaRe1.carinha = 1;
    notaRe1.chapeu = 0;
    notaRe1.sustenido = 1;
    notaRe1.nomeNota = @"D";
    notaRe1.tipoNota = @"quarter";
    
    NotaAnimadaPadrao *notaRe12 = [[NotaAnimadaPadrao alloc]init];
    notaRe12.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ReMeiotempo.png"]];
    notaRe12.carinha = 1;
    notaRe12.chapeu = 0;
    notaRe12.sustenido = 1;
    notaRe12.nomeNota = @"D";
    notaRe12.tipoNota = @"eighth";
    
    
    //Nota Mi
    NotaAnimadaPadrao *notaMi4 = [[NotaAnimadaPadrao alloc]init];
    notaMi4.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"imagemBranco.png"]];
    notaMi4.carinha = 1;
    notaMi4.chapeu = 0;
    notaMi4.sustenido = 0;
    notaMi4.nomeNota = @"E";
    notaMi4.tipoNota = @"whole";
    notaMi4.imgCarinha = [UIImage imageNamed:@"Mi4tempos.png"];
    
    NotaAnimadaPadrao *notaMi2 = [[NotaAnimadaPadrao alloc]init];
    notaMi2.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Mitempo.png"]];
    notaMi2.carinha = 1;
    notaMi2.chapeu = 1;
    notaMi2.sustenido = 0;
    notaMi2.nomeNota = @"E";
    notaMi2.tipoNota = @"half";
    
    NotaAnimadaPadrao *notaMi1 = [[NotaAnimadaPadrao alloc]init];
    notaMi1.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Mitempo.png"]];
    notaMi1.carinha = 1;
    notaMi1.chapeu = 0;
    notaMi1.sustenido = 0;
    notaMi1.nomeNota = @"E";
    notaMi1.tipoNota = @"quarter";
    
    NotaAnimadaPadrao *notaMi12 = [[NotaAnimadaPadrao alloc]init];
    notaMi12.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MiMeiotempo.png"]];
    notaMi12.carinha = 1;
    notaMi12.chapeu = 0;
    notaMi12.sustenido = 0;
    notaMi12.nomeNota = @"E";
    notaMi12.tipoNota = @"eighth";

    
    //Nota fA
    NotaAnimadaPadrao *notaFa4 = [[NotaAnimadaPadrao alloc]init];
    notaFa4.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"imagemBranco.png"]];
    notaFa4.carinha = 1;
    notaFa4.chapeu = 0;
    notaFa4.sustenido = 1;
    notaFa4.nomeNota = @"F";
    notaFa4.tipoNota = @"whole";
    notaFa4.imgCarinha = [UIImage imageNamed:@"fa4Tempos.png"];
    
    NotaAnimadaPadrao *notaFa2 = [[NotaAnimadaPadrao alloc]init];
    notaFa2.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Fatempo.png"]];
    notaFa2.carinha = 1;
    notaFa2.chapeu = 1;
    notaFa2.sustenido = 1;
    notaFa2.nomeNota = @"F";
    notaFa2.tipoNota = @"half";
    
    NotaAnimadaPadrao *notaFa1 = [[NotaAnimadaPadrao alloc]init];
    notaFa1.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Fatempo.png"]];
    notaFa1.carinha = 1;
    notaFa1.chapeu = 0;
    notaFa1.sustenido = 1;
    notaFa1.nomeNota = @"F";
    notaFa1.tipoNota = @"quarter";
    
    NotaAnimadaPadrao *notaFa12 = [[NotaAnimadaPadrao alloc]init];
    notaFa12.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"FaMeiotempo.png"]];
    notaFa12.carinha = 1;
    notaFa12.chapeu = 0;
    notaFa12.sustenido = 1;
    notaFa12.nomeNota = @"F";
    notaFa12.tipoNota = @"eighth";
    
    
    
    //Nota Sol
    NotaAnimadaPadrao *notaSol4 = [[NotaAnimadaPadrao alloc]init];
    notaSol4.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"imagemBranco.png"]];
    notaSol4.carinha = 1;
    notaSol4.chapeu = 0;
    notaSol4.sustenido = 1;
    notaSol4.nomeNota = @"G";
    notaSol4.tipoNota = @"whole";
    notaSol4.imgCarinha = [UIImage imageNamed:@"Sol4Tempos.png"];
    
    NotaAnimadaPadrao *notaSol2 = [[NotaAnimadaPadrao alloc]init];
    notaSol2.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Soltempo.png"]];
    notaSol2.carinha = 1;
    notaSol2.chapeu = 1;
    notaSol2.sustenido = 1;
    notaSol2.nomeNota = @"G";
    notaSol2.tipoNota = @"half";
    
    NotaAnimadaPadrao *notaSol1 = [[NotaAnimadaPadrao alloc]init];
    notaSol1.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Soltempo.png"]];
    notaSol1.carinha = 1;
    notaSol1.chapeu = 0;
    notaSol1.sustenido = 1;
    notaSol1.nomeNota = @"G";
    notaSol1.tipoNota = @"quarter";
    
    NotaAnimadaPadrao *notaSol12 = [[NotaAnimadaPadrao alloc]init];
    notaSol12.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"SolMeiotempo.png"]];
    notaSol12.carinha = 1;
    notaSol12.chapeu = 0;
    notaSol12.sustenido = 1;
    notaSol12.nomeNota = @"G";
    notaSol12.tipoNota = @"eighth";
    
    
    
    //Nota La
    NotaAnimadaPadrao *notaLa4 = [[NotaAnimadaPadrao alloc]init];
    notaLa4.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"imagemBranco.png"]];
    notaLa4.carinha = 1;
    notaLa4.chapeu = 0;
    notaLa4.sustenido = 1;
    notaLa4.nomeNota = @"A";
    notaLa4.tipoNota = @"whole";
    notaLa4.imgCarinha = [UIImage imageNamed:@"La4Tempos.png"];
    
    NotaAnimadaPadrao *notaLa2 = [[NotaAnimadaPadrao alloc]init];
    notaLa2.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Latempo.png"]];
    notaLa2.carinha = 1;
    notaLa2.chapeu = 1;
    notaLa2.sustenido = 1;
    notaLa2.nomeNota = @"A";
    notaLa2.tipoNota = @"half";
    
    NotaAnimadaPadrao *notaLa1 = [[NotaAnimadaPadrao alloc]init];
    notaLa1.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Latempo.png"]];
    notaLa1.carinha = 1;
    notaLa1.chapeu = 0;
    notaLa1.sustenido = 1;
    notaLa1.nomeNota = @"A";
    notaLa1.tipoNota = @"quarter";
    
    NotaAnimadaPadrao *notaLa12 = [[NotaAnimadaPadrao alloc]init];
    notaLa12.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"LaMeiotempo.png"]];
    notaLa12.carinha = 1;
    notaLa12.chapeu = 0;
    notaLa12.sustenido = 1;
    notaLa12.nomeNota = @"A";
    notaLa12.tipoNota = @"eighth";
    
    
    
    //Nota Si
    NotaAnimadaPadrao *notaSi4 = [[NotaAnimadaPadrao alloc]init];
    notaSi4.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"imagemBranco.png"]];
    notaSi4.carinha = 1;
    notaSi4.chapeu = 0;
    notaSi4.sustenido = 0;
    notaSi4.nomeNota = @"B";
    notaSi4.tipoNota = @"whole";
    notaSi4.imgCarinha = [UIImage imageNamed:@"Si4Tempos.png"];
    
    NotaAnimadaPadrao *notaSi2 = [[NotaAnimadaPadrao alloc]init];
    notaSi2.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Sitempo.png"]];
    notaSi2.carinha = 1;
    notaSi2.chapeu = 1;
    notaSi2.sustenido = 0;
    notaSi2.nomeNota = @"B";
    notaSi2.tipoNota = @"half";
    
    NotaAnimadaPadrao *notaSi1 = [[NotaAnimadaPadrao alloc]init];
    notaSi1.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Sitempo.png"]];
    notaSi1.carinha = 1;
    notaSi1.chapeu = 0;
    notaSi1.sustenido = 0;
    notaSi1.nomeNota = @"B";
    notaSi1.tipoNota = @"quarter";
    
    NotaAnimadaPadrao *notaSi12 = [[NotaAnimadaPadrao alloc]init];
    notaSi12.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"SiMeiotempo.png"]];
    notaSi12.carinha = 1;
    notaSi12.chapeu = 0;
    notaSi12.sustenido = 0;
    notaSi12.nomeNota = @"B";
    notaSi12.tipoNota = @"eighth";
    
    
    
    [self.listaNotasPadroes addObject:notaDo4];
    [self.listaNotasPadroes addObject:notaDo2];
    [self.listaNotasPadroes addObject:notaDo1];
    [self.listaNotasPadroes addObject:notaDo12];
    
    [self.listaNotasPadroes addObject:notaRe4];
    [self.listaNotasPadroes addObject:notaRe2];
    [self.listaNotasPadroes addObject:notaRe1];
    [self.listaNotasPadroes addObject:notaRe12];

    
    [self.listaNotasPadroes addObject:notaMi4];
    [self.listaNotasPadroes addObject:notaMi2];
    [self.listaNotasPadroes addObject:notaMi1];
    [self.listaNotasPadroes addObject:notaMi12];

    
    [self.listaNotasPadroes addObject:notaFa4];
    [self.listaNotasPadroes addObject:notaFa2];
    [self.listaNotasPadroes addObject:notaFa1];
    [self.listaNotasPadroes addObject:notaFa12];
    
    [self.listaNotasPadroes addObject:notaSol4];
    [self.listaNotasPadroes addObject:notaSol2];
    [self.listaNotasPadroes addObject:notaSol1];
    [self.listaNotasPadroes addObject:notaSol12];

    
    [self.listaNotasPadroes addObject:notaLa4];
    [self.listaNotasPadroes addObject:notaLa2];
    [self.listaNotasPadroes addObject:notaLa1];
    [self.listaNotasPadroes addObject:notaLa12];

    
    [self.listaNotasPadroes addObject:notaSi4];
    [self.listaNotasPadroes addObject:notaSi2];
    [self.listaNotasPadroes addObject:notaSi1];
    [self.listaNotasPadroes addObject:notaSi12];

    Nota *notaPausa1 = [[Nota alloc]init];
    notaPausa1.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"4-2Pausa.png"]];
    notaPausa1.nomeNota = @"semibrevePausa";
    notaPausa1.tipoNota = @"whole";
 
    
    Nota *notaPausa2 = [[Nota alloc]init];
    notaPausa2.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"4-2Pausa.png"]];
    notaPausa2.nomeNota = @"minimaPausa";
    notaPausa2.tipoNota = @"half";
    
    
    Nota *notaPausa3 = [[Nota alloc]init];
    notaPausa3.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"seminimaPausa.png"]];
    notaPausa3.nomeNota = @"seminimaPausa";
    notaPausa3.tipoNota = @"quarter";
    
    
    Nota *notaPausa4 = [[Nota alloc]init];
    notaPausa4.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"colcheiaPausa.png"]];
    notaPausa4.nomeNota = @"colcheiaPausa";
    notaPausa4.tipoNota = @"eighth";

    
    [self.listaNotasPadroes addObject:notaPausa1];
    [self.listaNotasPadroes addObject:notaPausa2];
    [self.listaNotasPadroes addObject:notaPausa3];
    [self.listaNotasPadroes addObject:notaPausa4];
 
}


//Retorna a nota pelo seu nome
-(Nota*)retornaNotaPadrao:(NSString*)nomeNota{
    
    Nota *nota;
    
    for(int i=0;i<self.listaNotasPadroes.count;i++){
        nota = [[self listaNotasPadroes] objectAtIndex:i];
        if([[nota tipoNota]isEqualToString:nomeNota]){
            return  nota;
        }
    }
    
    return NULL;
}


//Retorna a pausa pelo seu nome
-(Nota*)retornaNotaPausaPadrao:(NSString*)nomeNota{
    
    Nota *nota;
    
    for(int i=0;i<self.listaNotasPadroes.count;i++){
        nota = [[self listaNotasPadroes] objectAtIndex:i];
        if([[nota nomeNota]isEqualToString:nomeNota]){
            return  nota;
        }
    }
    
    return NULL;
}


//Retorna o nota crianca pelo nome
-(NotaAnimadaPadrao*)retornaNotaPadraoCrianca:(NSString*)tipoNomeNota{

    NotaAnimadaPadrao *nota;
    
    for(int i=0;i<self.listaNotasPadroes.count;i++){
        nota = [[self listaNotasPadroes] objectAtIndex:i];
        NSString *tempo  = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
    
        if(([[nota nomeNota] isEqualToString:tipoNomeNota]) &&([[nota tipoNota] isEqualToString:tempo])){
            return  nota;
        }
    }
    
    return NULL;
}

//Retorna o rosto do animal que corresponde a nota
-(UIImage*)retornaCarinhaNota:(NSString*)tipoNomeNota{
    
    NotaAnimadaPadrao *nota;
    
    for(int i=0;i<self.listaNotasPadroes.count;i++){
        nota = [[self listaNotasPadroes] objectAtIndex:i];
        
        if(([[nota nomeNota] isEqualToString:tipoNomeNota]) &&([[nota tipoNota] isEqualToString:@"whole"])){
            return nota.imgCarinha;
        }
    }
    
    return NULL;
}


@end




