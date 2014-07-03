//
//  WAMPlayerAndScore.h
//  iPad_CompFair
//
//  Created by Wade Anthony on 5/15/14.
//  Copyright (c) 2014 Wade Anthony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WAMPlayerAndScore : NSObject

@property (strong, nonatomic) NSString *RecordName;
@property (strong, nonatomic) NSNumber *RecordScore;

-(id) initWithName:(NSString *)newName andScore:(NSNumber *)newScore;
-(id) initFromArray:(NSArray *)theGivenArray;

@end
