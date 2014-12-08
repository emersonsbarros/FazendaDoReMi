//
//  TutorialViewController.h
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 05/12/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>


@interface TutorialViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imgTutorial;

@property NSMutableArray *listaImagens;
@property NSMutableArray *listaAudios;
@property int indiceLista;


@property MPMoviePlayerController *moviePlayer;
@property AVPlayer *player;
@property AVPlayerLayer *layer;

@property (weak, nonatomic) IBOutlet UIView *viewPrincipal;

@property (weak, nonatomic) IBOutlet UIView *viewVideo;

- (IBAction)btnProximo:(id)sender;
- (IBAction)btnRepetir:(id)sender;

@end
