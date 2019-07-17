// Copyright (c) 2019 Lightricks. All rights reserved.
// Created by Roni Shahino.

#import "PlayingCardView.h"

NS_ASSUME_NONNULL_BEGIN


@implementation PlayingCardView


#pragma mark - Setters
-(void)setSuilt:(NSString *)suilt
{
    _suilt = suilt;
    [self setNeedsDisplay];
}

-(void)setRank:(NSUInteger)rank
{
    _rank = rank;
    [self setNeedsDisplay];
}


#pragma mark - Drawing



-(void) setByCard:(Card*) card
{
    PlayingCard *playingCard = (PlayingCard *)card;
    self.rank = playingCard.rank;
    self.suilt = playingCard.suit;
  
}



-(void) drawFace
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    UIFont *cornerForn = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cornerForn = [cornerForn fontWithSize:cornerForn.pointSize * (self.bounds.size.height / 180.0 * 2)];
    
    
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n%@",self.suilt] attributes:@{ NSFontAttributeName: cornerForn, NSParagraphStyleAttributeName: paragraphStyle}];
    
    CGRect textBouns = CGRectMake(self.bounds.size.width*0.2, self.bounds.size.height*0.2, self.bounds.size.width*0.6, self.bounds.size.height*0.6);
    textBouns.size = [cornerText size];
    
    
    [cornerText drawInRect:textBouns];
    
}

-(void) drawCorners
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    UIFont *cornerForn = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cornerForn = [cornerForn fontWithSize:cornerForn.pointSize * (self.bounds.size.height / 180.0)];
    
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d\n%@",self.rank,self.suilt] attributes:@{ NSFontAttributeName: cornerForn, NSParagraphStyleAttributeName: paragraphStyle}];
    
    CGRect textBount;
    textBount.origin = CGPointMake([self contentScaleFactor] * 12 /3, [self contentScaleFactor] * 12 /3);
    textBount.size = [cornerText size];
    [cornerText drawInRect:textBount];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(context,M_PI);
    
     [cornerText drawInRect:textBount];


}

@end

NS_ASSUME_NONNULL_END
