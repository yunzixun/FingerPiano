//
//  MainView.m
//  FingerPiano1.0
//
//  Created by yeke on 10-3-2.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MainView.h"
#import "Keybordview.h"

@implementation MainView





CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI/180;};
CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180/M_PI;};

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		
		
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
	//CGAffineTransform transform = CGAffineTransformMakeRotation(DegreesToRadians(90));
	//lightinfobutton.transform = transform;//调用UIbutton的父类UIview的class method 将infolightbutton旋转90度。以符合横屏幕使用；
}


- (void)dealloc {
    [super dealloc];
}


@end
