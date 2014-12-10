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


//Metodo que executa o metodo pelo numero passado na string
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
                [[GerenciadoresAcoes sharedManager]tocarSomItem:itemEspecifico:[listMetParametros objectAtIndex:1] :[listMetParametros objectAtIndex:2]];
                break;
            }
            CASE (@"3"){
                [[GerenciadorAnimacoes sharedManager]animacaozoomImagem:itemEspecifico:[listMetParametros objectAtIndex:1]:[listMetParametros objectAtIndex:2]:[listMetParametros objectAtIndex:3]:[listMetParametros objectAtIndex:4]];
                break;
            }
            CASE (@"4") {
                [[GerenciadorAnimacoes sharedManager]animacaoGirarImagem:itemEspecifico:[listMetParametros objectAtIndex:1]:[listMetParametros objectAtIndex:2]];
                break;
            }
            CASE (@"5") {
                [[GerenciadorAnimacoes sharedManager]animacaoMoverLugar:itemEspecifico:[listMetParametros objectAtIndex:1]:[listMetParametros objectAtIndex:2]:[listMetParametros objectAtIndex:3]:[listMetParametros objectAtIndex:4]:[listMetParametros objectAtIndex:5]];
                break;
            }
            CASE (@"6") {
                [[GerenciadoresAcoes sharedManager]escondeImagem:itemEspecifico];
                break;
            }
            CASE (@"7") {
                [[GerenciadorAnimacoes sharedManager]animacaoSpriteEspecifica:itemEspecifico :[listMetParametros objectAtIndex:1]:[listMetParametros objectAtIndex:2]:[listMetParametros objectAtIndex:3]:[listMetParametros objectAtIndex:4]:[listMetParametros objectAtIndex:5]];
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

//Analiza a colisao de um Pan Gesture
-(void)checkColisao:(NSTimer *) timer{
    
    TimerGesturePan *time = timer.userInfo;
    
    id presentationLayer1 = time.itemColidir.layer.presentationLayer;
    id presentationLayer2 = time.itemArrastar.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        [self quebraString:time.nomeMetodos];
        [self escolheMetodoNumero:time.gesturePan.item];
        [timer invalidate];
    }
    
}


//Add um gesture Pan, passando a string controladora, view para arrastar e a view de colisao
-(void)addGestureItemPan:(NSString*)nomeGesture :(Item*)viewContainer :(Item*)viewColisao {

    GesturePanGesture *gesture = [[GesturePanGesture alloc]initWithTarget:self action:@selector(pan:)];
    gesture.listaMetodos = [[NSMutableArray alloc]init];
    gesture.metodosSolicidados = nomeGesture;
    gesture.item = viewContainer;
    viewContainer.userInteractionEnabled = YES;
    [viewContainer addGestureRecognizer:gesture];
    
    
    TimerGesturePan *timerPan = [[TimerGesturePan alloc]init];
    timerPan.itemArrastar = viewContainer;
    timerPan.itemColidir = viewColisao;
    timerPan.nomeMetodos = nomeGesture;
    timerPan.gesturePan = gesture;

    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisao:)
                                   userInfo: timerPan
                                    repeats: YES];
    
}


//Add o gesture a um item
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
        gesture.minimumPressDuration = [[nomeGestureParametros objectAtIndex:1]floatValue];
        gesture.item = viewContainer;
        viewContainer.userInteractionEnabled = YES;
        [viewContainer addGestureRecognizer:gesture];
        
        
    }else if([[nomeGestureParametros objectAtIndex: 0] isEqualToString:@"gesturePinch"]){
        GesturePinchItem *gesture = [[GesturePinchItem alloc]initWithTarget:self action:@selector(acaoToqueObjeto:)];
        gesture.listaMetodos = [[NSMutableArray alloc]init];
        gesture.metodosSolicidados = nomeGesture;
        gesture.item = viewContainer;
        viewContainer.userInteractionEnabled = YES;
        [viewContainer addGestureRecognizer:gesture];
        
        
    }else if([[nomeGestureParametros objectAtIndex: 0] isEqualToString:@"gestureRotation"]){
        GestureRotationItem *gesture = [[GestureRotationItem alloc]initWithTarget:self action:@selector(acaoToqueObjeto:)];
        gesture.listaMetodos = [[NSMutableArray alloc]init];
        gesture.metodosSolicidados = nomeGesture;
        gesture.item = viewContainer;
        viewContainer.userInteractionEnabled = YES;
        [viewContainer addGestureRecognizer:gesture];
        
        
    }else if([[nomeGestureParametros objectAtIndex: 0] isEqualToString:@"gestureSwipe"]){
        GestureSwipeItem *gesture = [[GestureSwipeItem alloc]initWithTarget:self action:@selector(acaoToqueObjeto:)];
        gesture.listaMetodos = [[NSMutableArray alloc]init];
        gesture.metodosSolicidados = nomeGesture;
        
        if([[nomeGestureParametros objectAtIndex:1]floatValue] == 1){
            gesture.direction = UISwipeGestureRecognizerDirectionRight;
        }else if([[nomeGestureParametros objectAtIndex:1]floatValue] == 2){
            gesture.direction = UISwipeGestureRecognizerDirectionLeft;
        }else if([[nomeGestureParametros objectAtIndex:1]floatValue] == 3){
            gesture.direction = UISwipeGestureRecognizerDirectionUp;
        }else if([[nomeGestureParametros objectAtIndex:1]floatValue] == 4){
            gesture.direction = UISwipeGestureRecognizerDirectionDown;
        }
        
        gesture.item = viewContainer;
        viewContainer.userInteractionEnabled = YES;
        [viewContainer addGestureRecognizer:gesture];
        
        
    }else if([[nomeGestureParametros objectAtIndex: 0] isEqualToString:@"gesturePan"]){
        GesturePanGesture *gesture = [[GesturePanGesture alloc]initWithTarget:self action:@selector(acaoToqueObjeto:)];
        gesture.listaMetodos = [[NSMutableArray alloc]init];
        gesture.metodosSolicidados = nomeGesture;
        gesture.item = viewContainer;
        viewContainer.userInteractionEnabled = YES;
        [viewContainer addGestureRecognizer:gesture];

        
    }else NSLog(@"Erro gesture");
    
}


