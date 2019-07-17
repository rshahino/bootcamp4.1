//
//  Deck.h
//  assignment_1
//
//  Created by Roni Shahino on 09/07/2019.
//

#import <Foundation/Foundation.h>
#import "Card.h"
NS_ASSUME_NONNULL_BEGIN

@interface Deck : NSObject


-(void) addCard:(Card *)card atTop:(BOOL)atTop;
-(void) addCard:(Card *)card;
-(Card*)drawRandomCard;
-(BOOL) isEmpty;
@end

NS_ASSUME_NONNULL_END
