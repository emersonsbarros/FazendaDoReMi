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
        // Custom initialization
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

-(void)tocarNota:(NSTimer*)tempo{
     [[Sinfonia sharedManager]tocarUmaNota:[NSMutableArray arrayWithObjects:[tempo userInfo], nil]:@"Piano"];
    [tempo invalidate];
}


-(void)tocarNota2:(NSTimer*)tempo{
    [[Sinfonia sharedManager]tocarUmaNota:[NSMutableArray arrayWithObjects:[tempo userInfo], nil]:@"Piano"];
    [tempo invalidate];
}


- (IBAction)tecla4c:(id)sender {
    
    self.nota4c = [[Nota alloc]init];
    self.nota4c.imagemAcidente = NULL;
    self.nota4c.imagePontoNota = NULL;
    self.nota4c.nomeNota = @"C";
    self.nota4c.oitava = @"4";
    self.nota4c.duracao = @"0";
    
     [[Sinfonia sharedManager]tocarUmaNota:[NSMutableArray arrayWithObjects:self.nota4c, nil]:@"Piano"];
}

- (IBAction)tecla4d:(id)sender {
    
    self.nota4d = [[Nota alloc]init];
    self.nota4d.imagemAcidente = NULL;
    self.nota4d.imagePontoNota = NULL;
    self.nota4d.nomeNota = @"D";
    self.nota4d.oitava = @"4";
    self.nota4d.duracao = @"0";
    
     [[Sinfonia sharedManager]tocarUmaNota:[NSMutableArray arrayWithObjects:self.nota4d, nil]:@"Piano"];
    
}

- (IBAction)tecla4e:(id)sender {
    self.nota4e = [[Nota alloc]init];
    self.nota4e.imagemAcidente = NULL;
    self.nota4e.imagePontoNota = NULL;
    self.nota4e.nomeNota = @"E";
    self.nota4e.oitava = @"4";
    self.nota4e.duracao = @"0";
    
    [[Sinfonia sharedManager]tocarUmaNota:[NSMutableArray arrayWithObjects:self.nota4e, nil]:@"Piano"];
}

- (IBAction)tecla4f:(id)sender {
    self.nota4f = [[Nota alloc]init];
    self.nota4f.imagemAcidente = NULL;
    self.nota4f.imagePontoNota = NULL;
    self.nota4f.nomeNota = @"F";
    self.nota4f.oitava = @"4";
    self.nota4f.duracao = @"0";
    
    [[Sinfonia sharedManager]tocarUmaNota:[NSMutableArray arrayWithObjects:self.nota4f, nil]:@"Piano"];
}

- (IBAction)tecla4g:(id)sender {
    self.nota4g = [[Nota alloc]init];
    self.nota4g.imagemAcidente = NULL;
    self.nota4g.imagePontoNota = NULL;
    self.nota4g.nomeNota = @"G";
    self.nota4g.oitava = @"4";
    self.nota4g.duracao = @"0";
    
    [[Sinfonia sharedManager]tocarUmaNota:[NSMutableArray arrayWithObjects:self.nota4g, nil]:@"Piano"];
}

- (IBAction)tecla4a:(id)sender {
    self.nota4a = [[Nota alloc]init];
    self.nota4a.imagemAcidente = NULL;
    self.nota4a.imagePontoNota = NULL;
    self.nota4a.nomeNota = @"A";
    self.nota4a.oitava = @"4";
    self.nota4a.duracao = @"0";
    
    [[Sinfonia sharedManager]tocarUmaNota:[NSMutableArray arrayWithObjects:self.nota4a, nil]:@"Piano"];
}

- (IBAction)tecla4b:(id)sender {
    self.nota4b = [[Nota alloc]init];
    self.nota4b.imagemAcidente = NULL;
    self.nota4b.imagePontoNota = NULL;
    self.nota4b.nomeNota = @"B";
    self.nota4b.oitava = @"4";
    self.nota4b.duracao = @"0";
    
    [[Sinfonia sharedManager]tocarUmaNota:[NSMutableArray arrayWithObjects:self.nota4b, nil]:@"Piano"];
}



@end
