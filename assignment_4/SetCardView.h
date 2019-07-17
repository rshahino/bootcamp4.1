// Copyright (c) 2019 Lightricks. All rights reserved.
// Created by Roni Shahino.


#import <UIKit/UIKit.h>

#import "Card.h"
#import "SetCard.h"
#import "CardView.h"
NS_ASSUME_NONNULL_BEGIN

@interface SetCardView : CardView

@property (nonatomic) CardShape shape;
@property (nonatomic) int number;
@property (nonatomic) CardFilling filling;
@property (nonatomic) CardColor color;


@end

NS_ASSUME_NONNULL_END
