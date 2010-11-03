//
//  NoisyAppAppDelegate.h
//  NoisyApp
//
//  Created by Peter Hajas on 11/2/10.
//  Copyright 2010 Peter Hajas Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "iTunes.h"

@interface NoisyAppAppDelegate : NSObject <NSApplicationDelegate> {
	NSPanel *hud;
	iTunesApplication *iTunes;
	
	NSTimer *tuneTimer;
	
	BOOL iTunesIsPlaying;
}

- (void)runOnTimer;
- (void)playMusic;

@property (assign) IBOutlet NSPanel *hud;

@end
