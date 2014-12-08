//
//  TutorialViewController.m
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 05/12/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "TutorialViewController.h"

@interface TutorialViewController ()

@end

@implementation TutorialViewController

//    self.player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(playerItemDidReachEnd:)
//                                                 name:AVPlayerItemDidPlayToEndTimeNotification
//                                               object:[self.player currentItem]];
//
//
//
//- (void)playerItemDidReachEnd:(NSNotification *)notification {
//    AVPlayerItem *p = [notification object];
//    [p seekToTime:kCMTimeZero];
//    NSLog(@"fgdfg");
//}


-(void)criaItens1{
   
    NSString *path = [[NSBundle mainBundle]pathForResource:@"carro" ofType:@"mp3"];
    AVAsset *link = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
    AVPlayerItem *item =[[AVPlayerItem alloc]initWithAsset:link];
    [self.listaAudios addObject:item];
}

-(void)criaItens2{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"bola" ofType:@"mp3"];
    AVAsset *link = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
    AVPlayerItem *item =[[AVPlayerItem alloc]initWithAsset:link];
    [self.listaAudios addObject:item];
}

-(void)criaVideo1{
    UIImage *img = [UIImage imageNamed:@"backxilofone1-2.png"];
    [self.listaImagens addObject:img];
}

-(void)criaVideo2{
    UIImage *img = [UIImage imageNamed:@"backOutrosInstrumentos1.png"];
    [self.listaImagens addObject:img];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewPrincipal.layer.cornerRadius = 20.0f;
    self.viewPrincipal.layer.borderWidth = 1.0f;
    self.viewPrincipal.layer.borderColor = [UIColor blackColor].CGColor;
    
    self.listaAudios = [[NSMutableArray alloc]init];
    self.listaImagens = [[NSMutableArray alloc]init];
    self.indiceLista = 0;
    
    [self criaItens1];
    [self criaItens2];
    
    [self criaVideo1];
    [self criaVideo2];
    
    self.player = [[AVPlayer alloc]initWithPlayerItem:[self.listaAudios objectAtIndex:self.indiceLista]];
    [self.player seekToTime:kCMTimeZero];
    [self.player play];
    
    self.imgTutorial.image = [self.listaImagens objectAtIndex:self.indiceLista];
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

- (IBAction)btnProximo:(id)sender {
    
    if(self.indiceLista != self.listaAudios.count-1){
        self.indiceLista += 1;
        
        self.player = [[AVPlayer alloc]initWithPlayerItem:[self.listaAudios objectAtIndex:self.indiceLista]];
        [self.player seekToTime:kCMTimeZero];
        [self.player play];
        
        self.imgTutorial.image = [self.listaImagens objectAtIndex:self.indiceLista];

        
    }

}

- (IBAction)btnRepetir:(id)sender {
    
    [self.player seekToTime:kCMTimeZero];
    [self.player play];
}



@end
