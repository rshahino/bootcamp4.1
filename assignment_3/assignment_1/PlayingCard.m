//
//  PlayingCard.m
//  assignment_1
//
//  Created by Roni Shahino on 09/07/2019.
//

#import "PlayingCard.h"

@implementation PlayingCard


-(int)match:(NSArray *) otherCards
{
    int score = 0;
    for( PlayingCard* card in otherCards)
    {
        if( self.rank == card.rank){
            score = + 4;
        } else if([self.suit isEqualToString:card.suit]) {
            score = + 1;
        }
    }
    return score;
}

-(NSString *)contents //overriding the base class function
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return[rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray*) valdSuits
{
    return  @[@"±",@"!",@"*",@"&"];
}
+ (NSArray*) rankStrings
{
    return  @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger) maxRank
{
    return [[self rankStrings] count] - 1;
}
-(void) setRank:(NSUInteger)rank
{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

@synthesize suit = _suit;

-(void) setSuit:(NSString*)suit
{
    if([[PlayingCard valdSuits] containsObject:suit]){
        _suit = suit;
    }
}

-(NSString *)suit
{
    return _suit ? _suit : @"?";
}

@end
