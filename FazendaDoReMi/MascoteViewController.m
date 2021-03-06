//
//  MascoteViewController.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 08/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "MascoteViewController.h"

@interface MascoteViewController ()

@end

@implementation MascoteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

//Singleton
+(MascoteViewController*)sharedManager{
    static MascoteViewController *mascote = nil;
    if(!mascote){
        mascote = [[super allocWithZone:nil] init];
    }
    return mascote;
}

-(id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

-(id)initMascote:(NSString*)nomeMascote{
    self = [super init];
    if(self){
        self.nomeMascote = nomeMascote;
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//////////////////////////////////////////////////////////////////////////////////////////

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nomeMascote = @"zecao";
    
    self.imgMascote = [[GerenciadorDeMascote sharedManager]retornaMascote:self.nomeMascote];
    self.imgMascote.frame = CGRectMake(0, 0, 320, 490);
    [self.view addSubview:self.imgMascote];

}



-(void)colocaAnimacaoMascote:(NSString*)nomeAnimacao{
    [self.imgMascote.layer addAnimation:[[GerenciadorDeMascote sharedManager]retornaAnimacaoMascote:self.imgMascote:nomeAnimacao] forKey:@"contents"];
}


-(NSURL*)buscaUrlSomMascote:(NSString*)nomeAudio{
    
    for(Conversa *conversaMascote in self.imgMascote.listaDeConversas){
        for(Fala *falaMascote in conversaMascote.listaDeFalas){
            if([falaMascote.nome isEqualToString:nomeAudio]){
                return falaMascote.caminhoDoAudio;
            }
        }
    }
    
    return NULL;
}


-(void)executaSomMascote:(NSString*)nomeAudio :(float)delay{
    NSURL *url = [self buscaUrlSomMascote:nomeAudio];
    [self performSelector:@selector(playSom:) withObject:url afterDelay:delay];
}


-(void)playSom:(NSURL*)urlAudio{
    self.playerMascote = [[AVAudioPlayer alloc] initWithContentsOfURL:urlAudio error: nil];
    [self.playerMascote play];
}







@end
