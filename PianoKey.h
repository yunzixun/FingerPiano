//
//  PianoKey.h
//  FingerPiano1.0
//	琴键类
//  Created by yeke on 10-3-2.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PianoKey : UIImageView<AVAudioPlayerDelegate>{
	UIImage *ImageKeyUp;
	UIImage *ImageKeyDown;
	AVAudioPlayer *MySoundPlayer;
	bool KeyStatu;

}
@property (nonatomic,retain)UIImage *ImageKeyUp;
@property (nonatomic,retain)UIImage *ImageKeyDown;
@property (nonatomic,retain)AVAudioPlayer *MySoundPlayer;
@property bool KeyStatu;

- (void)PianoKeySetup:(UIImage *) upimage downimage:(UIImage *)downimage soundurl:(NSString *)soundurl;
- (void)KeyPressDown;
- (void)KeyPressUp;

@end
