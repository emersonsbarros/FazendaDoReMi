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
        self.listaMetodos = [[NSMutableArray alloc]init];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


///////////////////////////////// CONTROLADORES METODOS //////////////////////////////////////



-(void)escolheMetodoNumero:(Item*)itemEspecifico{
    
    for(NSString *numeroMetodos in self.listaMetodos){
        
        NSArray* listMetParametros = [numeroMetodos componentsSeparatedByString:@":"];
        
        NSString *valor = [[numeroMetodos componentsSeparatedByString:@":"]objectAtIndex:0];
        SWITCH(valor){
            
            CASE (@"1") {
                [[GerenciadoresAcoes sharedManager]alteraEstadoPressionado:itemEspecifico];
                break;
            }
            CASE (@"2") {
                [[GerenciadoresAcoes sharedManager]tocarSomItem:itemEspecifico];
                break;
            }
            CASE (@"3"){
                [[GerenciadorAnimacoes sharedManager]animacaozoomImagem:itemEspecifico:[listMetParametros objectAtIndex:1]:[listMetParametros objectAtIndex:2]:[listMetParametros objectAtIndex:3]:[listMetParametros objectAtIndex:4]];
                break;
            }
            CASE (@"4") {
                [[GerenciadorAnimacoes sharedManager]animacaoGirarImagem:itemEspecifico:1:2];
                break;
            }
            CASE (@"5") {
                [[GerenciadorAnimacoes sharedManager]animacaoMoverLugar:itemEspecifico:1:1:NO:0:400];
                break;
            }
            CASE (@"6") {
                [[GerenciadoresAcoes sharedManager]escondeImagem:itemEspecifico];
                break;
            }
            DEFAULT{
                break;
            }
        }
        
    }
    
    [self.listaMetodos removeAllObjects];
    
}




/////////////////////////////// AUXILIAR CONTRALADOR //////////////////////////////////

-(void)addGestureItem:(NSString*)nomeGesture :(Item*)viewContainer{
    
    nomeGesture = [nomeGesture stringByReplacingOccurrencesOfString: @" " withString:@""];
    NSArray* foo = [nomeGesture componentsSeparatedByString: @"+"];
    
    NSArray* nomeGestureParametros = [[foo firstObject] componentsSeparatedByString:@":"];
    
    
    if([[nomeGestureParametros objectAtIndex: 0] isEqualToString:@"gestureTap"]){
        
        GestureTapItem *gesture = [[GestureTapItem alloc]initWithTarget:self action:@selector(acaoToqueObjeto:)];
        gesture.listaMetodos = [[NSMutableArray alloc]init];
        gesture.metodosSolicidados = nomeGesture;
        gesture.numberOfTapsRequired = [[nomeGestureParametros objectAtIndex:1]floatValue];
        gesture.numberOfTouchesRequired = [[nomeGestureParametros objectAtIndex:2]floatValue];
        gesture.item = viewContainer;
        viewContainer.userInteractionEnabled = YES;
        [viewContainer addGestureRecognizer:gesture];
    
        
    }else if([[nomeGestureParametros objectAtIndex: 0] isEqualToString:@"gestureLong"]){

        GestureLongItem *gesture = [[GestureLongItem alloc]initWithTarget:self action:@selector(acaoToqueObjeto:)];
        gesture.listaMetodos = [[NSMutableArray alloc]init];
        gesture.metodosSolicidados = nomeGesture;
        gesture.numberOfTapsRequired = [[nomeGestureParametros objectAtIndex:1]floatValue];
        gesture.numberOfTouchesRequired = [[nomeGestureParametros objectAtIndex:2]floatValue];
        gesture.minimumPressDuration = 2.0;
        gesture.item = viewContainer;
        viewContainer.userInteractionEnabled = YES;
        [viewContainer addGestureRecognizer:gesture];
        
        
    }else if([[nomeGestureParametros objectAtIndex: 0] isEqualToString:@"gesturePinch"]){
        
        
    }else if([[nomeGestureParametros objectAtIndex: 0] isEqualToString:@"gestureRotation"]){
        
        
    }else if([[nomeGestureParametros objectAtIndex: 0] isEqualToString:@"gestureSwipe"]){
        GestureSwipeItem *gesture = [[GestureSwipeItem alloc]initWithTarget:self action:@selector(acaoToqueObjeto:)];
        gesture.listaMetodos = [[NSMutableArray alloc]init];
        gesture.metodosSolicidados = nomeGesture;
        gesture.direction = UISwipeGestureRecognizerDirectionRight;
        gesture.numberOfTouchesRequired = 1;
        gesture.item = viewContainer;
        viewContainer.userInteractionEnabled = YES;
        [viewContainer addGestureRecognizer:gesture];
        
    }else if([[nomeGestureParametros objectAtIndex: 0] isEqualToString:@"gesturePan"]){
        
        
    }else{
        
        
    }
}


-(void)quebraString:(GestureTapItem*)conjuntoMetodos{
    
    NSArray* listaMetodos = [conjuntoMetodos.metodosSolicidados componentsSeparatedByString:@"+"];
    for(NSString *caracteres in listaMetodos){
        [self.listaMetodos addObject:caracteres];
    }
    
}

//3:5.0:2:YES:0.0:0.5
-(void)acaoToqueObjeto:(id)gestureItems{
 
    Item *itemEspecifico;
    
    
    if([gestureItems isKindOfClass:[GestureTapItem class]]){
        GestureTapItem* gestureItem = (GestureTapItem*)gestureItems;
        itemEspecifico = gestureItem.item;
        
        NSArray* listaMetodos = [gestureItem.metodosSolicidados componentsSeparatedByString:@"+"];
        for(NSString *caracteres in listaMetodos){
            [self.listaMetodos addObject:caracteres];
        }
        
        NSLog(@"tap");
        
    }else if([gestureItems isKindOfClass:[GestureLongItem class]]){
        GestureLongItem* gestureItem = (GestureLongItem*)gestureItems;
        itemEspecifico = gestureItem.item;
        
        NSArray* listaMetodos = [gestureItem.metodosSolicidados componentsSeparatedByString:@"+"];
        for(NSString *caracteres in listaMetodos){
            [self.listaMetodos addObject:caracteres];
        }
        
        NSLog(@"LOng");
        
    }else if([gestureItems isKindOfClass:[GestureSwipeItem class]]){
        GestureSwipeItem* gestureItem = (GestureSwipeItem*)gestureItems;
        itemEspecifico = gestureItem.item;
        
        NSArray* listaMetodos = [gestureItem.metodosSolicidados componentsSeparatedByString:@"+"];
        for(NSString *caracteres in listaMetodos){
            [self.listaMetodos addObject:caracteres];
        }

        NSLog(@"swip!");
    }
    
    
    [self escolheMetodoNumero:itemEspecifico];
}



@end
