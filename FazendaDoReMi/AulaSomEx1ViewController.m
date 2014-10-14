//
//  AulaSomViewController.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 07/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "AulaSomEx1ViewController.h"

@interface AulaSomEx1ViewController ()

@end

@implementation AulaSomEx1ViewController

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
    
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoVoltaMapa:self];

    
    //Add referencia puchando da base de itens (nomeItem,outlet,tipoGesture)
    [[GerenciadorDeItem sharedManager]retornaItem:@"piano":self.imgPiano:@"gestureTap"];
    [[GerenciadorDeItem sharedManager]retornaItem:@"flauta":self.imgFlauta:@"gestureTap"];
    [[GerenciadorDeItem sharedManager]retornaItem:@"tambor":self.imgTambor:@"gestureTap"];
    [[GerenciadorDeItem sharedManager]retornaItem:@"violao":self.imgViolao:@"gestureTap"];
    [[GerenciadorDeItem sharedManager]retornaItem:@"xilofone":self.imgXilofone:@"gestureTap"];
    
    
    
    //Add os itens que é desejado pressionar para decorrer com o proximo exercicio
    [[ControladorDeItem sharedManager]chamaVerificador:[NSArray arrayWithObjects:self.imgFlauta,self.imgPiano,self.imgTambor,self.imgViolao,self.imgXilofone, nil]];
    
    
     //[[GerenciadorAnimacoes sharedManager]animacaoSpriteEspecifica:self.imgTeste:@"pianoTocando":4:YES:NO:2.0];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    
}




@end
