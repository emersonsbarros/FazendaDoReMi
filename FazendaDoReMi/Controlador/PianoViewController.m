//
//  PianoViewController.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 23/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "PianoViewController.h"

@interface PianoViewController ()

@end

@implementation PianoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}



-(void)tocarNotaPoint:(NSTimer*)tempo{
     [[ComponenteScrollEdicao sharedManager]addNotaNaTelaInstrumento:tempo.userInfo];
    [tempo invalidate];
}

- (IBAction)tecla4c:(id)sender {

    self.nota4c = [NSValue valueWithCGPoint:CGPointMake(222.000000,483.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.000 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4c repeats:NO];
    
}

- (IBAction)tecla4d:(id)sender {
    
    self.nota4d = [NSValue valueWithCGPoint:CGPointMake(191.000000,459.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4d repeats:NO];
}

- (IBAction)tecla4e:(id)sender {
    
   self.nota4e = [NSValue valueWithCGPoint:CGPointMake(531.000000,422.000000)];
   [NSTimer scheduledTimerWithTimeInterval:0.010 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4e repeats:NO];
}

- (IBAction)tecla4f:(id)sender {
    
    self.nota4f = [NSValue valueWithCGPoint:CGPointMake(685.000000,403.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.015 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4f repeats:NO];
}

- (IBAction)tecla4g:(id)sender {
    
    self.nota4g = [NSValue valueWithCGPoint:CGPointMake(900.000000,359.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.020 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4g repeats:NO];
}

- (IBAction)tecla4a:(id)sender {
   
    self.nota4a = [NSValue valueWithCGPoint:CGPointMake(1128.000000,339.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.025 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4a repeats:NO];
    
}

- (IBAction)tecla4b:(id)sender {

    self.nota4b = [NSValue valueWithCGPoint:CGPointMake(1320.000000,300.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.030 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4b repeats:NO];
}



- (IBAction)tecla5c:(id)sender {
    
    self.nota5c = [NSValue valueWithCGPoint:CGPointMake(1464.000000,281.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.035 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota5c repeats:NO];
}

- (IBAction)tecla5d:(id)sender {
    
    self.nota5d = [NSValue valueWithCGPoint:CGPointMake(1652.000000,243.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.040 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota5d repeats:NO];
}

- (IBAction)tecla5e:(id)sender {
    
    self.nota5e = [NSValue valueWithCGPoint:CGPointMake(1834.000000,214.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.045 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota5e repeats:NO];
    
}

- (IBAction)tecla5f:(id)sender {
    
    self.nota5f = [NSValue valueWithCGPoint:CGPointMake(2010.000000,181.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.050 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota5f repeats:NO];
}

- (IBAction)tecla5g:(id)sender {
    
    self.nota5g = [NSValue valueWithCGPoint:CGPointMake(2206.000000,166.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.055 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota5g repeats:NO];
    
}

- (IBAction)tecla5a:(id)sender {
    
    self.nota5a = [NSValue valueWithCGPoint:CGPointMake(222.000000,123.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.060 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota5a repeats:NO];
    
}

////////////////////////////////////////////////////////////



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

-(void)tocarNota:(NSTimer*)tempo{
    [[Sinfonia sharedManager]tocarUmaNota:[NSMutableArray arrayWithObjects:[tempo userInfo], nil]:@"Piano"];
    [tempo invalidate];
}

@end





