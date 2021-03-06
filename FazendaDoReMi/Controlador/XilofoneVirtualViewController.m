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

////////////////////// viewcontroller //////////////////////


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura = @"Xilofone";
    [[Sinfonia sharedManager]trocaInstrumentoESoundBank];
    
    [self deixaBotoesExclusivos:self.view];
    
    int contador=0;
    for(UIButton *btn in self.view.subviews){
        
        if(btn.tag == 5){
            
            contador++;
                       
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
    // Dispose of any resources that can be recreated.
}



////////////////////// METODOS AUXILIARES //////////////////////

-(void)deixaBotoesExclusivos:(UIView *)myView
{
    for (UIView * button in [myView subviews]) {
        if([button isKindOfClass:[UIButton class]])
            [((UIButton *)button) setExclusiveTouch:YES];
    }
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

//Adiciona imagem e lavel a tecla
-(void)addLabelEImagem:(UIView*)tecla :(NSString*)nome{
    
    UILabel *textoNota = [[UILabel alloc]initWithFrame:CGRectMake(25.25, 140, 30, 30)];
    textoNota.text = nome;
    textoNota.numberOfLines = 1;
    textoNota.textColor = [UIColor blackColor];
    textoNota.textAlignment = NSTextAlignmentCenter;
    
    UIImageView *img;
    if([nome isEqualToString:@"Dó"]){
        img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Do4tempos.png"]];
    }else if([nome isEqualToString:@"Ré"]){
        img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Re4tempos.png"]];
    }else if([nome isEqualToString:@"Mi"]){
        img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Mi4tempos.png"]];
    }else if([nome isEqualToString:@"Fá"]){
        img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fa4Tempos.png"]];
    }else if([nome isEqualToString:@"Sol"]){
        img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Sol4Tempos.png"]];
    }else if([nome isEqualToString:@"Lá"]){
        img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"La4Tempos.png"]];
    }else if([nome isEqualToString:@"Si"]){
        img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Si4Tempos.png"]];
    }
    
    img.frame = CGRectMake(0, 35, 80, 100);
    
    
    [tecla addSubview:textoNota];
    [tecla addSubview:img];
    
}





@end
