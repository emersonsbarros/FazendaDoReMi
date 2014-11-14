//
//  PianoViewController.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 23/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "TecladoViewController.h"

@interface TecladoViewController ()

@end

@implementation TecladoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.nomeInstrumento = @"Piano";
    
    int contador=0;
    for(UIButton *btn in self.view.subviews){
        
        if(btn.tag == 5){
            
            contador++;
            NSLog(@"olha %d",contador);
            
            switch (contador) {
                case 1:
                    [self addLabelEImagem:btn :@"Dó"];
                    break;
                case 2:
                    [self addLabelEImagem:btn :@"Ré"];
                    break;
                case 3:
                    [self addLabelEImagem:btn :@"Mi"];
                    break;
                case 4:
                    [self addLabelEImagem:btn :@"Fá"];
                    break;
                case 5:
                    [self addLabelEImagem:btn :@"Sol"];
                    break;
                case 6:
                    [self addLabelEImagem:btn :@"Lá"];
                    break;
                case 7:
                    [self addLabelEImagem:btn :@"Si"];
                    contador = 0;
                    break;
                default:
                    
                    break;
            }
            
        }
    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

-(void)tocarNota:(NSTimer*)tempo{
     [[Sinfonia sharedManager]tocarUmaNota:[NSMutableArray arrayWithObjects:[tempo userInfo], nil]:self.nomeInstrumento];
     [tempo invalidate];
}


- (IBAction)tecla4c:(id)sender {
    
    self.nota4c = [[Nota alloc]init];
    self.nota4c.imagemAcidente = NULL;
    self.nota4c.imagePontoNota = NULL;
    self.nota4c.nomeNota = @"C";
    self.nota4c.oitava = @"4";
    self.nota4c.duracao = @"0";
    self.nota4c.tipoNota = @"quarter";
    self.nota4c.tom = @"";
    
    //[[Sinfonia sharedManager]tocarUmaNota:[NSMutableArray arrayWithObjects:self.nota4c, nil]:@"Piano"];
    
    [NSTimer scheduledTimerWithTimeInterval:0.000 target:self selector:@selector(tocarNota:) userInfo:self.nota4c repeats:NO];
}

- (IBAction)tecla4d:(id)sender {
   
    self.nota4d = [[Nota alloc]init];
    self.nota4d.imagemAcidente = NULL;
    self.nota4d.imagePontoNota = NULL;
    self.nota4d.nomeNota = @"D";
    self.nota4d.oitava = @"4";
    self.nota4d.duracao = @"0";
    self.nota4d.tipoNota = @"quarter";
    self.nota4d.tom = @"";
    
     //[[Sinfonia sharedManager]tocarUmaNota:[NSMutableArray arrayWithObjects:self.nota4d, nil]:@"Piano"];
    
    [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(tocarNota:) userInfo:self.nota4d repeats:NO];
}

- (IBAction)tecla4e:(id)sender {
    self.nota4e = [[Nota alloc]init];
    self.nota4e.imagemAcidente = NULL;
    self.nota4e.imagePontoNota = NULL;
    self.nota4e.nomeNota = @"E";
    self.nota4e.oitava = @"4";
    self.nota4e.duracao = @"0";
    self.nota4e.tipoNota = @"quarter";
    self.nota4e.tom = @"";
    
    ///[[Sinfonia sharedManager]tocarUmaNota:[NSMutableArray arrayWithObjects:self.nota4e, nil]:@"Piano"];
    [NSTimer scheduledTimerWithTimeInterval:0.010 target:self selector:@selector(tocarNota:) userInfo:self.nota4e repeats:NO];
}

- (IBAction)tecla4f:(id)sender {
    self.nota4f = [[Nota alloc]init];
    self.nota4f.imagemAcidente = NULL;
    self.nota4f.imagePontoNota = NULL;
    self.nota4f.nomeNota = @"F";
    self.nota4f.oitava = @"4";
    self.nota4f.duracao = @"0";
    self.nota4f.tipoNota = @"quarter";
    self.nota4f.tom = @"";
    
    //[[Sinfonia sharedManager]tocarUmaNota:[NSMutableArray arrayWithObjects:self.nota4f, nil]:@"Piano"];
    
    [NSTimer scheduledTimerWithTimeInterval:0.015 target:self selector:@selector(tocarNota:) userInfo:self.nota4f repeats:NO];
}

- (IBAction)tecla4g:(id)sender {
    self.nota4g = [[Nota alloc]init];
    self.nota4g.imagemAcidente = NULL;
    self.nota4g.imagePontoNota = NULL;
    self.nota4g.nomeNota = @"G";
    self.nota4g.oitava = @"4";
    self.nota4g.duracao = @"0";
    self.nota4g.tipoNota = @"quarter";
    self.nota4g.tom = @"";
    
    //[[Sinfonia sharedManager]tocarUmaNota:[NSMutableArray arrayWithObjects:self.nota4g, nil]:@"Piano"];
    
    [NSTimer scheduledTimerWithTimeInterval:0.020 target:self selector:@selector(tocarNota:) userInfo:self.nota4g repeats:NO];
}

- (IBAction)tecla4a:(id)sender {
    self.nota4a = [[Nota alloc]init];
    self.nota4a.imagemAcidente = NULL;
    self.nota4a.imagePontoNota = NULL;
    self.nota4a.nomeNota = @"A";
    self.nota4a.oitava = @"4";
    self.nota4a.duracao = @"0";
    self.nota4a.tipoNota = @"quarter";
    self.nota4a.tom = @"";
    
    //[[Sinfonia sharedManager]tocarUmaNota:[NSMutableArray arrayWithObjects:self.nota4a, nil]:@"Piano"];
    
    [NSTimer scheduledTimerWithTimeInterval:0.025 target:self selector:@selector(tocarNota:) userInfo:self.nota4a repeats:NO];
    
}

- (IBAction)tecla4b:(id)sender {
    self.nota4b = [[Nota alloc]init];
    self.nota4b.imagemAcidente = NULL;
    self.nota4b.imagePontoNota = NULL;
    self.nota4b.nomeNota = @"B";
    self.nota4b.oitava = @"4";
    self.nota4b.duracao = @"0";
    self.nota4b.tipoNota = @"quarter";
    self.nota4b.tom = @"";
    
    //[[Sinfonia sharedManager]tocarUmaNota:[NSMutableArray arrayWithObjects:self.nota4b, nil]:@"Piano"];
    
    [NSTimer scheduledTimerWithTimeInterval:0.030 target:self selector:@selector(tocarNota:) userInfo:self.nota4b repeats:NO];
}



- (IBAction)tecla5c:(id)sender {
    self.nota5c = [[Nota alloc]init];
    self.nota5c.imagemAcidente = NULL;
    self.nota5c.imagePontoNota = NULL;
    self.nota5c.nomeNota = @"C";
    self.nota5c.oitava = @"5";
    self.nota5c.duracao = @"0";
    self.nota5c.tipoNota = @"quarter";
    self.nota5c.tom = @"";
    
    [NSTimer scheduledTimerWithTimeInterval:0.035 target:self selector:@selector(tocarNota:) userInfo:self.nota5c repeats:NO];
}

- (IBAction)tecla5d:(id)sender {
    self.nota5d = [[Nota alloc]init];
    self.nota5d.imagemAcidente = NULL;
    self.nota5d.imagePontoNota = NULL;
    self.nota5d.nomeNota = @"D";
    self.nota5d.oitava = @"5";
    self.nota5d.duracao = @"0";
    self.nota5d.tipoNota = @"quarter";
    self.nota5d.tom = @"";
    
    [NSTimer scheduledTimerWithTimeInterval:0.040 target:self selector:@selector(tocarNota:) userInfo:self.nota5d repeats:NO];
}

- (IBAction)tecla5e:(id)sender {
    self.nota5e = [[Nota alloc]init];
    self.nota5e.imagemAcidente = NULL;
    self.nota5e.imagePontoNota = NULL;
    self.nota5e.nomeNota = @"E";
    self.nota5e.oitava = @"5";
    self.nota5e.duracao = @"0";
    self.nota5e.tipoNota = @"quarter";
    self.nota5e.tom = @"";
    
    [NSTimer scheduledTimerWithTimeInterval:0.045 target:self selector:@selector(tocarNota:) userInfo:self.nota5e repeats:NO];
    
}

- (IBAction)tecla5f:(id)sender {
    self.nota5f = [[Nota alloc]init];
    self.nota5f.imagemAcidente = NULL;
    self.nota5f.imagePontoNota = NULL;
    self.nota5f.nomeNota = @"F";
    self.nota5f.oitava = @"5";
    self.nota5f.duracao = @"0";
    self.nota5f.tipoNota = @"quarter";
    self.nota5f.tom = @"";
    
    [NSTimer scheduledTimerWithTimeInterval:0.050 target:self selector:@selector(tocarNota:) userInfo:self.nota5f repeats:NO];
}

- (IBAction)tecla5g:(id)sender {
    self.nota5g = [[Nota alloc]init];
    self.nota5g.imagemAcidente = NULL;
    self.nota5g.imagePontoNota = NULL;
    self.nota5g.nomeNota = @"G";
    self.nota5g.oitava = @"5";
    self.nota5g.duracao = @"0";
    self.nota5g.tipoNota = @"quarter";
    self.nota5g.tom = @"";
    
    [NSTimer scheduledTimerWithTimeInterval:0.055 target:self selector:@selector(tocarNota:) userInfo:self.nota5g repeats:NO];
    
}

- (IBAction)tecla5a:(id)sender {
    self.nota5a = [[Nota alloc]init];
    self.nota5a.imagemAcidente = NULL;
    self.nota5a.imagePontoNota = NULL;
    self.nota5a.nomeNota = @"A";
    self.nota5a.oitava = @"5";
    self.nota5a.duracao = @"0";
    self.nota5a.tipoNota = @"quarter";
    self.nota5a.tom = @"";
    
    [NSTimer scheduledTimerWithTimeInterval:0.060 target:self selector:@selector(tocarNota:) userInfo:self.nota5a repeats:NO];
    
}

////////////////////////////////////////////////////////////






//[nomeNotas addObject:@"5Fs"];
//[nomeNotas addObject:@"5G"];
//[nomeNotas addObject:@"5Gs"];
//[nomeNotas addObject:@"5A"];
//[nomeNotas addObject:@"5As"];


- (IBAction)teclas1:(id)sender {
    self.notas1 = [[Nota alloc]init];
    self.notas1.imagemAcidente = NULL;
    self.notas1.imagePontoNota = NULL;
    self.notas1.nomeNota = @"Cs";
    self.notas1.oitava = @"4";
    self.notas1.duracao = @"0";
    self.notas1.tipoNota = @"quarter";
    self.notas1.tom = @"";
    
    [NSTimer scheduledTimerWithTimeInterval:0.000 target:self selector:@selector(tocarNota:) userInfo:self.notas1 repeats:NO];

}

- (IBAction)teclas2:(id)sender {
    self.notas2 = [[Nota alloc]init];
    self.notas2.imagemAcidente = NULL;
    self.notas2.imagePontoNota = NULL;
    self.notas2.nomeNota = @"Ds";
    self.notas2.oitava = @"4";
    self.notas2.duracao = @"0";
    self.notas2.tipoNota = @"quarter";
    self.notas2.tom = @"";
    
    [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(tocarNota:) userInfo:self.notas2 repeats:NO];
}

- (IBAction)teclas3:(id)sender {
    self.notas3 = [[Nota alloc]init];
    self.notas3.imagemAcidente = NULL;
    self.notas3.imagePontoNota = NULL;
    self.notas3.nomeNota = @"Fs";
    self.notas3.oitava = @"4";
    self.notas3.duracao = @"0";
    self.notas3.tipoNota = @"quarter";
    self.notas3.tom = @"";
    
    [NSTimer scheduledTimerWithTimeInterval:0.010 target:self selector:@selector(tocarNota:) userInfo:self.notas3 repeats:NO];
}

- (IBAction)teclas4:(id)sender {
    self.notas4 = [[Nota alloc]init];
    self.notas4.imagemAcidente = NULL;
    self.notas4.imagePontoNota = NULL;
    self.notas4.nomeNota = @"Gs";
    self.notas4.oitava = @"4";
    self.notas4.duracao = @"0";
    self.notas4.tipoNota = @"quarter";
    self.notas4.tom = @"";
    
    [NSTimer scheduledTimerWithTimeInterval:0.015 target:self selector:@selector(tocarNota:) userInfo:self.notas4 repeats:NO];
}

- (IBAction)teclas5:(id)sender {
    self.notas5 = [[Nota alloc]init];
    self.notas5.imagemAcidente = NULL;
    self.notas5.imagePontoNota = NULL;
    self.notas5.nomeNota = @"As";
    self.notas5.oitava = @"4";
    self.notas5.duracao = @"0";
    self.notas5.tipoNota = @"quarter";
    self.notas5.tom = @"";
    
    [NSTimer scheduledTimerWithTimeInterval:0.020 target:self selector:@selector(tocarNota:) userInfo:self.notas5 repeats:NO];
    
}

- (IBAction)tecla6:(id)sender {
    self.notas6 = [[Nota alloc]init];
    self.notas6.imagemAcidente = NULL;
    self.notas6.imagePontoNota = NULL;
    self.notas6.nomeNota = @"Cs";
    self.notas6.oitava = @"5";
    self.notas6.duracao = @"0";
    self.notas6.tipoNota = @"quarter";
    self.notas6.tom = @"";
    
    [NSTimer scheduledTimerWithTimeInterval:0.025 target:self selector:@selector(tocarNota:) userInfo:self.notas6 repeats:NO];
}

- (IBAction)teclas7:(id)sender {
    self.notas7 = [[Nota alloc]init];
    self.notas7.imagemAcidente = NULL;
    self.notas7.imagePontoNota = NULL;
    self.notas7.nomeNota = @"Ds";
    self.notas7.oitava = @"5";
    self.notas7.duracao = @"0";
    self.notas7.tipoNota = @"quarter";
    self.notas7.tom = @"";
    
    [NSTimer scheduledTimerWithTimeInterval:0.030 target:self selector:@selector(tocarNota:) userInfo:self.notas7 repeats:NO];
}

- (IBAction)teclas8:(id)sender {
    self.notas8 = [[Nota alloc]init];
    self.notas8.imagemAcidente = NULL;
    self.notas8.imagePontoNota = NULL;
    self.notas8.nomeNota = @"Fs";
    self.notas8.oitava = @"5";
    self.notas8.duracao = @"0";
    self.notas8.tipoNota = @"quarter";
    self.notas8.tom = @"";
    
    [NSTimer scheduledTimerWithTimeInterval:0.035 target:self selector:@selector(tocarNota:) userInfo:self.notas8 repeats:NO];
}

- (IBAction)tecla9:(id)sender {
    self.notas9 = [[Nota alloc]init];
    self.notas9.imagemAcidente = NULL;
    self.notas9.imagePontoNota = NULL;
    self.notas9.nomeNota = @"Gs";
    self.notas9.oitava = @"5";
    self.notas9.duracao = @"0";
    self.notas9.tipoNota = @"quarter";
    self.notas9.tom = @"";
    
    [NSTimer scheduledTimerWithTimeInterval:0.040 target:self selector:@selector(tocarNota:) userInfo:self.notas9 repeats:NO];
}



-(void)addLabelEImagem:(UIView*)tecla :(NSString*)nome{
    
    UILabel *textoNota = [[UILabel alloc]initWithFrame:CGRectMake(25.25, 235, 30, 30)];
    textoNota.text = nome;
    textoNota.numberOfLines = 1;
    textoNota.textColor = [UIColor blackColor];
    textoNota.textAlignment = NSTextAlignmentCenter;
    
    UIImageView *img;
    if([nome isEqualToString:@"Dó"]){
        img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Do4Tempos"]];
    }else if([nome isEqualToString:@"Ré"]){
        img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Re4Tempos"]];
    }else if([nome isEqualToString:@"Mi"]){
        img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Mi4Tempos"]];
    }else if([nome isEqualToString:@"Fá"]){
        img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Fa4Tempos"]];
    }else if([nome isEqualToString:@"Sol"]){
        img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Sol4Tempos"]];
    }else if([nome isEqualToString:@"Lá"]){
        img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"La4Tempos"]];
    }else if([nome isEqualToString:@"Si"]){
        img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Si4Tempos"]];
    }
    
    img.frame = CGRectMake(0, 135, 80, 100);
    
    
    [tecla addSubview:textoNota];
    [tecla addSubview:img];
    
}



