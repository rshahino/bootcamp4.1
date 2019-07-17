//
//  SetGameViewController.m
//  assignment_3
//
//  Created by Roni Shahino on 14/07/2019.
//  Copyright © 2019 Roni Shahino. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCardDeck.h"
#import "setCard.h"
@interface SetGameViewController ()

@end

@implementation SetGameViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    self.game.matchMode = YES;///only set
    // Do any additional setup after loading the view.
}

-(Deck*)createDeck
{
    if(! self.deck) self.deck = [[SetCardDeck alloc] init]; // PlayingCardDeck
    return self.deck;
}

- (IBAction)reset{
    [super reset];
    self.game.matchMode = YES;
}

-(NSString*) shapeTOStr:(CardShape )val
{
    if(val == 0){return @"W";}
    if(val == 1){return @"E";}
    return @"S";
}

-(UIColor* ) colorToUI:(CardColor) val
{
    if(val == 0) return [UIColor greenColor];
    if(val == 1) return [UIColor orangeColor];
    return [UIColor redColor];
}

-(double) transferencyByFilling:(CardFilling) val
{
    if(val == 0) return 0;
    if(val == 1) return 0.5;
    return 1;
}

-(NSAttributedString *) titleForCard:(Card *) card
{
    
    if( !card.isChosen) return [[NSAttributedString alloc] initWithString:@""];
    SetCard* setCard = (SetCard*)card;
    
    NSString* str = [self shapeTOStr:setCard.shape];
    NSString* str_numbered = @"";
    for (int i=0;i<=setCard.number;i++)
    {
        str_numbered = [NSString stringWithFormat:@"%@ %@",str_numbered, str];
    }
    NSRange range =[str_numbered rangeOfString:str_numbered];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:str_numbered ];
    UIColor *transparentYellow = [[UIColor yellowColor] colorWithAlphaComponent:[self transferencyByFilling:setCard.filling]];
    [text addAttribute:NSFontAttributeName value:[UIFont preferredFontForTextStyle:UIFontTextStyleBody] range:range];
    [text addAttribute:NSStrokeWidthAttributeName value:@-0.5 range:range];
    [text addAttribute:NSStrokeColorAttributeName value:[UIColor blackColor] range:range];
    [text addAttribute:NSForegroundColorAttributeName value:[self colorToUI:setCard.color] range:range];
    [text addAttribute:NSBackgroundColorAttributeName value:transparentYellow  range:range];
//    [text  appendAttributedString:<#(nonnull NSAttributedString *)#>]
    
    
    return text;
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
