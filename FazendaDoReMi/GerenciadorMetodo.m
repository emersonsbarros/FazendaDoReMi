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
    
    nomeGesture = [nomeGesture stringByReplacingOccurrencesOfString: @" " withString:@""];
    NSArray* foo = [nomeGesture componentsSeparatedByString: @"+"];
    
    NSArray* nomeGestureParametros = [[foo firstObject] componentsSeparatedByString:@":"];
    
    if([[nomeGestureParametros objectAtIndex: 0] isEqualToString:@"gestureTap"]){
        GestureItem *gesture = [[GestureItem alloc]initWithTarget:self action:@selector(acaoToqueObjeto:)];
        gesture.listaMetodos = [[NSMutableArray alloc]init];
        gesture.metodosSolicidados = nomeGesture;
        gesture.numberOfTapsRequired = [[nomeGestureParametros objectAtIndex:1]floatValue];
        gesture.numberOfTouchesRequired = [[nomeGestureParametros objectAtIndex:2]floatValue];
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
//3:5.0:2:YES:0.0:0.5
-(void)acaoToqueObjeto:(GestureItem*)gestureItem{
    
    [self quebraString:gestureItem];
    
    for(NSString *numeroMetodos in gestureItem.listaMetodos){
        
        NSArray* listMetParametros = [numeroMetodos componentsSeparatedByString:@":"];
       
        NSString *valor = [[numeroMetodos componentsSeparatedByString:@":"]objectAtIndex:0];
        SWITCH(valor){
            CASE (@"1") {
                [[GerenciadoresAcoes sharedManager]alteraEstadoPressionado:gestureItem];
                break;
            }
            CASE (@"2") {
                [[GerenciadoresAcoes sharedManager]tocarSomItem:gestureItem];
                break;
            }
            CASE (@"3"){
                [[GerenciadorAnimacoes sharedManager]animacaozoomImagem:gestureItem.item:[listMetParametros objectAtIndex:1]:[listMetParametros objectAtIndex:2]:[listMetParametros objectAtIndex:3]:[listMetParametros objectAtIndex:4]];
                break;
            }
            CASE (@"4") {
                [[GerenciadorAnimacoes sharedManager]animacaoGirarImagem:gestureItem.item:1:2];
                break;
            }
            CASE (@"5") {
                [[GerenciadorAnimacoes sharedManager]animacaoMoverLugar:gestureItem.item:1:1:NO:0:400];
                break;
            }
            CASE (@"6") {
                [[GerenciadoresAcoes sharedManager]escondeImagem:gestureItem];
                break;
            }
            DEFAULT{
                break;
            }
        }

    }
    
    
}



@end