///////////////////////////////// BOTOES INSTRUMENTOS /////////////////////////////////


- (IBAction)btnPiano:(id)sender {
    [[Sinfonia sharedManager]trocaInstrumentoESoundBank];
    self.nomeInstrumento = @"Piano";
}

- (IBAction)btnFlauta:(id)sender {
    [[Sinfonia sharedManager]trocaInstrumentoESoundBank];
     self.nomeInstrumento = @"FlautaDoce";
}

- (IBAction)btnViolao:(id)sender {
    [[Sinfonia sharedManager]trocaInstrumentoESoundBank];
     self.nomeInstrumento = @"ViolaoNylon";
}

- (IBAction)btnSaxfone:(id)sender {
    [[Sinfonia sharedManager]trocaInstrumentoESoundBank];
     self.nomeInstrumento = @"Piano";
}

- (IBAction)btnGuitarra:(id)sender {
    [[Sinfonia sharedManager]trocaInstrumentoESoundBank];
     self.nomeInstrumento = @"Piano";
}

- (IBAction)btnTambor:(id)sender {
    [[Sinfonia sharedManager]trocaInstrumentoESoundBank];
     self.nomeInstrumento = @"TamborBongo";
}

- (IBAction)btnOrgao:(id)sender {
    [[Sinfonia sharedManager]trocaInstrumentoESoundBank];
     self.nomeInstrumento = @"Telefone";
}






@end





