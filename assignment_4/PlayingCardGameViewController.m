//
//  PlayingCardGameViewController.m
//  assignment_3
//
//  Created by Roni Shahino on 14/07/2019.
//  Copyright © 2019 Roni Shahino. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
#import "Deck.h"
#import "CardMatchingGame.h"
@interface PlayingCardGameViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *switchMatchMode;

@end

@implementation PlayingCardGameViewController
- (IBAction)switchMode:(id)sender {
    
    self.game.matchMode == !self.game.matchMode;
    
}

- (IBAction)resetGame:(id)sender {
    self.game.matchMode = NO;
    self.switchMatchMode.enabled = YES;
    [super resetGame:sender];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.game.matchMode = NO;
    // Do any additional setup after loading the view.
    
}

-(Deck*)createDeck
{
    if(! self.deck) self.deck = [[PlayingCardDeck alloc] init]; // PlayingCardDeck
    return self.deck;
}

- (IBAction)touchCardButton:(UIButton *)sender {
    self.switchMatchMode.enabled = NO;
    [super touchCardButton:sender];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
