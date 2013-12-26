//
//  PianoKey.m
//  FingerPiano1.0
//
//  Created by yeke on 10-3-2.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PianoKey.h"


@implementation PianoKey
@synthesize ImageKeyUp;
@synthesize ImageKeyDown;
@synthesize MySoundPlayer;
@synthesize KeyStatu;

- (void)PianoKeySetup:(UIImage *)upimage downimage:(UIImage *)downimage soundurl:(NSString *)soundurl
{
	self.ImageKeyUp = upimage;
	self.ImageKeyDown = downimage;
	NSURL *fileURL = [[NSURL alloc]initFileURLWithPath:soundurl];
	AVAudioPlayer *aplayer =[[AVAudioPlayer alloc]initWithContentsOfURL:fileURL error:nil];
	[fileURL release];
	self.MySoundPlayer = aplayer;
	[aplayer release];
	[MySoundPlayer prepareToPlay];
	[MySoundPlayer setDelegate:self];
	[self setImage:ImageKeyUp];
	KeyStatu = NO;
	//self.userInteractionEnabled = YES;
	
}
/*
//不对滑动进行响应的代码 将 userInteractionEnabled 打开 然后将PianoKey添加对 touch的响应。
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self KeyPressDown];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self KeyPressUp];
}
 */
- (void)KeyPressDown{
	[self setImage:ImageKeyDown];
	if (MySoundPlayer.playing) {
		[MySoundPlayer pause];
		MySoundPlayer.currentTime = 0;
		[MySoundPlayer play];
	}
	else {
		[MySoundPlayer play];
	}
	KeyStatu = YES;
}
- (void)KeyPressUp{
	[self setImage:ImageKeyUp];
	KeyStatu = NO;

}
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
	[ImageKeyUp release];
	[ImageKeyDown release];
	[MySoundPlayer release];
    [super dealloc];
}


@end
