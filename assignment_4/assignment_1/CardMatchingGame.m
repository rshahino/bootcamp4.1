//
//  CardMatchingGame.m
//  assignment_2
//
//  Created by Roni Shahino on 10/07/2019.
//  Copyright © 2019 Roni Shahino. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

//@property (nonatomic) NSUInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of Cards
@end

@implementation CardMatchingGame

-(NSMutableArray * )cards
{
    if(! _cards) _cards = [[NSMutableArray alloc] init];
   return _cards;
}


-(instancetype) initWithCardCount:(NSUInteger) count usingDeck:(Deck*) deck
{
    self = [super init];
    
    if(self){
        for (int i=0;i<count;i++)
        {
            Card *card = [deck drawRandomCard];
            if(card)
                [self.cards addObject:card];
            else{
                self = nil;
                break;
            }
        }
    }
    return self;
}

-(Card*) CardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index]: nil;
}

#define MISTMACH_PENALTY  2;
#define MATCH_BONUS 4;
#define COST_TO_CHOOSE  1;

//-(void) chooseCardAtIndex:(NSUInteger)index
//{
//    Card* card = [self CardAtIndex:index];
//
//    if(!card.isMatch) {
//        if(card.isChosen){
//            card.chosen = NO;
//        }
//        else{
//            //match against another card
//            for (Card *otherCard in self.cards)
//            {
//                if( otherCard.isChosen && !otherCard.isMatch){
//                    int matchScore = [card match:@[otherCard]];
//                    if(matchScore){
//                        self.score += matchScore * MATCH_BONUS;
//                        card.matched = YES;
//                        otherCard.matched = YES;
//                    } else{
//                        self.score -= MISTMACH_PENALTY;
//                        otherCard.chosen = NO;
//
//                    }
//                      break;
//                }
//            }
//            self.score -= COST_TO_CHOOSE;
//            card.chosen = YES;
//        }
//    }
//}


-(int) multipleCardsScore:(NSMutableArray*) cards
{
    int score = 0;
    if(self.matchMode == NO)
    {
        Card * first = cards[0];
        Card * second = cards[1];
        score = [first match:@[second]];
    }
    else{
        Card * first = cards[0];
        Card * second = cards[1];
        Card * third = cards[2];
        score += [first match:@[second,third]];
        score += [second match:@[first,third]];
        score += [third match:@[second,first]];
        
    }
    
    return score;
}

-(NSString *) chooseCardAtIndex_new:(NSUInteger) index
{
    Card* card = [self CardAtIndex:index];
    
    if(card.isMatch) {
        return [NSString stringWithFormat:@"card %@ is already matched",card.contents ];
    }
    
    self.score -= COST_TO_CHOOSE;
    
    if(card.isChosen){
        card.chosen = NO;
        return [NSString stringWithFormat:@"card %@ flip back",card.contents ];
    }
     card.chosen = YES;
    
    NSMutableArray* chosenCards = [[NSMutableArray  alloc] init];
    for(Card *otherCard in self.cards)
    {
        if(otherCard.isChosen && !otherCard.isMatch){
            [chosenCards addObject:otherCard];
        }
    }
    
    if([chosenCards count] <= @(self.matchMode).integerValue + 1)
        return [NSString stringWithFormat:@"card %@ flip",card.contents ];
    
    int matchScore = [ self multipleCardsScore:chosenCards];
    NSLog(@"%d", matchScore);
    if(matchScore > 0)
    {
        self.score += matchScore * MATCH_BONUS;
        card.matched = YES;
        for(Card* otherCard in chosenCards)
        {
            otherCard.matched = YES;
        }
        return [NSString stringWithFormat:@"matched %d points", matchScore];
    }else{
            self.score -= MISTMACH_PENALTY;
        for(Card* otherCard in chosenCards)
        {
            otherCard.chosen = NO;
        }
            card.chosen = YES;
        }
        return [NSString stringWithFormat:@"penalty %d points", matchScore];
    }
       
@end
