//
//  SetCard.h
//  assignment_3
//
//  Created by Roni Shahino on 14/07/2019.
//  Copyright © 2019 Roni Shahino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

typedef  enum {Wave, Ellipse, Squre} CardShape;
typedef  enum {Green, Purple, Red} CardColor;
typedef  enum {Bold, Emply, Striped} CardFilling;

@interface SetCard : Card

@property (nonatomic) CardShape shape;
@property (nonatomic) int number;
@property (nonatomic) CardFilling filling;
@property (nonatomic) CardColor color;

-(void) number:(int) val;

@end

NS_ASSUME_NONNULL_END
