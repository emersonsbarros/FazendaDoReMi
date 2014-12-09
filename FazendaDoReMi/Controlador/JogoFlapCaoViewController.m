//
//  JogoFlapCaoViewController.m
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 08/12/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "JogoFlapCaoViewController.h"

@interface JogoFlapCaoViewController ()

@end

@implementation JogoFlapCaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self chamaJogo];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)chamaJogo{
    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = NO;
    skView.showsNodeCount = NO;
    
    // Create and configure the scene.
    SKScene * scene = [JogoScrollMusica sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
    
}


@end
