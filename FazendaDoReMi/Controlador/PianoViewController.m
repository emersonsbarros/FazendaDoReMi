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

- (IBAction)tecla4c:(id)sender {
    
    self.nota4a = [[Nota alloc]init];
    self.nota4a.imagemAcidente = NULL;
    self.nota4a.imagePontoNota = NULL;
    self.nota4a.nomeNota = @"C";
    self.nota4a.oitava = @"4";
    self.nota4a.duracao = @"0";
    
    [NSTimer scheduledTimerWithTimeInterval:.0 target:self selector:@selector(tocarNota:) userInfo:self.nota4a repeats:NO];

}

- (IBAction)tecla4d:(id)sender {
    
    self.nota4b = [[Nota alloc]init];
    self.nota4b.imagemAcidente = NULL;
    self.nota4b.imagePontoNota = NULL;
    self.nota4b.nomeNota = @"D";
    self.nota4b.oitava = @"4";
    self.nota4b.duracao = @"0";
    
    [NSTimer scheduledTimerWithTimeInterval:.0 target:self selector:@selector(tocarNota:) userInfo:self.nota4b repeats:NO];
}

- (IBAction)tecla4e:(id)sender {
    
}

- (IBAction)tecla4f:(id)sender {
    
}

- (IBAction)tecla4g:(id)sender {
    
}

- (IBAction)tecla4a:(id)sender {
    
}

- (IBAction)tecla4b:(id)sender {
    
}



@end
