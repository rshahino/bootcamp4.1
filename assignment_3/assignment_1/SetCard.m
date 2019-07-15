//
//  SetCard.m
//  assignment_3
//
//  Created by Roni Shahino on 14/07/2019.
//  Copyright © 2019 Roni Shahino. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard


-(void) number:(int) val
{
    if( val == 1 || val == 2 || val == 3)
    {
        _number = val;
        
    }
}

-(BOOL) IsSetInFeature:(NSArray*) features
{
    if(features[0] == features[1] && features[1] == features[2])
    {
        return YES;
    }
    if(features[0] == features[1] || features[1] == features[2] || features[0] == features[2]  )
    {
        return NO;
    }
    return YES;
}

-(int)match:(NSArray *) otherCards
{
    
    SetCard * c1 = otherCards[0];
    SetCard * c2 = otherCards[1];
    NSArray* colorArr = [NSArray arrayWithObjects:[NSNumber numberWithInt:self.color], [NSNumber numberWithInt:c1.color],[NSNumber numberWithInt:c2.color],nil];
    NSArray* shapeArr = [NSArray arrayWithObjects:[NSNumber numberWithInt:self.shape], [NSNumber numberWithInt:c1.shape],[NSNumber numberWithInt:c2.shape],nil];
    NSArray* fillingArr = [NSArray arrayWithObjects:[NSNumber numberWithInt:self.filling], [NSNumber numberWithInt:c1.filling],[NSNumber numberWithInt:c2.filling],nil];
    NSArray* numberArr = [NSArray arrayWithObjects:[NSNumber numberWithInt:self.number], [NSNumber numberWithInt:c1.number],[NSNumber numberWithInt:c2.number],nil];

   
    return [self IsSetInFeature:colorArr] && [self IsSetInFeature:shapeArr] && [self IsSetInFeature:numberArr] && [self IsSetInFeature:fillingArr];
}

-(NSString *)contents //overriding the base class function
{
    
    return [NSString stringWithFormat:@"%u %d %u %u ", self.shape, self.number, self.filling, self.color];
}


@end



