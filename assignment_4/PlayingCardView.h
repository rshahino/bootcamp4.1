// Copyright (c) 2019 Lightricks. All rights reserved.
// Created by Roni Shahino.

#import <UIKit/UIKit.h>

#import "Card.h"
#import "PlayingCard.h"
#import "CardView.h"
NS_ASSUME_NONNULL_BEGIN

@interface PlayingCardView : CardView

@property (nonatomic) NSUInteger rank;
@property (strong,nonatomic) NSString *suilt;

@end

NS_ASSUME_NONNULL_END
   
