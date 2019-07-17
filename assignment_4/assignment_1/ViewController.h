//
//  ViewController.h
//  assignment_1
//
//  Created by Roni Shahino on 09/07/2019.
//  Copyright © 2019 Roni Shahino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"
@interface ViewController : UIViewController


@property (nonatomic, strong) CardMatchingGame *game;
@property (strong,nonatomic) Deck* deck;
-(IBAction)resetGame:(id)sender;
- (IBAction)touchCardButton:(UIButton *)sender ;
-(Deck*)createDeck;


@end

