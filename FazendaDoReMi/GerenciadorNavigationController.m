//
//  GerenciadorNavigationController.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 07/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "GerenciadorNavigationController.h"

@implementation GerenciadorNavigationController


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
+(GerenciadorNavigationController*)sharedManager{
    static GerenciadorNavigationController *gerenciadorDeSom = nil;
    
    if(!gerenciadorDeSom){
        gerenciadorDeSom = [[super allocWithZone: nil] init];
    }
    return gerenciadorDeSom;
}


-(UIViewController*)retornaViewControllerStoryBoard:(NSString*)nomeview{
    for(UIViewController *controladores in [GerenciadorNavigationController sharedManager].controladorApp.viewControllers){
        if([controladores.restorationIdentifier isEqualToString:nomeview]){
            return controladores;
        }
    }
    return NULL;
}


-(void)pushViewController{
//    UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"WebVideo"];
//    [self.navigationController pushViewController:controller animated:YES];
}

@end
