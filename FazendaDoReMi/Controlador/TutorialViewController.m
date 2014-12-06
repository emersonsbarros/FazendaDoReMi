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


-(void)criaItens{
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.listaAudios = [[NSMutableArray alloc]init];
    self.listaVideos = [[NSMutableArray alloc]init];
    self.indiceLista = 0;
    
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"carro" ofType:@"mp3"];
    self.link = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
    self.item =[[AVPlayerItem alloc]initWithAsset:self.link];
    self.player = [[AVPlayer alloc]initWithPlayerItem:self.item];
    self.layer =[AVPlayerLayer playerLayerWithPlayer:self.player];
    self.layer.frame = CGRectMake(0, 0, self.viewVideo.frame.size.width, self.viewVideo.frame.size.height);
    [self.viewVideo.layer addSublayer:self.layer];
    [self.layer setBackgroundColor:[[UIColor blackColor]CGColor]];
    
    [self.player seekToTime:kCMTimeZero];
    [self.player play];
    self.player.actionAtItemEnd = AVPlayerActionAtItemEndNone;

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playerItemDidReachEnd:)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:[self.player currentItem]];
    
    
}

- (void)playerItemDidReachEnd:(NSNotification *)notification {
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero];
    NSLog(@"fgdfg");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnProximo:(id)sender {
    self.indiceLista += 1;
    
}



@end
