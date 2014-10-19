//
//  GestureItem.h
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 18/10/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "GestureTapItem.h"
#import "GestureSwipeItem.h"
#import "GestureRotationItem.h"
#import "GesturePanGesture.h"
#import "GestureLongItem.h"

@interface GestureItem : NSObject


@property GestureLongItem *gestureLong;
@property GestureTapItem *gestureTap;
@property GestureRotationItem *gestureRotation;
@property GesturePanGesture *gesturePan;
@property GestureSwipeItem *gestureSwipe;


@property int idGesturePrincipal;
@property Item *item;


@end
