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

//////////////////////////// SINGTON //////////////////////////// 

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


//////////////////////////// VIEWCONTROLLER ////////////////////////////


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

-(void)addAnimacaoSpriteCarremento{
    
    UIImage *image1 = [UIImage imageNamed:@"imgcarregamento1.png"];
    UIImage *image2 = [UIImage imageNamed:@"imgcarregamento2.png"];
    UIImage *image3 = [UIImage imageNamed:@"imgcarregamento3.png"];
    UIImage *image4 = [UIImage imageNamed:@"imgcarregamento4.png"];
    UIImage *image5 = [UIImage imageNamed:@"imgcarregamento5.png"];
    NSArray *imageArray = [NSArray arrayWithObjects:image1, image2, image3, image4, image5,nil];
    [ComposicaoPartituraViewController sharedManager].imgCarremento.animationImages = imageArray;
    
    
    CAKeyframeAnimation *animacao = [CAKeyframeAnimation animationWithKeyPath: @"contents"];
    animacao.calculationMode = kCAAnimationDiscrete;
    animacao.duration = 1.0;
    animacao.repeatCount = INFINITY;
    animacao.autoreverses = NO;
    animacao.beginTime = CACurrentMediaTime() + 0.2;
    animacao.fillMode = kCAFillModeForwards;
    animacao.removedOnCompletion = YES;
    animacao.additive = NO;
    animacao.values = [self animationCGImagesArray:[ComposicaoPartituraViewController sharedManager].imgCarremento];
    [[ComposicaoPartituraViewController sharedManager].imgCarremento.layer addAnimation: animacao forKey:@"animacaoSprite"];
    
}

//Aux que converte para CGImage, unico jeito para dar certo
-(NSArray*)animationCGImagesArray:(UIImageView*)imgAddAnimacao {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[imgAddAnimacao.animationImages count]];
    for (UIImage *image in imgAddAnimacao.animationImages) {
        [array addObject:(id)[image CGImage]];
    }
    return [NSArray arrayWithArray:array];
}



//////////////////////////// METODOS AUXILIARES ////////////////////////////////////


//Adiciona Scroll Terceiro
-(void)mostraBotoesInstrumentos{
    
    [GerenciadorBotaoInstrumento sharedManager].isp = [[InfiniteScrollPicker alloc] initWithFrame:CGRectMake(0, -20, 455, 150)];
    [[GerenciadorBotaoInstrumento sharedManager].isp setItemSize:CGSizeMake(80, 80)];
    [[GerenciadorBotaoInstrumento sharedManager].isp setImageAry:[GerenciadorBotaoInstrumento sharedManager].listaBotoesInstrumentos];
    [[GerenciadorBotaoInstrumento sharedManager].isp setSelectedItem:0];
    [self.view addSubview:[GerenciadorBotaoInstrumento sharedManager].isp];
    
}


//Troca de instrumento
-(void)desapareceTelaCarregamento{
    [[ComposicaoPartituraViewController sharedManager].imgCarremento stopAnimating];
    [[Sinfonia sharedManager]trocaInstrumentoESoundBank];
    [ComposicaoPartituraViewController sharedManager].viewTelaCarregamento.hidden = YES;
}

//Timer para trocar instrumento
-(void)chamaTelaCarregamento{
     [ComposicaoPartituraViewController sharedManager].viewTelaCarregamento.hidden = NO;
    [self addAnimacaoSpriteCarremento];
    [self performSelector:@selector(desapareceTelaCarregamento) withObject:nil afterDelay:4.1];
}



- (void)infiniteScrollPicker:(InfiniteScrollPicker *)infiniteScrollPicker didSelectAtImage:(UIImage *)image{
    NSLog(@"selected");
}





@end
