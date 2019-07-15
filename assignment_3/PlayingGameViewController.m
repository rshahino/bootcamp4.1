//
//  PlayingGameViewController.m
//  assignment_3
//
//  Created by Roni Shahino on 14/07/2019.
//  Copyright © 2019 Roni Shahino. All rights reserved.
//

#import "PlayingGameViewController.h"
#import "PlayingCardDeck.h"
@interface PlayingGameViewController ()

@end

@implementation PlayingGameViewController

- (IBAction)switch:(id)sender {
    self.game.matchMode = !self.game.matchMode ;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.game.matchMode = NO;///only set
    // Do any additional setup after loading the view.
}

-(Deck*)createDeck
{
    if(! self.deck) self.deck = [[PlayingCardDeck alloc] init]; // PlayingCardDeck
    return self.deck;
}

- (IBAction)reset{
    [super reset];
    self.game.matchMode = NO;
}

-(void) beforeButton
{
    //disable button
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
