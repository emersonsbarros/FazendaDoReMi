//
//  InfiniteScrollPicker.m
//  InfiniteScrollPickerExample
//
//  Created by Philip Yu on 6/6/13.
//  Copyright (c) 2013 Philip Yu. All rights reserved.
//

#import "InfiniteScrollPicker.h"
#import "UIView+viewController.h"
#import "GerenciadorBotaoInstrumento.h"

@implementation InfiniteScrollPicker

@synthesize imageAry = _imageAry;
@synthesize itemSize = _itemSize;
@synthesize alphaOfobjs;
@synthesize heightOffset;
@synthesize positionRatio;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        alphaOfobjs = 1.0;
        heightOffset = 0.0;
        positionRatio = 1.0;
        
        _imageAry = [[NSMutableArray alloc] init];
        imageStore = [[NSMutableArray alloc] init];
        
    }
    return self;
}

/////////////////////////// METODOS SECUNDARIOS ///////////////////////////

-(void)acaoToqueObjeto:(TapBotaoInstrumento*)button{
    
    if([button.btnInstrumento.nomeInstrumento isEqualToString:[GerenciadorBotaoInstrumento sharedManager].btnInstrumentoAtual.nomeInstrumento]){
        [[GerenciadorBotaoInstrumento sharedManager]acionaBotao:button];
    }
    
}

- (void)infiniteScrollPicker:(InfiniteScrollPicker *)infiniteScrollPicker didSelectAtImage:(BotaoInstrumento *)image {
    
    [GerenciadorBotaoInstrumento sharedManager].btnInstrumentoAtual = image;
    
}


/////////////////////////// METODOS CLASSE TERCEIRO ////////////////////////


- (void)initInfiniteScrollView
{
    [self initInfiniteScrollViewWithSelectedItem:0];
}



- (void)initInfiniteScrollViewWithSelectedItem:(int)index
{
    if (_itemSize.width == 0 && _itemSize.height == 0) {
        if (_imageAry.count > 0) {
            BotaoInstrumento *view = (BotaoInstrumento *)[_imageAry objectAtIndex:0];
            _itemSize = view.frame.size;
        }
        else _itemSize = CGSizeMake(self.frame.size.height/2, self.frame.size.height/2);
    }
    
    NSAssert((_itemSize.height < self.frame.size.height), @"item's height must not bigger than scrollpicker's height");

    self.pagingEnabled = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    
    if (_imageAry.count > 0)
    {
        
        // Init 5 set of images, 3 for user selection, 2 for
        for (int i = 0; i < (_imageAry.count*5); i++)
        {
            // Place images into the bottom of view
            BotaoInstrumento *aux = [_imageAry objectAtIndex:i%_imageAry.count];
            BotaoInstrumento *temp = [[BotaoInstrumento alloc]init];
            temp.image = aux.image;
            temp.frame = CGRectMake(i * _itemSize.width, self.frame.size.height - _itemSize.height, _itemSize.width, _itemSize.height);
            temp.nomeInstrumento = aux.nomeInstrumento;
            temp.imgFundo = aux.imgFundo;
            temp.imgFundoSecundario = aux.imgFundoSecundario;
            
            TapBotaoInstrumento *gesture = [[TapBotaoInstrumento alloc]initWithTarget:self action:@selector(acaoToqueObjeto:)];
            gesture.numberOfTapsRequired = 1;
            gesture.numberOfTouchesRequired = 1;
            gesture.btnInstrumento = aux
            ;
            temp.userInteractionEnabled = YES;
            
            [temp addGestureRecognizer:gesture];

            [imageStore addObject:temp];
            [self addSubview:temp];
            
        }
        
        self.contentSize = CGSizeMake(_imageAry.count * 5 * _itemSize.width, self.frame.size.height);
        
        float viewMiddle = _imageAry.count * 2 * _itemSize.width - self.frame.size.width/2 + _itemSize.width + (_itemSize.width * index);
        [self setContentOffset:CGPointMake(viewMiddle, 0)];
        
        self.delegate = self;
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(queue, ^ {
            [self reloadView:viewMiddle];
            dispatch_async(dispatch_get_main_queue(), ^ {
                [self snapToAnEmotion];
            });
        });

    }
    
}

- (void)setImageAry:(NSArray *)imageAry
{
    _imageAry = imageAry;
    [self initInfiniteScrollView];
}

- (void)setItemSize:(CGSize)itemSize
{
    _itemSize = itemSize;
    [self initInfiniteScrollView];
}

