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
   
    NSString *path = [[NSBundle mainBundle]pathForResource:@"0.0" ofType:@"mp3"];
    AVAsset *link = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
    AVPlayerItem *item =[[AVPlayerItem alloc]initWithAsset:link];
    [self.listaAudios addObject:item];
}

-(void)criaItens2{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"0.1" ofType:@"mp3"];
    AVAsset *link = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
    AVPlayerItem *item =[[AVPlayerItem alloc]initWithAsset:link];
    [self.listaAudios addObject:item];
}

-(void)criaItens3{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"0.2" ofType:@"mp3"];
    AVAsset *link = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
    AVPlayerItem *item =[[AVPlayerItem alloc]initWithAsset:link];
    [self.listaAudios addObject:item];
}

-(void)criaItens4{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"0.3" ofType:@"mp3"];
    AVAsset *link = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
    AVPlayerItem *item =[[AVPlayerItem alloc]initWithAsset:link];
    [self.listaAudios addObject:item];
}

-(void)criaItens5{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"0.4" ofType:@"mp3"];
    AVAsset *link = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
    AVPlayerItem *item =[[AVPlayerItem alloc]initWithAsset:link];
    [self.listaAudios addObject:item];
}

-(void)criaItens6{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"0.5" ofType:@"mp3"];
    AVAsset *link = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
    AVPlayerItem *item =[[AVPlayerItem alloc]initWithAsset:link];
    [self.listaAudios addObject:item];
}

-(void)criaItens7{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"0.6" ofType:@"mp3"];
    AVAsset *link = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
    AVPlayerItem *item =[[AVPlayerItem alloc]initWithAsset:link];
    [self.listaAudios addObject:item];
}

-(void)criaItens8{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"0.6.1" ofType:@"mp3"];
    AVAsset *link = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
    AVPlayerItem *item =[[AVPlayerItem alloc]initWithAsset:link];
    [self.listaAudios addObject:item];
}

-(void)criaItens9{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"0.6.2" ofType:@"mp3"];
    AVAsset *link = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
    AVPlayerItem *item =[[AVPlayerItem alloc]initWithAsset:link];
    [self.listaAudios addObject:item];
}

-(void)criaItens10{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"0.6.3" ofType:@"mp3"];
    AVAsset *link = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
    AVPlayerItem *item =[[AVPlayerItem alloc]initWithAsset:link];
    [self.listaAudios addObject:item];
}

-(void)criaItens11{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"0.6.4" ofType:@"mp3"];
    AVAsset *link = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
    AVPlayerItem *item =[[AVPlayerItem alloc]initWithAsset:link];
    [self.listaAudios addObject:item];
}

-(void)criaItens12{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"0.6.5" ofType:@"mp3"];
    AVAsset *link = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
    AVPlayerItem *item =[[AVPlayerItem alloc]initWithAsset:link];
    [self.listaAudios addObject:item];
}

////////////////////////////////////////////////////////////////////////////////

-(void)criaImg1{
    UIImage *img = [UIImage imageNamed:@"imgTutorialMenu.png"];
    [self.listaImagens addObject:img];
}

-(void)criaImg2{
    UIImage *img = [UIImage imageNamed:@"imgTutorialBtnJornada.png"];
    [self.listaImagens addObject:img];
}

-(void)criaImg3{
    UIImage *img = [UIImage imageNamed:@"imgTutorialMapa.png"];
    [self.listaImagens addObject:img];
}

-(void)criaImg4{
    UIImage *img = [UIImage imageNamed:@"imgTutorialBtnEstudio.png"];
    [self.listaImagens addObject:img];
}

-(void)criaImg5{
    UIImage *img = [UIImage imageNamed:@"imgTutorialBtnJogos.png"];
    [self.listaImagens addObject:img];
}

-(void)criaImg6{
    UIImage *img = [UIImage imageNamed:@"imgTutorialBtnPause.png"];
    [self.listaImagens addObject:img];
}

-(void)criaImg7{
    UIImage *img = [UIImage imageNamed:@"imgTutorialBtnAjuda.png"];
    [self.listaImagens addObject:img];
}

-(void)criaImg8{
    UIImage *img = [UIImage imageNamed:@"imgTutorialBtnAjuda.png"];
    [self.listaImagens addObject:img];
}

-(void)criaImg9{
    UIImage *img = [UIImage imageNamed:@"imgTutorialBtnAjuda.png"];
    [self.listaImagens addObject:img];
}

