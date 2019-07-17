//
//  Card.h
//  assignment_1
//
//  Created by Roni Shahino on 09/07/2019.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Card : NSObject

@property (strong,nonatomic) NSString *contents;
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter= isMatch) BOOL matched;

-(int)match:(NSArray *)otherCards;

@end

NS_ASSUME_NONNULL_END