- (void)setSelectedItem:(int)index
{
    [self initInfiniteScrollViewWithSelectedItem:index];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.contentOffset.x > 0)
    {
        float sectionSize = _imageAry.count * _itemSize.width;
        
        if (self.contentOffset.x <= (sectionSize - sectionSize/2))
        {
            self.contentOffset = CGPointMake(sectionSize * 2 - sectionSize/2, 0);
        } else if (self.contentOffset.x >= (sectionSize * 3 + sectionSize/2)) {
            self.contentOffset = CGPointMake(sectionSize * 2 + sectionSize/2, 0);
        }

        [self reloadView:self.contentOffset.x];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (decelerate == 0 && !snapping) [self snapToAnEmotion];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (!snapping) [self snapToAnEmotion];
}

- (void)reloadView:(float)offset
{
    float biggestSize = 0;
    id biggestView;

    for (int i = 0; i < imageStore.count; i++) {
        
        BotaoInstrumento *view = [imageStore objectAtIndex:i];
        
        if (view.center.x > (offset - _itemSize.width ) && view.center.x < (offset + self.frame.size.width + _itemSize.width))
        {
            float tOffset = (view.center.x - offset) - self.frame.size.width/4;
            
            if (tOffset < 0 || tOffset > self.frame.size.width) tOffset = 0;
            float addHeight = [self calculateFrameHeightByOffset:tOffset];
            
            if (addHeight < 0) addHeight = 0;
            
            view.frame = CGRectMake(view.frame.origin.x,
                                    self.frame.size.height - _itemSize.height - heightOffset - (addHeight/positionRatio),
                                    _itemSize.width + addHeight,
                                    _itemSize.height + addHeight);

            if (((view.frame.origin.x + view.frame.size.width) - view.frame.origin.x) > biggestSize)
            {
                biggestSize = ((view.frame.origin.x + view.frame.size.width) - view.frame.origin.x);
                biggestView = view;
            }
            
        } else {
            view.frame = CGRectMake(view.frame.origin.x, self.frame.size.height, _itemSize.width, _itemSize.height);
            for (BotaoInstrumento *imageView in view.subviews)
            {
                imageView.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
            }
        }
    }
    
    for (int i = 0; i < imageStore.count; i++)
    {
        UIView *cBlock = [imageStore objectAtIndex:i];
        cBlock.alpha = alphaOfobjs;

        if (i > 0)
        {
            UIView *pBlock = [imageStore objectAtIndex:i-1];
            cBlock.frame = CGRectMake(pBlock.frame.origin.x + pBlock.frame.size.width, cBlock.frame.origin.y, cBlock.frame.size.width, cBlock.frame.size.height);
        }
    }

    [(UIView *)biggestView setAlpha:1.0];
}

-(float)calculateFrameHeightByOffset:(float)offset
{
    return (-1 * fabsf((offset)*2 - self.frame.size.width/2) + self.frame.size.width/2)/4;
}


- (void)snapToAnEmotion
{
    float biggestSize = 0;
    BotaoInstrumento *biggestView;
    
    snapping = YES;
    
    float offset = self.contentOffset.x;
    
    BotaoInstrumento *view;
    for (int i = 0; i < imageStore.count; i++) {
        view = [imageStore objectAtIndex:i];
     
        if (view.center.x > offset && view.center.x < (offset + self.frame.size.width))
        {
            if (((view.center.x + view.frame.size.width) - view.center.x) > biggestSize)
            {
                biggestSize = ((view.frame.origin.x + view.frame.size.width) - view.frame.origin.x);
                biggestView = view;
               
            }
            
        }
    }
    
    float biggestViewX = biggestView.frame.origin.x + biggestView.frame.size.width/2 - self.frame.size.width/2;
    float dX = self.contentOffset.x - biggestViewX;
    float newX = self.contentOffset.x - dX/1.4;
    
    // Disable scrolling when snapping to new location
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^ {
        [self setScrollEnabled:NO];
        [self scrollRectToVisible:CGRectMake(newX, 0, self.frame.size.width, 1) animated:YES];
        
        dispatch_async(dispatch_get_main_queue(), ^ {
            
            SEL selector = @selector(infiniteScrollPicker:didSelectAtImage:);
            if ([[self firstAvailableUIViewController] respondsToSelector:selector])
            {
                #pragma clang diagnostic push
                #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                [self  performSelector:selector withObject:self withObject:biggestView];
                #pragma clang diagnostic pop
            }
            
            [self setScrollEnabled:YES];
            snapping = 0;
        });
    });
}

@end
