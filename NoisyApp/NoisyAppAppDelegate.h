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
	
	NSStatusItem *statusItem;
	NSMenu *menu;
	NSTextField *timeDisplay;
	
	NSTimer *tuneTimer;
	NSTimer *timerCheckupTimer;
	
	BOOL iTunesIsPlaying;
}

- (void)runOnTimer;
- (void)checkupOnTimer;

- (void)playMusic;
- (IBAction)toggleNoisy:(id)sender;

@property (assign) IBOutlet NSPanel *hud;
@property (assign) IBOutlet NSMenu *menu;
@property (assign) IBOutlet NSTextField *timeDisplay;

@end
