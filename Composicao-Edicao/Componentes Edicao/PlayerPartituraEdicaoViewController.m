//
//  PlayerPartituraEdicaoViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 07/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "PlayerPartituraEdicaoViewController.h"

@interface PlayerPartituraEdicaoViewController ()

@end

@implementation PlayerPartituraEdicaoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

+(PlayerPartituraEdicaoViewController*)sharedManager{
    static PlayerPartituraEdicaoViewController *unicoInstrumento = nil;
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
    
    }
    return self;
}



-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear: animated];
    
    self.lblStopPartitura.hidden = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.lblStopPartitura.hidden = YES;

    
}


////////////////////////////////// METODOS //////////////////////////////////////////


//metodo que atualiza a qt de notas inseridas
-(void)atualizaQtdNotas{
    
    self.txtQtd.text = [NSString stringWithFormat:@"%lu",(unsigned long)[DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count];

}


////////////////////////////////// Player //////////////////////////////////////////

//Toca todas as notas do usario
- (IBAction)tocarTodasNoras:(id)sender {
    if(([DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count != 0)){
        [[ComponenteScrollEdicao sharedManager]tocaPartituraEdicao];
        self.lblStopPartitura.hidden = NO;
    }
}

//Limpa as notas da tela
- (IBAction)limparNotasPartituraEdicao:(id)sender {
    
    //[[ComponenteScrollEdicao sharedManager]limparPartituraEdicao];
 [[Sinfonia sharedManager]pararPlayerPartitura];
}

- (IBAction)stopPartitura:(id)sender {
    self.lblStopPartitura.hidden = YES;
    [[Sinfonia sharedManager]pararPlayerPartitura];
    
}




@end
