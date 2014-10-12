//
//  Item.m
//  FazendaDoReMi
//
//  Created by EMERSON DE SOUZA BARROS on 23/09/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "Item.h"

@implementation Item

-(id)init{
    self = [super init];
    
    if(self){
        self.listaSprites = [[NSMutableArray alloc] init];
        self.listaSonsURL = [[NSMutableArray alloc]init];
        self.estadoPressionado = false;
    }
    return self;
}

-(void)retornaAudio: (NSString*)nome{
}


//-(void)zoomImagemLoop:(Item*)item{
//   
//    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
//    animationGroup.duration = 5;
//    animationGroup.repeatCount = INFINITY;
//    
//    CAMediaTimingFunction *easeOut = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//    
//    CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
//    pulseAnimation.fromValue = @0.0;
//    pulseAnimation.toValue = @1.0;
//    pulseAnimation.duration = 2;
//    pulseAnimation.timingFunction = easeOut;
//    
//    animationGroup.animations = @[pulseAnimation];
//    
//    [item.layer addAnimation:animationGroup forKey:@"pulse"];
//    
//}

@end