//Chamado quando o gesture é feito
-(void)acaoToqueObjeto:(id)gestureItems{
 
    Item *itemEspecifico;
    
    if([gestureItems isKindOfClass:[GestureTapItem class]]){
        GestureTapItem* gestureItem = (GestureTapItem*)gestureItems;
        itemEspecifico = gestureItem.item;
        [self quebraString:gestureItem.metodosSolicidados];
        
        
    }else if([gestureItems isKindOfClass:[GestureLongItem class]]){
        GestureLongItem* gestureItem = (GestureLongItem*)gestureItems;
        itemEspecifico = gestureItem.item;
        [self quebraString:gestureItem.metodosSolicidados];
    
        
    }else if([gestureItems isKindOfClass:[GestureSwipeItem class]]){
        GestureSwipeItem* gestureItem = (GestureSwipeItem*)gestureItems;
        itemEspecifico = gestureItem.item;
        [self quebraString:gestureItem.metodosSolicidados];

    }else if([gestureItems isKindOfClass:[GesturePanGesture class]]){
        GesturePanGesture* gestureItem = (GesturePanGesture*)gestureItems;
        itemEspecifico = gestureItem.item;
        [self quebraString:gestureItem.metodosSolicidados];
        [self pan:gestureItem];
        
        
    }else if([gestureItems isKindOfClass:[GestureRotationItem class]]){
        GestureRotationItem* gestureItem = (GestureRotationItem*)gestureItems;
        itemEspecifico = gestureItem.item;
        [self quebraString:gestureItem.metodosSolicidados];
        
    }else if([gestureItems isKindOfClass:[GesturePinchItem class]]){
        GesturePinchItem* gestureItem = (GesturePinchItem*)gestureItems;
        itemEspecifico = gestureItem.item;
        [self quebraString:gestureItem.metodosSolicidados];
        
    }else NSLog(@"erro acionador gesture");
    
    
    [self escolheMetodoNumero:itemEspecifico];
}


//Quebra string controladora
-(void)quebraString:(NSString*)conjuntoMetodos{
    
    NSString* nomeGesture = [conjuntoMetodos stringByReplacingOccurrencesOfString: @" " withString:@""];
    
    NSArray* listaMetodos = [nomeGesture componentsSeparatedByString:@"+"];
    for(NSString *caracteres in listaMetodos){
        [self.listaMetodos addObject:caracteres];
    }
    
}


//Metodos para deixar mais maroto o gesture de arrastar
- (void)pan:(UIPanGestureRecognizer *)gesture {
    
    static CGPoint originalCenter;
    
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        originalCenter = gesture.view.center;
        [self pauseLayer:gesture.view.layer];
    }
    else if (gesture.state == UIGestureRecognizerStateChanged)
    {
        CGPoint translate = [gesture translationInView:gesture.view.superview];
        gesture.view.center = CGPointMake(originalCenter.x + translate.x, originalCenter.y + translate.y);
    }
    else if (gesture.state == UIGestureRecognizerStateEnded ||
             gesture.state == UIGestureRecognizerStateFailed ||
             gesture.state == UIGestureRecognizerStateCancelled)
    {
        [self resumeLayer:gesture.view.layer];
    }
    
}


-(void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

-(void)resumeLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}



@end
