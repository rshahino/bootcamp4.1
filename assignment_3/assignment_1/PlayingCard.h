//
//  PlayingCard.h
//  assignment_1
//
//  Created by Roni Shahino on 09/07/2019.
//

#import <Foundation/Foundation.h>
#import "Card.h"
NS_ASSUME_NONNULL_BEGIN

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray*) valdSuits;
+ (NSUInteger) maxRank;

@end

NS_ASSUME_NONNULL_END
