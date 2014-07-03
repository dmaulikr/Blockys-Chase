//
//  WAMPlayerAndScore.m
//  iPad_CompFair
//
//  Created by Wade Anthony on 5/15/14.
//  Copyright (c) 2014 Wade Anthony. All rights reserved.
//

#import "WAMPlayerAndScore.h"

@implementation WAMPlayerAndScore

-(id) initWithName:(NSString *)newName andScore:(NSNumber *)newScore
{
	self = [super init];
    if (self) {
		self.RecordName = newName;
		self.RecordScore = newScore;
    }
    return self;
}



@end
