//
//  WAMViewController.m
//  Comp Fair
//
//  Created by Wade Anthony on 3/6/14.
//  Copyright (c) 2014 Wade Anthony. All rights reserved.
//

#import "WAMViewController.h"

@interface WAMViewController ()

@property (strong, nonatomic) IBOutlet UIView *Blocky;
@property (nonatomic, readwrite) CGPoint WhereBlockyIs;
@property (nonatomic, readwrite) CGPoint WhereBlockyCanScore;
@property (nonatomic) BOOL IsBlockyMoving;
@property (nonatomic) NSInteger Score;
@property (strong, nonatomic) IBOutlet UILabel *MyScoreLabel;
@property (strong, nonatomic) NSTimer *MyRepeater;
@property (strong, nonatomic) NSDictionary *MyGridDictionary;
@property (strong, nonatomic) NSDictionary *MyColorDictionary;
@property (strong, nonatomic) UIColor *CurrentRandomColor;
@property (strong, nonatomic) IBOutlet UILabel *NewGame_ScoreWindowLabel;
@property (strong, nonatomic) NSString *CurrentColorStringValue;
@property (strong, nonatomic) IBOutlet UILabel *TimerLabel;
@property (strong, nonatomic) IBOutlet UILabel *Leaderboard_Scores;
@property (strong, nonatomic) NSString *Scores_Text;
@property (strong, nonatomic) NSString *Names_Text;
@property (strong, nonatomic) IBOutlet UILabel *Leaderboard_Names;
@property (strong, nonatomic) NSTimer *TimerRepeater;
@property (strong, nonatomic) NSNumber *MyTime;
@property (strong, nonatomic) IBOutlet WAMPopupWindow *MyPopupWindow;
@property (strong, nonatomic) IBOutlet UIButton *Button_PLAY;
@property (nonatomic) BOOL WindowIsOnSreen;
@property (strong, nonatomic) NSMutableArray *Leaderboard;
@property (nonatomic) int indexCounter;
@property (strong, nonatomic) IBOutlet UIView *HighScoreWindow;
@property (strong, nonatomic) IBOutlet UITextField *HighScoreTextField;
@property (strong, nonatomic) IBOutlet UIButton *HighScoreOKAYButton;
@property (nonatomic) BOOL HighScoreWindowIsVisible;

//buttons
@property (strong, nonatomic) IBOutlet UIButton *TouchAreaUp;
@property (strong, nonatomic) IBOutlet UIButton *TouchAreaRight;
@property (strong, nonatomic) IBOutlet UIButton *TouchAreaDown;
@property (strong, nonatomic) IBOutlet UIButton *TouchAreaLeft;

// grid blocks 1
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid1_1;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid2_1;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid3_1;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid4_1;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid5_1;

// grid blocks 2
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid1_2;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid2_2;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid3_2;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid4_2;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid5_2;

// grid blocks 3
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid1_3;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid2_3;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid3_3;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid4_3;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid5_3;

// grid blocks 4
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid1_4;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid2_4;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid3_4;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid4_4;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid5_4;

// grid blocks 5
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid1_5;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid2_5;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid3_5;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid4_5;
@property (strong, nonatomic) IBOutlet WAMGridBlock *grid5_5;

@end

@implementation WAMViewController

const int GAME_TIME = 30;

-(NSTimer *)MyRepeater
{
	if(!_MyRepeater){
		_MyRepeater = [[NSTimer alloc] init];
	}
	return _MyRepeater;
}

-(NSTimer *)TimerRepeater
{
	if(!_TimerRepeater){
		_TimerRepeater = [[NSTimer alloc] init];
	}
	return _TimerRepeater;
}

-(void)EnableUserInteraction:(BOOL)input
{
	[self.TouchAreaUp setUserInteractionEnabled:input];
	[self.TouchAreaDown setUserInteractionEnabled:input];
	[self.TouchAreaLeft setUserInteractionEnabled:input];
	[self.TouchAreaRight setUserInteractionEnabled:input];
}

