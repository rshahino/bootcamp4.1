//
//  CardMatchingGame.h
//  assignment_2
//
//  Created by Roni Shahino on 10/07/2019.
//  Copyright © 2019 Roni Shahino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardMatchingGame : NSObject

-(instancetype) initWithCardCount:(NSUInteger) count usingDeck:(Deck*) deck;

//-(void) chooseCardAtIndex:(NSUInteger) index;
-(NSString *) chooseCardAtIndex_new:(NSUInteger) index;
-(Card *) CardAtIndex:(NSUInteger) index;

//@property (nonatomic, readonly) NSInteger score;

@property (nonatomic) NSInteger score;

@property (nonatomic) BOOL matchMode;


@end

NS_ASSUME_NONNULL_END
