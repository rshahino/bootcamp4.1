//
//  MatchGameViewController.m
//  assignment_3
//
//  Created by Roni Shahino on 14/07/2019.
//  Copyright © 2019 Roni Shahino. All rights reserved.
//

#import "MatchGameViewController.h"
#import "SetCardDeck.h"
#import "historyViewController.h"
#import  "CardView.h"
@interface MatchGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *descriptionLable;
@property (weak, nonatomic) IBOutlet UILabel *scoreLable;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *CardButtons;
@property (strong,nonatomic) NSMutableString* history;

@end

@implementation MatchGameViewController


- (IBAction)tap:(UITapGestureRecognizer *)sender {
    CardView *view = sender.view;
    view.faceUp = !view.faceUp;
    
    //[self beforeButton];
    
    int cardIndex = [self.viewCards indexOfObject:sender.view];
    view.card = [self.game CardAtIndex:cardIndex];
    NSString * description = [self.game chooseCardAtIndex_new:cardIndex];
   Card *card = [self.game CardAtIndex:cardIndex];
    
    if(card.isMatch)
    {
        view.faceUp = YES;
    }
    
    [view setByCard:card];
    
    [self updateUI];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    historyViewController *hvc;
    if([segue.identifier isEqualToString:@"history"])
    {
        if([segue.destinationViewController isKindOfClass:[historyViewController class]]){
             hvc = (historyViewController *)segue.destinationViewController;
            hvc.str = self.history;
            hvc.trial = 100;//.te = [UIColor redColor];//self.history;
            
        }
    }
        
}

-(NSMutableString*)history
{
    if(!_history) _history = [[NSMutableString alloc] init];
    return _history;
}

- (IBAction)resetGame:(id)sender {
    [self reset];
    [self.history setString:@""];
}

-(void) reset{
    _game = nil;
    _deck = nil;
    
    for (CardView *view in self.viewCards)
    {
        view.faceUp = NO;
        view.card = nil;
    }
    
    [self updateUI];

}

-(void) beforeButton
{
}



- (void)viewDidLoad {
    [super viewDidLoad];
    //self.game.matchMode = YES;///only set
    // Do any additional setup after loading the view.

}


-(CardMatchingGame*) game
{
    if( !_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.CardButtons count] usingDeck:[self createDeck]];
    return _game;
    
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    [self beforeButton];
    
    int cardIndex = [self.CardButtons indexOfObject:sender];
    NSString * description = [self.game chooseCardAtIndex_new:cardIndex];
    self.descriptionLable.text = [@"description: " stringByAppendingString:description];
    [self.history appendString:@" \n "];
    [self.history appendString:description];
    [self updateUI];
    
}

-(void) updateUI
{

    
    for (CardView *view in  self.viewCards)
    {
        int cardIndex = [self.viewCards indexOfObject:view];
        Card* card = [self.game CardAtIndex:cardIndex];
        [view setByCard:card];
        
        //view.enabled = !card.isMatch;
        
    }
//
//    for (UIButton *cardButton in  self.CardButtons)
//    {
//        int cardIndex = [self.CardButtons indexOfObject:cardButton];
//        Card* card = [self.game CardAtIndex:cardIndex];
//        cardButton.backgroundColor = [self backgroungColorForCard:card];
//
//       [cardButton setAttributedTitle:[self titleForCard:card] forState:UIControlStateNormal];
//         cardButton.enabled = !card.isMatch;
//
//    }
//    self.scoreLable.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}




-(NSAttributedString *) titleForCard:(Card *) card
{
   
    NSString* a = card.isChosen ? card.contents : @"";
    return [[NSAttributedString alloc] initWithString:a];
}



-(UIColor *) backgroungColorForCard:(Card *)card
{
    return card.isChosen ? (card.isMatch? [UIColor grayColor ] : [UIColor whiteColor] ) : [UIColor blackColor ];
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
