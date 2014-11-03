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
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(atualizaTempo:) userInfo:nil repeats:YES];
    self.cont = 0;
    
    [self deixaBotoesExclusivos:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

-(void)atualizaTempo:(NSTimer*)tempo{
    self.cont += 0.5;
}

-(void)tocarNotaPoint:(NSTimer*)tempo{
    [[ComponenteScrollEdicao sharedManager]addNotaNaTelaInstrumento:tempo.userInfo];
    [tempo invalidate];
}

-(void)tocarNotaPointSutenido:(NSTimer*)tempo{
    [[ComponenteScrollEdicao sharedManager]addNotaNaTelaInstrumento:tempo.userInfo];
    [tempo invalidate];
}

-(void)condicao:(int)v{
    NSLog(@"cont = %f",self.cont);
    
    if(v<0.50){
        [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"eighth"];
    }else if((v>=0.50)&&(v<1.2)){
        [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"quarter"];
     }else if((v>=1.20)&&(v<2.40)){
         [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"half"];
     }else if(v>=2.40                 ){
         [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"whole"];
     }
     self.cont = 0;
}

-(void)deixaBotoesExclusivos:(UIView *)myView
{
    for (UIView * button in [myView subviews]) {
        if([button isKindOfClass:[UIButton class]])
            [((UIButton *)button) setExclusiveTouch:YES];
    }
}

- (IBAction)tecla4c:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota4c = [NSValue valueWithCGPoint:CGPointMake(222.000000,483.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.000 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4c repeats:NO];

    
   }

- (IBAction)tecla4d:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota4d = [NSValue valueWithCGPoint:CGPointMake(191.000000,459.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4d repeats:NO];

  
}

- (IBAction)tecla4e:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
   self.nota4e = [NSValue valueWithCGPoint:CGPointMake(531.000000,422.000000)];
   [NSTimer scheduledTimerWithTimeInterval:0.010 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4e repeats:NO];

   
}

- (IBAction)tecla4f:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota4f = [NSValue valueWithCGPoint:CGPointMake(685.000000,403.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.015 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4f repeats:NO];

   
}

- (IBAction)tecla4g:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota4g = [NSValue valueWithCGPoint:CGPointMake(900.000000,359.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.020 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4g repeats:NO];
    
}

- (IBAction)tecla4a:(id)sender {
   [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota4a = [NSValue valueWithCGPoint:CGPointMake(1128.000000,339.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.025 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4a repeats:NO];
 
}

- (IBAction)tecla4b:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota4b = [NSValue valueWithCGPoint:CGPointMake(1320.000000,300.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.030 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota4b repeats:NO];
    

}



- (IBAction)tecla5c:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota5c = [NSValue valueWithCGPoint:CGPointMake(1464.000000,281.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.035 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota5c repeats:NO];
    

}

- (IBAction)tecla5d:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota5d = [NSValue valueWithCGPoint:CGPointMake(1652.000000,243.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.040 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota5d repeats:NO];
    

}

- (IBAction)tecla5e:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota5e = [NSValue valueWithCGPoint:CGPointMake(1834.000000,214.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.045 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota5e repeats:NO];
    
  
    
}

- (IBAction)tecla5f:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota5f = [NSValue valueWithCGPoint:CGPointMake(2010.000000,181.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.050 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota5f repeats:NO];
    
}

- (IBAction)tecla5g:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota5g = [NSValue valueWithCGPoint:CGPointMake(2206.000000,166.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.055 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota5g repeats:NO];

    
}

- (IBAction)tecla5a:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = NO;
    self.nota5a = [NSValue valueWithCGPoint:CGPointMake(222.000000,123.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.060 target:self selector:@selector(tocarNotaPoint:) userInfo:self.nota5a repeats:NO];
    
    
}

////////////////////////////////////////////////////////////



- (IBAction)teclas1:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = YES;
    self.notas1 = [NSValue valueWithCGPoint:CGPointMake(222.000000,483.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.053 target:self selector:@selector(tocarNotaPoint:) userInfo:self.notas1 repeats:NO];
    

}

- (IBAction)teclas2:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = YES;
    self.notas2 = [NSValue valueWithCGPoint:CGPointMake(191.000000,459.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.048 target:self selector:@selector(tocarNotaPoint:) userInfo:self.notas2 repeats:NO];
    
}

- (IBAction)teclas3:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = YES;
    self.notas3 = [NSValue valueWithCGPoint:CGPointMake(685.000000,403.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.043 target:self selector:@selector(tocarNotaPoint:) userInfo:self.notas3 repeats:NO];
    
}

- (IBAction)teclas4:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = YES;
    self.notas4 = [NSValue valueWithCGPoint:CGPointMake(900.000000,359.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.037 target:self selector:@selector(tocarNotaPoint:) userInfo:self.notas4 repeats:NO];
    
}

- (IBAction)teclas5:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = YES;
    self.notas5 = [NSValue valueWithCGPoint:CGPointMake(1128.000000,339.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.033 target:self selector:@selector(tocarNotaPoint:) userInfo:self.notas5 repeats:NO];
    
    
}

- (IBAction)tecla6:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = YES;
    self.notas6 = [NSValue valueWithCGPoint:CGPointMake(1464.000000,281.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.027 target:self selector:@selector(tocarNotaPoint:) userInfo:self.notas6 repeats:NO];
    
}

- (IBAction)teclas7:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = YES;
    self.notas7 = [NSValue valueWithCGPoint:CGPointMake(1652.000000,243.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.022 target:self selector:@selector(tocarNotaPoint:) userInfo:self.notas7 repeats:NO];
    
}

- (IBAction)teclas8:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = YES;
    self.notas8 = [NSValue valueWithCGPoint:CGPointMake(2010.000000,181.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.017 target:self selector:@selector(tocarNotaPoint:) userInfo:self.notas8 repeats:NO];
    
}


- (IBAction)tecla9:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].estadoBotaoSustenido = YES;
    self.notas9 = [NSValue valueWithCGPoint:CGPointMake(2206.000000,166.000000)];
    [NSTimer scheduledTimerWithTimeInterval:0.08 target:self selector:@selector(tocarNotaPoint:) userInfo:self.notas9 repeats:NO];
    

}


@end





