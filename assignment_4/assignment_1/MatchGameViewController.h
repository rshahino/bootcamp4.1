//
//  MatchGameViewController.h
//  assignment_3
//
//  Created by Roni Shahino on 14/07/2019.
//  Copyright © 2019 Roni Shahino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"
#import "CardView.h"
NS_ASSUME_NONNULL_BEGIN

@interface MatchGameViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(CardView) NSArray *viewCards;

@property (nonatomic, strong) CardMatchingGame *game;
@property (strong,nonatomic) Deck* deck;
-(IBAction)reset;
-(void) beforeButton;
-(Deck*)createDeck;
-(NSString *) titleForCard:(Card *) card;



@end

NS_ASSUME_NONNULL_END
