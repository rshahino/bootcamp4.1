// Copyright (c) 2019 Lightricks. All rights reserved.
// Created by Roni Shahino.

#import "SetCardView.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SetCardView

#pragma mark - Setters
-(void)setShape:(CardShape)shape
{
    _shape = shape;
    [self setNeedsDisplay];
}
-(void)setNumber:(int)number
{
    _number = number;
    [self setNeedsDisplay];
}
-(void)setFilling:(CardFilling)filling
{
    _filling = filling;
    [self setNeedsDisplay];
}
-(void)setColor:(CardColor)color
{
    _color = color;
    [self setNeedsDisplay];
}



-(void) setByCard:(Card*) card
{
    SetCard *playingCard = (SetCard *)card;
    self.color = playingCard.color;
    self.number = playingCard.number;
    self.shape = playingCard.shape;
    self.filling = playingCard.filling;

}


#pragma mark - Drawing



-(void) drawCorners
{
}

-(void) drawFace
{
//    UIBezierPath *line1 = [UIBezierPath bezierPath];
//    [line1 moveToPoint:CGPointMake(0, 0)];
//    [line1 addLineToPoint:CGPointMake(1000, 1000)];
//    [[UIColor redColor] set]; //Set color to red
//    [line1 stroke];
//
//    UIBezierPath *line2 = [UIBezierPath bezierPath];
//    [line2 moveToPoint:CGPointMake(0, 10)];
//    [line2 addLineToPoint:CGPointMake(100, 10)];
//    [[UIColor blueColor] set]; //Change color to blue
//    [line2 stroke];
//    return;
    //shape
    
    float rangeJump = (self.bounds.size.height * 0.8)/(self.number + 1);
    UIColor *Scolor = [UIColor redColor];
    if(self.color == 1) Scolor = [UIColor greenColor];
    if(self.color == 2) Scolor = [UIColor blueColor];
    
    float alpha = 1;
    if(self.filling == 1) alpha = 0.5;
    if(self.filling == 2) alpha = 0;
    
    for (int i=0; i<=self.number;i++)
    {
        CGRect rect = CGRectMake(self.bounds.size.width * 0.3, rangeJump * (i) + (self.bounds.size.height * 0.1), self.bounds.size.width * 0.4, self.bounds.size.height * 0.2);
        UIBezierPath *rectBezierPath = [UIBezierPath bezierPathWithRect:rect];
        
        
        [[Scolor colorWithAlphaComponent:alpha] setFill];
        [Scolor setStroke];
        [rectBezierPath fill];
        [rectBezierPath stroke];
    }
    
    return;
    
   
}









@end

NS_ASSUME_NONNULL_END