-(NSDictionary *)MyGridDictionary
{
	if (!_MyGridDictionary) {
		_MyGridDictionary = @{
							  @"grid1.000000_1.000000" : [self grid1_1],
							  @"grid2.000000_1.000000" : [self grid2_1],
							  @"grid3.000000_1.000000" : [self grid3_1],
							  @"grid4.000000_1.000000" : [self grid4_1],
							  @"grid5.000000_1.000000" : [self grid5_1],

							  @"grid1.000000_2.000000" : [self grid1_2],
							  @"grid2.000000_2.000000" : [self grid2_2],
							  @"grid3.000000_2.000000" : [self grid3_2],
							  @"grid4.000000_2.000000" : [self grid4_2],
							  @"grid5.000000_2.000000" : [self grid5_2],

							  @"grid1.000000_3.000000" : [self grid1_3],
							  @"grid2.000000_3.000000" : [self grid2_3],
							  @"grid3.000000_3.000000" : [self grid3_3],
							  @"grid4.000000_3.000000" : [self grid4_3],
							  @"grid5.000000_3.000000" : [self grid5_3],
							  
							  @"grid1.000000_4.000000" : [self grid1_4],
							  @"grid2.000000_4.000000" : [self grid2_4],
							  @"grid3.000000_4.000000" : [self grid3_4],
							  @"grid4.000000_4.000000" : [self grid4_4],
							  @"grid5.000000_4.000000" : [self grid5_4],

							  @"grid1.000000_5.000000" : [self grid1_5],
							  @"grid2.000000_5.000000" : [self grid2_5],
							  @"grid3.000000_5.000000" : [self grid3_5],
							  @"grid4.000000_5.000000" : [self grid4_5],
							  @"grid5.000000_5.000000" : [self grid5_5],
							  };
	}
	return _MyGridDictionary;
}

-(NSDictionary *)MyColorDictionary
{
	if(!_MyColorDictionary){
		_MyColorDictionary = @{
							   @"redColor" : [UIColor redColor],
							   @"whiteColor" : [UIColor whiteColor],
							   @"greenColor" : [UIColor greenColor],
							   @"orangeColor" : [UIColor orangeColor],
							   @"magentaColor" : [UIColor magentaColor],
							   @"purpleColor" : [UIColor purpleColor],
							   @"cyanColor" : [UIColor cyanColor],
							   @"blueColor" : [UIColor blueColor],
							   };
	}
	return _MyColorDictionary;
}


-(NSNumber *)MyTime
{
	if (!_MyTime) {
		_MyTime = [[NSNumber alloc] init];
		_MyTime = @30;
	}
	return _MyTime;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.HighScoreWindowIsVisible = NO;
	self.WhereBlockyIs = CGPointMake(3, 3);
}

- (void)viewDidAppear:(BOOL)animated
{
	self.WindowIsOnSreen = NO;
	self.Leaderboard = [NSMutableArray array];
	
	//for use wth leaderboard
	self.indexCounter = 0;
	
	[self refreshThePopupWindowBoard];
}

-(void) refreshThePopupWindowBoard
{
	//populate the leaderloard
	//TODO finish this: make sure poulation works DONE, write to the labels DONE, add a way to add new scores DONE, and save before the app closes DONE.
	
	NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"LeaderboardListSource" ofType:@"plist"];
	NSMutableArray *tempArray = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
	for (NSArray *thisArr in tempArray)
	{
		NSNumber *tempScore = [thisArr objectAtIndex:0];
		NSString *tempName = [thisArr objectAtIndex:1];
		WAMPlayerAndScore *tempObj = [[WAMPlayerAndScore alloc] initWithName:tempName andScore:tempScore];
		[self.Leaderboard addObject:tempObj];
	}
	
	for (int i = 0 ; i < 10 ; i++)
	{
		WAMPlayerAndScore *temp = [self.Leaderboard objectAtIndex:i];
		if (![temp.RecordScore  isEqual: @0]) {
			self.Scores_Text = [NSString stringWithFormat:@"%@\n%@", self.Scores_Text, temp.RecordScore.stringValue];
			self.Names_Text = [NSString stringWithFormat:@"%@\n%@", self.Names_Text, temp.RecordName];
		}
	}
	self.Leaderboard_Names.text = @"";
	self.Leaderboard_Scores.text = @"";
	//was a bug where first entry was @"(null)", substring removes this
	self.Leaderboard_Names.text = [self.Names_Text substringFromIndex: 7];
	self.Leaderboard_Scores.text = [self.Scores_Text substringFromIndex:7];
	[self StartTheGameMenu];
}

