//
//  MenuViewController.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 26/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Fonte padrão
    [[UILabel appearance] setFont:[UIFont fontWithName:@"Kronika" size:17.0]];
    
    [GerenciadorNavigationController sharedManager].controladorApp = self.navigationController;
    
    [self animacoesIntro];


}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.nuvemDireita.layer removeAllAnimations];
    [self.nuvemEsquerda.layer removeAllAnimations];
    [self.imgMascote.layer removeAllAnimations];
    [self.listaImagensMascote removeAllObjects];
    
}

-(void)viewWillAppear:(BOOL)animated{
    //Mascote
    self.listaImagensMascote = [[NSMutableArray alloc]init];
    
    UIImage *image;
    NSString *nomeImagem;
    
    for(int i=1;i<=73;i++){
        if(i<=9){
            nomeImagem = [NSString stringWithFormat:@"%@%d%@",@"ZECAO0",i,@".png"];
        }else{
            nomeImagem = [NSString stringWithFormat:@"%@%d%@",@"ZECAO",i,@".png"];
        }
        
        image = [UIImage imageNamed:nomeImagem];
        [self.listaImagensMascote addObject:image];
    }
    
    
    [self animacaoMascote];
    

}


-(void)animacoesIntro{
    
    [self animacaoNuvem];

    [self animacaoPorteira];
}

-(void)animacaoNuvem{
    

    CABasicAnimation *moveNuvemDireita= [CABasicAnimation animationWithKeyPath:@"position"];
    // Setting starting position
    [moveNuvemDireita setFromValue:[NSValue valueWithCGPoint: CGPointMake(self.nuvemDireita.frame.origin.x+100, self.nuvemDireita.frame.origin.y+40)]];
    // Setting ending position
    [moveNuvemDireita setToValue:[NSValue valueWithCGPoint:CGPointMake(self.nuvemDireita.frame.origin.x-1224, self.nuvemDireita.frame.origin.y+40)]];
    // MAKE SURE IT DOESN'T MOVE BACK TO STARTING POSITION
    [moveNuvemDireita setRemovedOnCompletion: YES];
   // [mover setFillMode:kCAFillModeForwards];
    // It will last 1 second and will be delayed by 3 seconds
    [moveNuvemDireita setDuration: 120];
    [moveNuvemDireita setRepeatCount: INFINITY];
    // Add it to the layer
    [self.nuvemDireita.layer addAnimation: moveNuvemDireita forKey:@"BigMove"];
    
    
    
    CABasicAnimation *moveNuvemEsquerda= [CABasicAnimation animationWithKeyPath:@"position"];
    [moveNuvemEsquerda setFromValue:[NSValue valueWithCGPoint: CGPointMake(self.nuvemEsquerda.frame.origin.x-100, self.nuvemEsquerda.frame.origin.y+40)]];
    [moveNuvemEsquerda setToValue:[NSValue valueWithCGPoint:CGPointMake(self.nuvemEsquerda.frame.origin.x+1480, self.nuvemEsquerda.frame.origin.y+40)]];
    [moveNuvemEsquerda setRemovedOnCompletion: YES];
    [moveNuvemEsquerda setDuration:120];
    [moveNuvemEsquerda setRepeatCount: INFINITY];
    [self.nuvemEsquerda.layer addAnimation: moveNuvemEsquerda forKey:@"BigMove"];
    
    
}

-(void)animacaoPorteira{
    
    UIImage *image1 = [UIImage imageNamed:@"porteira-1.png"];
    UIImage *image2 = [UIImage imageNamed:@"porteira-2.png"];
    UIImage *image3 = [UIImage imageNamed:@"porteira-3.png"];
    UIImage *image4 = [UIImage imageNamed:@"porteira-4.png"];
    UIImage *image5 = [UIImage imageNamed:@"porteira-5.png"];

    NSArray *imageArray = [NSArray arrayWithObjects:image1, image2, image3, image4, image5, nil];
    self.porteira.animationImages = imageArray;
    
    CAKeyframeAnimation *animacao = [CAKeyframeAnimation animationWithKeyPath: @"contents"];
    animacao.calculationMode = kCAAnimationDiscrete;
    animacao.autoreverses = NO;
    animacao.duration = 1;
    animacao.repeatCount = 1;
    animacao.beginTime = CACurrentMediaTime() + 2;
    animacao.fillMode = kCAFillModeForwards;
    animacao.removedOnCompletion = NO;
    animacao.additive = NO;
    animacao.values = [self animationCGImagesArray: self.porteira];
    [self.porteira.layer addAnimation: animacao forKey:@"contents"];
    

    
    
    [self performSelector:@selector(animacaoBotoes) withObject:NULL afterDelay:5];
    
}

-(void)animacaoBotoes{
    
    
    
    CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    theAnimation.duration=1.0;
    theAnimation.repeatCount=1;
    theAnimation.autoreverses=NO;
    theAnimation.fromValue=[NSNumber numberWithFloat:0.0];
    theAnimation.toValue=[NSNumber numberWithFloat:1.0];
    theAnimation.fillMode = kCAFillModeForwards;
    theAnimation.removedOnCompletion = NO;
    
    
    [self.lblBtnJornda.layer addAnimation:theAnimation forKey:@"animateOpacity"];
    [self.lblBtnJogos.layer addAnimation:theAnimation forKey:@"animateOpacity"];
    [self.lblBtnEstudio.layer addAnimation:theAnimation forKey:@"animateOpacity"];
    
    
    [self.view addSubview:self.btoJornada];
    
}


-(void)animacaoMascote{
    
    self.imgMascote.animationImages = self.listaImagensMascote;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 5;
    animationGroup.beginTime = CACurrentMediaTime() + 2;
    animationGroup.repeatCount = INFINITY;
    CAMediaTimingFunction *easeOut = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];

    CAKeyframeAnimation *animacao = [CAKeyframeAnimation animationWithKeyPath: @"contents"];
    animacao.calculationMode = kCAAnimationDiscrete;
    animacao.autoreverses = NO;
    animacao.duration = 2.0;
    animacao.repeatCount = 1;
    animacao.timingFunction = easeOut;
    animacao.values = [self animationCGImagesArray: self.imgMascote];
    animationGroup.animations = @[animacao];
    
    
    [self.imgMascote.layer addAnimation:animationGroup forKey:@"contents"];

}


//Aux que converte para CGImage, unico jeito para dar certo
-(NSArray*)animationCGImagesArray:(UIImageView*)imgAddAnimacao {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[imgAddAnimacao.animationImages count]];
    for (UIImage *image in imgAddAnimacao.animationImages) {
        [array addObject:(id)[image CGImage]];
    }
    return [NSArray arrayWithArray:array];
}

@end
