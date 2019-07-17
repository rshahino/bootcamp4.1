// Copyright (c) 2019 Lightricks. All rights reserved.
// Created by Roni Shahino.



#import <UIKit/UIKit.h>

#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardView : UIView


-(void) drawRect:(CGRect)rect;
-(void) drawFace;
-(void) drawCorners;

@property (strong, nonatomic) Card *card;;
@property (nonatomic) BOOL faceUp;

-(void) setByCard:(Card*) card;


@end

NS_ASSUME_NONNULL_END
