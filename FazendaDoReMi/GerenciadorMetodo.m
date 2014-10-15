//
//  GerenciadorMetodo.m
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 14/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "GerenciadorMetodo.h"

#define CASE(str)                       if ([__s__ isEqualToString:(str)])
#define SWITCH(s)                       for (NSString *__s__ = (s); ; )
#define DEFAULT


@implementation GerenciadorMetodo

//Singleton
+(GerenciadorMetodo*)sharedManager{
    static GerenciadorMetodo *mascote = nil;
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

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


///////////////////////////////// CONTROLADORES METODOS //////////////////////////////////////


-(void)addGestureItem:(NSString*)nomeGesture :(Item*)viewContainer{
    
    NSArray* foo = [nomeGesture componentsSeparatedByString: @"+"];
    
    
    if([[foo objectAtIndex: 0] isEqualToString:@"gestureTap"]){
        GestureItem *gesture = [[GestureItem alloc]initWithTarget:self action:@selector(acaoToqueObjeto:)];
        gesture.listaMetodos = [[NSMutableArray alloc]init];
        gesture.metodosSolicidados = nomeGesture;
        gesture.numberOfTapsRequired = 1;
        gesture.numberOfTouchesRequired = 1;
        gesture.item = viewContainer;
        viewContainer.userInteractionEnabled = YES;
        [viewContainer addGestureRecognizer:gesture];
        
    }else if([nomeGesture isEqualToString:@"gestureLong"]){
        
        
    }else if([nomeGesture isEqualToString:@"gesturePinch"]){
        
        
    }else if([nomeGesture isEqualToString:@"gestureRotation"]){
        
        
    }else if([nomeGesture isEqualToString:@"gestureSwipe"]){
        
        
    }else if([nomeGesture isEqualToString:@"gesturePan"]){
        
        
    }else{
        
        
    }
}

-(void)quebraString:(GestureItem*)conjuntoMetodos{
    
    NSArray* listaMetodos = [conjuntoMetodos.metodosSolicidados componentsSeparatedByString:@"+"];
    for(NSString *caracteres in listaMetodos){
        [conjuntoMetodos.listaMetodos addObject:caracteres];
    }
    
    
}

-(void)acaoToqueObjeto:(GestureItem*)gestureItem{
    
    [self quebraString:gestureItem];
    
    for(NSString *numeroMetodos in gestureItem.listaMetodos){
        SWITCH(numeroMetodos){
            CASE (@"1") {
                [self alteraEstadoPressionado:gestureItem];
                break;
            }
            CASE (@"2") {
                [self tocarSomItem:gestureItem];
                break;
            }
            CASE (@"3"){
                [[GerenciadorAnimacoes sharedManager]animacaozoomImagem:gestureItem.item :1 :8 :YES :@1.0 :@1.2];
                break;
            }
            CASE (@"4") {
                [[GerenciadorAnimacoes sharedManager]animacaoGirarImagem:gestureItem.item:1:2];
                break;
            }
            DEFAULT{
                break;
            }
        }
    }
    
    
}


-(void)tocarSomItem:(GestureItem*)gestureItem{
    SomItem *somItem = gestureItem.item.listaSonsURL.firstObject;
    [[GerenciadorAudio sharedManager]playAudio:somItem.caminhoAudio];
}

-(void)alteraEstadoPressionado:(GestureItem*)gestureItem{
    gestureItem.item.estadoPressionado = YES;
}



@end
