//
//  PlayingCardDeck.m
//  assignment_1
//
//  Created by Roni Shahino on 09/07/2019.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

-(instancetype) init
{
    self = [super init];
    if(self)
    {
        for (NSString *suit in [PlayingCard valdSuits]){
            for(NSUInteger rank = 1; rank <= [PlayingCard maxRank] ; rank++){
                PlayingCard* card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];

            }

        }
    }
    return self;
}

@end
