//
//  TimerGesturePan.h
//  FazendaDoReMi
//
//  Created by VINICIUS RESENDE FIALHO on 21/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "GesturePanGesture.h"
#import <Foundation/NSObject.h>
#import <Foundation/NSDate.h>

@interface TimerGesturePan : NSObject


@property Item *itemArrastar;
@property Item *itemColidir;
@property NSString *nomeMetodos;
@property GesturePanGesture *gesturePan;



@end
