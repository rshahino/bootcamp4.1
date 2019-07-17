// Copyright (c) 2019 Lightricks. All rights reserved.
// Created by Roni Shahino.

#import "CardView.h"

NS_ASSUME_NONNULL_BEGIN

@implementation CardView


-(void)setFaceUp:(BOOL)faceUp
{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}


#pragma mark - Drawing
-(void) drawRect:(CGRect)rect
{
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self contentScaleFactor] * 12.0];
    
    [roundedRect addClip];
    
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
    
    if(self.card.matched)
    {
        [[UIColor grayColor] setFill];
        UIRectFill(self.bounds);
        [self drawFace];
        [self drawCorners];
        return;
    }
    if(self.card.isChosen)
    {
        [self drawFace];
        
        [self drawCorners];
    }
    else
    {
        [[UIColor blackColor] setFill];
        UIRectFill(self.bounds);
    }
}



#pragma mark - initialization

-(void) awakeFromNib
{
    [self setup];
}



-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        //initialization code
    }
    return self;
}

-(void) setup
{
    self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}
@end

NS_ASSUME_NONNULL_END