-(void)StartTheGameMenu
{
	[self EnableUserInteraction:NO];
	[self StartWindowInOrOut];
}


-(void)StartWithTime:(int)time
{
	// reset score
	self.Score = 0;
	
	//Activate interaction
	[self EnableUserInteraction:YES];
	
	// Make an NSInvocation to pass to NSTimer
	SEL selector = @selector(ChangeABlock);
	self.MyRepeater = [NSTimer scheduledTimerWithTimeInterval:2
													   target:self
													 selector:selector
													 userInfo:Nil
													  repeats:YES];
	// Start the Game Timer
	self.MyTime = @(time);
	SEL MySel = @selector(UpdateTimer);
	self.TimerRepeater = [NSTimer scheduledTimerWithTimeInterval:1
														  target:self
														selector:MySel
														userInfo:nil
														 repeats:YES];
}


-(void)UpdateTimer
{
	//update the timer and timer label
	int oldTime = [self.MyTime intValue];
	self.MyTime = @(oldTime - 1);
	
	if (self.MyTime.integerValue == 0) {
		[self.TimerLabel setText:[NSString stringWithFormat:@"00:00"]];
		[self endGame];
	}
	else if (self.MyTime.integerValue < 10) {
		[self.TimerLabel setText:[NSString stringWithFormat:@"00:0%@", self.MyTime]];
	}
	else{
		[self.TimerLabel setText:[NSString stringWithFormat:@"00:%@", self.MyTime]];
	}
}


-(void)endGame
{
	NSLog(@"Game Over :(");
	[self EnableUserInteraction:NO];
	BOOL isHighScore = [self checkForNewHighScore];
	[self.TimerRepeater invalidate];
	self.TimerRepeater = nil;
	[self.MyRepeater invalidate];
	self.MyRepeater = nil;
	if(isHighScore == NO)
	{
	   [self resetAndStartWindow];
	}else
	{
		[self resetAndStartWindow];
		[self StartWindowInOrOut];
	}
}

-(void) resetAndStartWindow
{
	self.NewGame_ScoreWindowLabel.text = [NSString stringWithFormat:@"Game Over!\nScore: %ld", (long)self.Score];
	self.HighScoreTextField.text = @"";
}

-(BOOL) checkForNewHighScore
{
	for (WAMPlayerAndScore *tempPlayer in self.Leaderboard) {
		NSNumber *tempNum = tempPlayer.RecordScore;
		if (self.Score > [tempNum integerValue]) {
			[self addToLeaderboard];
			self.indexCounter = 0;
			return YES;
		}
		self.indexCounter++;
	}
	self.indexCounter = 0;
	return NO;
}

-(void) addToLeaderboard
{
	[self MoveHighScoreWindow];
}
- (IBAction)OnClickHighScoreOKAYButton:(id)sender
{
	[self.view endEditing:YES];
	NSNumber *tempScore = [NSNumber numberWithInteger:self.Score];
	WAMPlayerAndScore *tempPlaya = [[WAMPlayerAndScore alloc] initWithName:self.HighScoreTextField.text andScore:tempScore];
	[self.Leaderboard insertObject:tempPlaya atIndex:self.indexCounter];
	
	//Save to plist
	NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"LeaderboardListSource" ofType:@"plist"];
	[self.Leaderboard writeToFile:plistPath atomically:YES];
	[self MoveHighScoreWindow];
	[self refreshThePopupWindowBoard];
	[self resetAndStartWindow];
}

-(void) MoveHighScoreWindow
{
	CGRect center = self.HighScoreWindow.frame;
	if (self.HighScoreWindowIsVisible) {
		center.origin.y += ((self.view.frame.size.height/2)+(self.HighScoreWindow.frame.size.height/2));
		[UIView animateWithDuration:1.5
							  delay:0
							options:UIViewAnimationOptionBeginFromCurrentState
						 animations:^{
							 self.HighScoreWindow.frame = center;
						 }
						 completion:^(BOOL finished){
							 self.HighScoreWindowIsVisible = NO;
							 NSLog(@"Popup HighScore Ani Finished");
						 }];
	}else{
		center.origin.y -= ((self.view.frame.size.height/2)+(self.HighScoreWindow.frame.size.height/2));
		[UIView animateWithDuration:1.5
							  delay:0
							options:UIViewAnimationOptionBeginFromCurrentState
						 animations:^{
							 self.HighScoreWindow.frame = center;
						 }
						 completion:^(BOOL finished){
							 self.HighScoreWindowIsVisible = YES;
							 NSLog(@"Popup HighScore Ani Finished");
						 }];
	}
}

