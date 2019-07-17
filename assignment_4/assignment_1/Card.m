//
//  Card.m
//  assignment_1
//
//  Created by Roni Shahino on 09/07/2019.
//

#import "Card.h"

@implementation Card

-(int) match :(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards ){
        if([card.contents isEqualToString:self.contents])
            score = 1;
    }
    
    return score;
}

@end

