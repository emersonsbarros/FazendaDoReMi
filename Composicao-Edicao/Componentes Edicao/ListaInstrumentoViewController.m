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
    
    [GerenciadorBotaoInstrumento sharedManager].isp = [[InfiniteScrollPicker alloc] initWithFrame:CGRectMake(0, -20, 455, 150)];
    [[GerenciadorBotaoInstrumento sharedManager].isp setItemSize:CGSizeMake(80, 80)];
    [[GerenciadorBotaoInstrumento sharedManager].isp setImageAry:[GerenciadorBotaoInstrumento sharedManager].listaBotoesInstrumentos];
    [[GerenciadorBotaoInstrumento sharedManager].isp setSelectedItem:5];
    [self.view addSubview:[GerenciadorBotaoInstrumento sharedManager].isp];
    
    
}



-(void)desapareceTelaCarregamento{
    [[Sinfonia sharedManager]trocaInstrumentoESoundBank];
    self.viewCarregamento.hidden = YES;
}

-(void)chamaTelaCarregamento{
    self.viewCarregamento.hidden = NO;
    [self performSelector:@selector(desapareceTelaCarregamento) withObject:nil afterDelay:4.1];
}

- (void)infiniteScrollPicker:(InfiniteScrollPicker *)infiniteScrollPicker didSelectAtImage:(UIImage *)image
{
    NSLog(@"selected");
}


///////





@end
