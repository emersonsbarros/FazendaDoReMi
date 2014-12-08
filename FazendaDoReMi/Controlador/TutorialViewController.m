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
    NSString *path = [[NSBundle mainBundle]pathForResource:@"m" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    [self.listaVideos addObject:url];
}

-(void)criaVideo2{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"m" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    [self.listaVideos addObject:url];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.listaAudios = [[NSMutableArray alloc]init];
    self.listaVideos = [[NSMutableArray alloc]init];
    self.indiceLista = 0;
    
    [self criaItens1];
    [self criaItens2];
    
    [self criaVideo1];
    [self criaVideo2];
    
    self.player = [[AVPlayer alloc]initWithPlayerItem:[self.listaAudios objectAtIndex:self.indiceLista]];
    [self.player seekToTime:kCMTimeZero];
    [self.player play];
    
    self.moviePlayer=[[MPMoviePlayerController alloc] initWithContentURL:[self.listaVideos objectAtIndex:self.indiceLista]];
    self.moviePlayer.repeatMode = YES;
    self.moviePlayer.controlStyle = MPMovieControlStyleNone;
    self.moviePlayer.view.frame = CGRectMake(0, 0, self.viewVideo.frame.size.width, self.viewVideo.frame.size.height);
    [self.viewVideo addSubview:self.moviePlayer.view];
    [[self moviePlayer] play];
    
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
        
        [self.moviePlayer stop];
        NSURL *url= [self.listaVideos objectAtIndex:self.indiceLista];
        self.moviePlayer.contentURL = url;
        [self.moviePlayer play];

    }

}

- (IBAction)btnRepetir:(id)sender {
    
    [self.player seekToTime:kCMTimeZero];
    [self.player play];
}



@end
