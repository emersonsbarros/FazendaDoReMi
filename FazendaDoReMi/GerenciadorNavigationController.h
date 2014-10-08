//
//  GerenciadorNavigationController.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 07/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GerenciadorNavigationController : NSObject


@property UINavigationController *controladorApp;

+(GerenciadorNavigationController*)sharedManager;

-(UIViewController*)retornaViewControllerStoryBoard:(NSString*)nomeview;


@end
