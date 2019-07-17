//
//  historyViewController.m
//  assignment_3
//
//  Created by Roni Shahino on 15/07/2019.
//  Copyright © 2019 Roni Shahino. All rights reserved.
//

#import "historyViewController.h"

@interface historyViewController ()
@property (weak, nonatomic) IBOutlet UITextView *text;
@end

@implementation historyViewController

- (void)viewDidLoad {
     self.text.text = self.str;
    [super viewDidLoad];
   
    // Do any additional setup after loading the view.
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