-(void)ChangeABlock
{
	int XValue = (arc4random() % 5) + 1;
	NSString *RandomXValue = [NSString stringWithFormat:@"%d.000000",XValue];
	int YValue = (arc4random() % 5) + 1;
	NSString *RandomYValue = [NSString stringWithFormat:@"%d.000000",YValue];
	NSString *MyRandomBlock = [NSString stringWithFormat:@"grid%@_%@", RandomXValue, RandomYValue];
	WAMGridBlock *MyViewToChangeTheColorOf = [self.MyGridDictionary objectForKey:MyRandomBlock];

	// Update the block's data
	self.CurrentRandomColor = [self RandomColor];
	[MyViewToChangeTheColorOf setBackgroundColor:self.CurrentRandomColor];
	MyViewToChangeTheColorOf.IsDiscolored = YES;
	MyViewToChangeTheColorOf.MyColor = [self.MyColorDictionary objectForKey:self.CurrentRandomColor];
	[UIView animateWithDuration:1
						  delay:1
						options:NO
					 animations:^{
						 [MyViewToChangeTheColorOf setBackgroundColor:[UIColor lightGrayColor]];
					 }
					 completion:^(BOOL finished){
						 MyViewToChangeTheColorOf.IsDiscolored = NO;
						 MyViewToChangeTheColorOf.MyColor = @"lightGrayColor";
					 } ];
}


-(UIColor *)RandomColor
{
	int RandomColorNumber = (arc4random() % 8) + 1;
	switch (RandomColorNumber) {
		case 1:
			self.CurrentColorStringValue = @"red";
			return [UIColor redColor];
			break;
			
		case 2:
			self.CurrentColorStringValue = @"white";
			return [UIColor whiteColor];
			break;
			
		case 3:
			self.CurrentColorStringValue = @"green";
			return [UIColor greenColor];
			break;
			
		case 4:
			self.CurrentColorStringValue = @"orange";
			return [UIColor orangeColor];
			break;
			
		case 5:
			self.CurrentColorStringValue = @"magenta";
			return [UIColor magentaColor];
			break;
			
		case 6:
			self.CurrentColorStringValue = @"purple";
			return [UIColor purpleColor];
			break;
			
		case 7:
			self.CurrentColorStringValue = @"cyan";
			return [UIColor cyanColor];
			break;
			
		default:
			self.CurrentColorStringValue = @"blue";
			return [UIColor blueColor];
			break;
	}
	return [UIColor lightGrayColor];
}

- (IBAction)tap_UP:(id)sender
{
	NSLog(@"Up");
	// Update WhereBlockyIs struct
	CGRect newFrame = self.Blocky.frame;
	newFrame.origin.y = (newFrame.origin.y - (self.Blocky.frame.size.height + 8));
	
	// only move if the motion would be within the acceptable domain and range
	if (self.WhereBlockyIs.y < 5) {
		self.IsBlockyMoving = YES;
		self.WhereBlockyIs = CGPointMake(self.WhereBlockyIs.x, self.WhereBlockyIs.y + 1);
	[UIView animateWithDuration:0.5
						  delay:0
						options:UIViewAnimationOptionBeginFromCurrentState
					 animations:^{
						 self.Blocky.frame = newFrame;
					 }
					 completion:^(BOOL finished){
						 
						 self.IsBlockyMoving = NO;
						 NSLog(@"grid%f_%f", self.WhereBlockyIs.x, self.WhereBlockyIs.y);
						 WAMGridBlock *ViewWhereBlockyIsAt = [self.MyGridDictionary objectForKey:[NSString stringWithFormat:@"grid%f_%f", self.WhereBlockyIs.x, self.WhereBlockyIs.y]];
						 
						 if (ViewWhereBlockyIsAt.IsDiscolored == YES) {
							 NSLog(@"I just stopped on a colored block! %@ is its color.", self.CurrentColorStringValue);
							 [self AddScoreForUIColor:self.CurrentColorStringValue];
						 }
					 }];
	}
}

