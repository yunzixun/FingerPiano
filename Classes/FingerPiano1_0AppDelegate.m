//
//  FingerPiano1_0AppDelegate.m
//  FingerPiano1.0
//
//  Created by yeke on 10-3-2.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "FingerPiano1_0AppDelegate.h"
#import "MainViewController.h"
#import "PianoKey.h"
#import "MainView.h"
@implementation FingerPiano1_0AppDelegate


@synthesize window;
@synthesize mainViewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
	MainViewController *aController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	self.mainViewController = aController;
	[aController release];
	mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[mainViewController view]];
	window.backgroundColor = [UIColor grayColor];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end
