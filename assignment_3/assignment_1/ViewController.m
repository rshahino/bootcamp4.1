//
//  ViewController.m
//  assignment_1
//
//  Created by Roni Shahino on 09/07/2019.
//  Copyright © 2019 Roni Shahino. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "SetCardDeck.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *descriptionLable;
//@property (weak, nonatomic) IBOutlet UISegmentedControl *MatchModeSwich;
@property (weak, nonatomic) IBOutlet UILabel *scoreLable;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *CardButtons;







@end

@implementation ViewController
//- (IBAction)switchMatchMode:(id)sender {
//    self.game.matchMode = !self.game.matchMode;
 //
//}


- (IBAction)resetGame:(id)sender {
    
    _game = nil;
    _deck = nil;
    [self updateUI];
    //self.MatchModeSwich.enabled = YES;
    
}

-(CardMatchingGame*) game
{
    if( !_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.CardButtons count] usingDeck:[self createDeck]];
        return _game;
    
}



- (IBAction)touchCardButton:(UIButton *)sender {
    
    //self.MatchModeSwich.enabled = NO;
    
    int cardIndex = [self.CardButtons indexOfObject:sender];
    NSString * description = [self.game chooseCardAtIndex_new:cardIndex];
    self.descriptionLable.text = [@"description: " stringByAppendingString:description];
    [self updateUI];

}

-(void) updateUI
{
    for (UIButton *cardButton in  self.CardButtons)
    {
        int cardIndex = [self.CardButtons indexOfObject:cardButton];
        Card* card = [self.game CardAtIndex:cardIndex];
        cardButton.backgroundColor = [self backgroungColorForCard:card];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatch;
        
    }
    self.scoreLable.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

-(NSString *) titleForCard:(Card *) card
{
    return card.isChosen ? card.contents : @"";
}

-(UIColor *) backgroungColorForCard:(Card *)card
{
    return card.isChosen ? (card.isMatch? [UIColor grayColor ] : [UIColor redColor] ) : [UIColor blackColor ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