- (void)StartWindowInOrOut
{
	CGRect center = self.MyPopupWindow.frame;
	if (self.WindowIsOnSreen) {
		center.origin.y += ((self.view.frame.size.height/2)+(self.MyPopupWindow.frame.size.height/2));
		[UIView animateWithDuration:1.5
							  delay:0
							options:UIViewAnimationOptionBeginFromCurrentState
						 animations:^{
							 self.MyPopupWindow.frame = center;
						 }
						 completion:^(BOOL finished){
							 self.WindowIsOnSreen = NO;
							 NSLog(@"Popup Start Ani Finished");
						 }];
	}else{
		center.origin.y -= ((self.view.frame.size.height/2)+(self.MyPopupWindow.frame.size.height/2));
		[UIView animateWithDuration:1.5
							  delay:0
							options:UIViewAnimationOptionBeginFromCurrentState
						 animations:^{
								 self.MyPopupWindow.frame = center;
						 }
						 completion:^(BOOL finished){
							 self.WindowIsOnSreen = YES;
							 NSLog(@"Popup Start Ani Finished");
						 }];
	}
}

- (IBAction)PressSTARTButton:(id)sender
{
	[self StartWithTime:GAME_TIME];
	[self StartWindowInOrOut];
}

-(void)AddScoreForUIColor:(NSString *)MyColor
{
	if ([MyColor  isEqualToString:@"red"]) {
		[self.view setBackgroundColor:[self.MyColorDictionary objectForKey:[NSString stringWithFormat:@"%@Color", MyColor]]];
		[self updateScore:5];
	}
	else if ([MyColor  isEqualToString:@"white"]) {
		[self.view setBackgroundColor:[self.MyColorDictionary objectForKey:[NSString stringWithFormat:@"%@Color", MyColor]]];
		[self updateScore:10];
	}
	else if ([MyColor  isEqualToString:@"green"]) {
		[self.view setBackgroundColor:[self.MyColorDictionary objectForKey:[NSString stringWithFormat:@"%@Color", MyColor]]];
		[self updateScore:15];
	}
	else if ([MyColor  isEqualToString:@"orange"]) {
		[self.view setBackgroundColor:[self.MyColorDictionary objectForKey:[NSString stringWithFormat:@"%@Color", MyColor]]];
		[self updateScore:20];
	}
	else if ([MyColor  isEqualToString:@"magenta"]) {
		[self.view setBackgroundColor:[self.MyColorDictionary objectForKey:[NSString stringWithFormat:@"%@Color", MyColor]]];
		[self updateScore:25];
	}
	else if ([MyColor  isEqualToString:@"purple"]) {
		[self.view setBackgroundColor:[self.MyColorDictionary objectForKey:[NSString stringWithFormat:@"%@Color", MyColor]]];
		[self updateScore:30];
	}
	else if ([MyColor  isEqualToString:@"cyan"]) {
		[self.view setBackgroundColor:[self.MyColorDictionary objectForKey:[NSString stringWithFormat:@"%@Color", MyColor]]];
		[self updateScore:35];
	}
	else if ([MyColor  isEqualToString:@"blue"]) {
		[self.view setBackgroundColor:[self.MyColorDictionary objectForKey:[NSString stringWithFormat:@"%@Color", MyColor]]];
		[self updateScore:50];
	}
}


-(void)updateScore:(NSUInteger)ToBeAddedToTheScore
{
	self.Score += ToBeAddedToTheScore;
	[self.MyScoreLabel setText: [NSString stringWithFormat:@"Score: %lu", (unsigned long)self.Score]];
}


