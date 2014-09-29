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

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Fonte padrão
    [[UILabel appearance] setFont:[UIFont fontWithName:@"Kronika" size:17.0]];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.nuvemDireita.layer removeAllAnimations];
    [self.nuvemEsquerda.layer removeAllAnimations];
    NSLog(@"Removeu!");
}

-(void)viewWillAppear:(BOOL)animated{
    [self animacoesIntro];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)animacoesIntro{
    [self animacaoNuvem];

   [self animacaoPorteira];
}

-(void)animacaoNuvem{
    
    NSLog(@"pos d = %f -- %f",self.nuvemDireita.frame.origin.x,self.nuvemDireita.frame.origin.y);

    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath:@"position"];
    
    
    // Setting starting position
    [move setFromValue:[NSValue valueWithCGPoint: CGPointMake(self.nuvemDireita.frame.origin.x, self.nuvemDireita.frame.origin.y+40)]];
    
    // Setting ending position
    [move setToValue:[NSValue valueWithCGPoint:CGPointMake(self.nuvemDireita.frame.origin.x-1224, self.nuvemDireita.frame.origin.y+40)]];
    
    NSLog(@"pos d = %f -- %f",self.nuvemDireita.frame.origin.x,self.nuvemDireita.frame.origin.y);
    
    // MAKE SURE IT DOESN'T MOVE BACK TO STARTING POSITION
    [move setRemovedOnCompletion: YES];
   // [mover setFillMode:kCAFillModeForwards];

    // It will last 1 second and will be delayed by 3 seconds
    [move setDuration: 30];
    [move setRepeatCount: INFINITY];
    
    // Add it to the layer
    [self.nuvemDireita.layer addAnimation: move forKey:@"BigMove"];
    
    
//    [UIView animateWithDuration: 60
//                          delay: 1.0
//                        options:  UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionTransitionCrossDissolve
//                     animations:^{
//                         
//                         self.nuvemDireita.frame = CGRectMake(self.nuvemDireita.frame.origin.x - 1224, self.nuvemDireita.frame.origin.y, self.nuvemDireita.frame.size.width, self.nuvemDireita.frame.size.height);
//                         self.nuvemEsquerda.frame = CGRectMake(self.nuvemEsquerda.frame.origin.x + 1324, self.nuvemEsquerda.frame.origin.y, self.nuvemEsquerda.frame.size.width, self.nuvemEsquerda.frame.size.height);
//                         
//                         NSLog(@"Animação acontecendo");
//                     }
//                     completion:^(BOOL finished){
//                         NSLog(@"Acabou animação nuvem direita");
//                     }];
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
    animacao.values = [self animationCGImagesArray: self.porteira];
    [self.porteira.layer addAnimation: animacao forKey:@"contents"];
    
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
