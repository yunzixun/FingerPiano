//
//  FingerPiano1_0AppDelegate.h
//  FingerPiano1.0
//
//  Created by yeke on 10-3-2.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

@class MainViewController;
@class PianoKey;
@interface FingerPiano1_0AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController *mainViewController;

@end

