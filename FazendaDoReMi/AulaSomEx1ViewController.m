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
    
    
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoVoltaMapa:self];

    
    //Add referencia puchando da base de itens (nomeItem,outlet,tipoGesture:parametros + metodos:parementros + n..)
    [[ControladorDeItem sharedManager]retornaItem:@"piano":self.imgPiano:@"gestureTap:1:1 + 1 + 2 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"flauta":self.imgFlauta:@"gestureTap:1:1 + 1 + 2 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"tambor":self.imgTambor:@"gestureTap:1:1 + 1 + 2 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"violao":self.imgViolao:@"gestureTap:1:1 + 1 + 2 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"xilofone":self.imgXilofone:@"gestureTap:1:1 + 1 + 2 + 3:5.0:5.0:1.0:1.5"];
    
    [[ControladorDeItem sharedManager]retornaItem:@"saxfone":self.imgSaxfone:@"gestureTap:1:1 + 1 + 2 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"chocalho":self.imgChocalho:@"gestureTap:1:1 + 1 + 2 + 3:5.0:5.0:1.0:1.5"];
    [[ControladorDeItem sharedManager]retornaItem:@"violino":self.imgViolino:@"gestureTap:1:1 + 1 + 2 + 3:5.0:5.0:1.0:1.5"];
    
    [[ControladorDeItem sharedManager]retornaItem:@"florRocha":self.imgFlorAgua:@"gestureTap:1:1"];
    [[ControladorDeItem sharedManager]retornaItem:@"florRosa":self.imgFlorGiratoria:@"gestureTap:1:1 + 4"];
    
    [[ControladorDeItem sharedManager]retornaItem:@"quadroZecao":self.imgQuadro:@"gestureTap:1:1 + 5"];
    
    
    //Add os itens que é desejado pressionar para decorrer com o proximo exercicio
    [[ControladorDeItem sharedManager]chamaVerificador:[NSArray arrayWithObjects:self.imgFlauta,self.imgPiano,self.imgTambor,self.imgViolao,self.imgXilofone,self.imgSaxfone,self.imgChocalho,self.imgViolino,nil]];
    
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
