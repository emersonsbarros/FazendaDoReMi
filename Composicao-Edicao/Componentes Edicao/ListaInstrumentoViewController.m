//
//  ListaInstrumentoViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 04/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "ListaInstrumentoViewController.h"

@interface ListaInstrumentoViewController ()

@end

@implementation ListaInstrumentoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}


-(id)init{
    self = [super init];
    
    if(self){
   
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

//Singleton
+(ListaInstrumentoViewController*)sharedManager{
    static ListaInstrumentoViewController *gerenciadorDeItem = nil;
    
    if(!gerenciadorDeItem){
        gerenciadorDeItem = [[super allocWithZone: nil] init];
    }
    return gerenciadorDeItem;
}





- (void)viewDidLoad
{
    [super viewDidLoad];
    [self mostraBotoesInstrumentos];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear: animated];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


////////////////////////////METODOS////////////////////////////////////


//-(void)chamaExercicios:(id)sender{
//    BotaoInstrumento *button = sender;
//    
//    [[ComposicaoPartituraViewController sharedManager]chamaTelaCarregamento];
//    [EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura = button.nomeInstrumento;
//    self.imgFundo.image = [UIImage imageNamed:@"fundoazul.png"];
//    self.imgFundoSecundario.image = [UIImage imageNamed:@"fundocasa.png"];
//}


-(void)mostraBotoesInstrumentos{
    
    self.isp = [[InfiniteScrollPicker alloc] initWithFrame:CGRectMake(0, -20, 455, 150)];
    [self.isp setItemSize:CGSizeMake(80, 80)];
    [self.isp setImageAry:[GerenciadorBotaoInstrumento sharedManager].listaBotoesInstrumentos];
    [self.isp setSelectedItem:5];
    [self.view addSubview:self.isp];
}



- (void)infiniteScrollPicker:(InfiniteScrollPicker *)infiniteScrollPicker didSelectAtImage:(UIImage *)image
{
    NSLog(@"selected");
}


///////





@end
