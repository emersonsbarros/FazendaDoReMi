//
//  XilofoneVirtualViewController.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 19/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "XilofoneVirtualViewController.h"

@interface XilofoneVirtualViewController ()

@end

@implementation XilofoneVirtualViewController

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
    
    [EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura = @"Xilofone";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tocarNotaPoint:(NSTimer*)tempo{
    [[ComponenteScrollEdicao sharedManager]addNotaNaTelaInstrumento:tempo.userInfo];
    [tempo invalidate];
}


- (IBAction)btnTecla1:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota4c = [NSValue valueWithCGPoint:CGPointMake(222.000000,483.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.000 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4c repeats:NO];

}

- (IBAction)btnTecla2:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota4d = [NSValue valueWithCGPoint:CGPointMake(191.000000,459.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4d repeats:NO];
}

- (IBAction)btnTecla3:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota4e = [NSValue valueWithCGPoint:CGPointMake(531.000000,422.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.010 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4e repeats:NO];
}

- (IBAction)btnTecla4:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota4f = [NSValue valueWithCGPoint:CGPointMake(685.000000,403.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.015 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4f repeats:NO];
}

- (IBAction)btnTecla5:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota4g = [NSValue valueWithCGPoint:CGPointMake(900.000000,359.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.020 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4g repeats:NO];
}

- (IBAction)btnTecla6:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota4a = [NSValue valueWithCGPoint:CGPointMake(1128.000000,339.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.025 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4a repeats:NO];
}

- (IBAction)btnTecla7:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota4b = [NSValue valueWithCGPoint:CGPointMake(1320.000000,300.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.030 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4b repeats:NO];
}

- (IBAction)btnTecla8:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota5c = [NSValue valueWithCGPoint:CGPointMake(1464.000000,281.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.035 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota5c repeats:NO];
}

- (IBAction)btnTecla9:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota5d = [NSValue valueWithCGPoint:CGPointMake(1652.000000,243.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.040 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota5d repeats:NO];
}

- (IBAction)btnTecla10:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota5e = [NSValue valueWithCGPoint:CGPointMake(1834.000000,214.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.045 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota5e repeats:NO];
}

- (IBAction)btnTecla11:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota5f = [NSValue valueWithCGPoint:CGPointMake(2010.000000,181.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.050 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota5f repeats:NO];
}

- (IBAction)btnTecla12:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota5g = [NSValue valueWithCGPoint:CGPointMake(2206.000000,166.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.055 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota5g repeats:NO];
}

- (IBAction)btnTecla13:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota5a = [NSValue valueWithCGPoint:CGPointMake(222.000000,123.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.060 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota5a repeats:NO];
    
}








@end