-(void)criaImg10{
    UIImage *img = [UIImage imageNamed:@"imgTutorialBtnAjuda.png"];
    [self.listaImagens addObject:img];
}

-(void)criaImg11{
    UIImage *img = [UIImage imageNamed:@"imgTutorialBtnAjuda.png"];
    [self.listaImagens addObject:img];
}

////////////////////////////////////////////////////////////////////////////////

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[GerenciadorComponenteView sharedManager]addComponentesMascote:self:-40:200:@"zecao"];

    
    self.viewPrincipal.layer.cornerRadius = 20.0f;
    self.viewPrincipal.layer.borderWidth = 1.0f;
    self.viewPrincipal.layer.borderColor = [UIColor blackColor].CGColor;
    
    
    self.imgTutorial.layer.cornerRadius = 0.0f;
    self.imgTutorial.layer.borderWidth = 1.0f;
    self.imgTutorial.layer.borderColor = [UIColor blackColor].CGColor;
    
    
    self.listaAudios = [[NSMutableArray alloc]init];
    self.listaImagens = [[NSMutableArray alloc]init];
    self.indiceLista = 0;
    self.estadoParaPlayer = NO;
    
    [self criaItens1];
    //[self criaItens2];
    [self criaItens3];
    [self criaItens4];
    [self criaItens5];
    [self criaItens6];
    [self criaItens7];
    [self criaItens8];
    [self criaItens9];
    [self criaItens10];
    [self criaItens11];
    [self criaItens12];
  
    
    [self criaImg1];
    [self criaImg2];
    [self criaImg3];
    [self criaImg4];
    [self criaImg5];
    [self criaImg6];
    [self criaImg7];
    [self criaImg8];
    [self criaImg9];
    [self criaImg10];
    [self criaImg11];
    
    
    self.player = [[AVPlayer alloc]initWithPlayerItem:[self.listaAudios objectAtIndex:self.indiceLista]];
    [self.player seekToTime:kCMTimeZero];
    [self.player play];
    [self performSelector:@selector(tocaAudioGambi) withObject:nil afterDelay:5.5];
    
    self.imgTutorial.image = [self.listaImagens objectAtIndex:self.indiceLista];

}

-(void)tocaAudioGambi{
    if(!self.estadoParaPlayer){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"0.1" ofType:@"mp3"];
        AVAsset *link = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
        AVPlayerItem *item =[[AVPlayerItem alloc]initWithAsset:link];
        
        self.player = [[AVPlayer alloc]initWithPlayerItem:item];
        [self.player seekToTime:kCMTimeZero];
        [self.player play];
        
        
        [self performSelector:@selector(desapareceBotao) withObject:nil afterDelay:4.0];
    }

}

-(void)desapareceBotao{
    if(self.indiceLista == self.listaAudios.count-2){
        self.lblProximo.hidden = YES;
        self.lblBtnFazenda.hidden = NO;
    }else{
        self.lblProximo.hidden = NO;
    }
    
}

- (IBAction)btnProximo:(id)sender {
    
    if(self.indiceLista != self.listaAudios.count-1){
        self.indiceLista += 1;
        self.lblProximo.hidden = YES;
        
        self.player = [[AVPlayer alloc]initWithPlayerItem:[self.listaAudios objectAtIndex:self.indiceLista]];
        [self.player seekToTime:kCMTimeZero];
        [self.player play];
        
        self.imgTutorial.image = [self.listaImagens objectAtIndex:self.indiceLista];

        Float64 dur = CMTimeGetSeconds(self.player.currentItem.asset.duration);
        [self performSelector:@selector(desapareceBotao) withObject:nil afterDelay:0.1];
        
    }else{
       
    }

}

- (IBAction)btnRepetir:(id)sender {
    
    [self.player seekToTime:kCMTimeZero];
    [self.player play];
}


//Finaliza animações
- (void)viewDidDisappear:(BOOL)animated {
    
    self.estadoParaPlayer = YES;
    [[GerenciadorComponenteView sharedManager] finalizaExercicio: self];
    [self.player pause];
}

//Mostra animações
-(void)viewWillAppear:(BOOL)animated{
    
    [[MascoteViewController sharedManager]colocaAnimacaoMascote:@"ZecaoTchau"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
    
}

- (IBAction)btnFazenda:(id)sender {
    
}






@end
