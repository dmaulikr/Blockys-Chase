//
//  WAMGridBlock.m
//  Comp Fair
//
//  Created by Wade Anthony on 3/17/14.
//  Copyright (c) 2014 Wade Anthony. All rights reserved.
//

#import "WAMGridBlock.h"

@implementation WAMGridBlock

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		self.MyColor = @"lightGrayColor";
		self.IsDiscolored = NO;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