- (IBAction)tap_LEFT:(id)sender
{
	NSLog(@"Left");
	// Update WhereBlockyIs struct
	CGRect newFrame = self.Blocky.frame;
	newFrame.origin.x = (newFrame.origin.x - (self.Blocky.frame.size.width + 8));
	
	if (self.WhereBlockyIs.x > 1) {
		self.IsBlockyMoving = YES;
		self.WhereBlockyIs = CGPointMake(self.WhereBlockyIs.x - 1, self.WhereBlockyIs.y);
	[UIView animateWithDuration:0.25
						  delay:0
						options:UIViewAnimationOptionBeginFromCurrentState
					 animations:^{
						 self.Blocky.frame = newFrame;
					 }
					 completion:^(BOOL finished){
						 self.IsBlockyMoving = NO;
						 NSLog(@"grid%f_%f", self.WhereBlockyIs.x, self.WhereBlockyIs.y);
						 WAMGridBlock *ViewWhereBlockyIsAt = [self.MyGridDictionary objectForKey:[NSString stringWithFormat:@"grid%f_%f", self.WhereBlockyIs.x, self.WhereBlockyIs.y]];
						 
						 if (ViewWhereBlockyIsAt.IsDiscolored == YES) {
							 NSLog(@"I just stopped on a colored block! %@ is its color.", self.CurrentColorStringValue);
							 [self AddScoreForUIColor:self.CurrentColorStringValue];
						 }

					 }];
	}
}


- (IBAction)Tap_DOWN:(id)sender
{
	NSLog(@"Down");
	// Update WhereBlockyIs struct
	CGRect newFrame = self.Blocky.frame;
	newFrame.origin.y = (newFrame.origin.y + (self.Blocky.frame.size.height + 8));
	
	if (self.WhereBlockyIs.y > 1) {
		self.IsBlockyMoving = YES;
		self.WhereBlockyIs = CGPointMake(self.WhereBlockyIs.x, self.WhereBlockyIs.y - 1);
	[UIView animateWithDuration:0.25
						  delay:0
						options:UIViewAnimationOptionBeginFromCurrentState
					 animations:^{
						 self.Blocky.frame = newFrame;
					 }
					 completion:^(BOOL finished){
						 self.IsBlockyMoving = NO;
						 NSLog(@"grid%f_%f", self.WhereBlockyIs.x, self.WhereBlockyIs.y);
						 WAMGridBlock *ViewWhereBlockyIsAt = [self.MyGridDictionary objectForKey:[NSString stringWithFormat:@"grid%f_%f", self.WhereBlockyIs.x, self.WhereBlockyIs.y]];
						 
						 if (ViewWhereBlockyIsAt.IsDiscolored == YES) {
							 NSLog(@"I just stopped on a colored block! %@ is its color.", self.CurrentColorStringValue);
							 [self AddScoreForUIColor:self.CurrentColorStringValue];
						 }
					 }];
	}
}


- (IBAction)Tap_RIGHT:(id)sender
{
	NSLog(@"Right");
	// Update WhereBlockyIs struct
	CGRect newFrame = self.Blocky.frame;
	newFrame.origin.x = (newFrame.origin.x + (self.Blocky.frame.size.width + 8));
	
	if (self.WhereBlockyIs.x < 5) {
		self.IsBlockyMoving = YES;
		self.WhereBlockyIs = CGPointMake(self.WhereBlockyIs.x + 1, self.WhereBlockyIs.y);
	[UIView animateWithDuration:0.25
						  delay:0
						options:UIViewAnimationOptionBeginFromCurrentState
					 animations:^{
						 self.Blocky.frame = newFrame;
					 }
					 completion:^(BOOL finished){
						 self.IsBlockyMoving = NO;
						 NSLog(@"grid%f_%f", self.WhereBlockyIs.x, self.WhereBlockyIs.y);
						 WAMGridBlock *ViewWhereBlockyIsAt = [self.MyGridDictionary objectForKey:[NSString stringWithFormat:@"grid%f_%f", self.WhereBlockyIs.x, self.WhereBlockyIs.y]];
						 
						 if (ViewWhereBlockyIsAt.IsDiscolored == YES) {
							 NSLog(@"I just stopped on a colored block! %@ is its color.", self.CurrentColorStringValue);
							 [self AddScoreForUIColor:self.CurrentColorStringValue];
						 }
					 }];
	}
}

-(void) addAScoreToLeaderboardWithName:(NSString *)newName andScore:(NSNumber *)newScore
{
	//implement this
	
	WAMPlayerAndScore *lowestScore = self.Leaderboard.lastObject;
	int indexCounter = 0;
	if (lowestScore.RecordScore<newScore) {
		for (WAMPlayerAndScore *temp in self.Leaderboard) {
			if (temp.RecordScore<newScore) {
			}else{
				[self.Leaderboard insertObject:[[WAMPlayerAndScore alloc] initWithName:newName andScore:newScore] atIndex:indexCounter];
			}
			indexCounter++;
		}
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

