//
//  SetCardDeck.m
//  assignment_3
//
//  Created by Roni Shahino on 14/07/2019.
//  Copyright © 2019 Roni Shahino. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"
@implementation SetCardDeck



-(instancetype) init
{
    self = [super init];
    if(self)
    {
        for(CardColor color =0 ; color < 3; color++){
            for(CardShape shape =0 ; shape < 3; shape++){
                for(int number =0 ; number < 3; number++) {
                    for(CardFilling filling =0 ; filling < 3; filling++){
                        SetCard *card = [[SetCard alloc] init];
                        card.color = color;
                        card.shape = shape;
                        card.number = number;
                        card.filling = filling;
                        [self addCard:card];
                    }
                }
            }
        }
    
    }
    return self;
}

@end
