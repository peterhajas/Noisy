//
//  NoisyAppAppDelegate.m
//  NoisyApp
//
//  Created by Peter Hajas on 11/2/10.
//  Copyright 2010 Peter Hajas Software. All rights reserved.
//

#define TIMETOAUTOPLAY 600.0

#import "NoisyAppAppDelegate.h"

@implementation NoisyAppAppDelegate

@synthesize hud;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification 
{
	//Grab the iTunes application
	iTunes = [SBApplication applicationWithBundleIdentifier:@"com.apple.iTunes"];
	if([iTunes isRunning])
	{
		iTunesIsPlaying = [iTunes playerState];
	}
	
	//Every 5 seconds, let's check if iTunes is playing. If it is not, start another timer to autoplay it in 5 minutes
	[NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(runOnTimer) userInfo:nil repeats:YES];
}

- (void)runOnTimer
{
	//First, check if iTunes is running
	
	if([iTunes isRunning])
	{
		//Check to see if iTunes is playing
		//If it isn't, and this is the first time we've seen it not play, start a timer to autoplay it again.
		if([iTunes playerState] == iTunesIsPlaying)
		{
			//iTunes is the same as it ever was, once in a lifetime...
		}
		else 
		{
			//Aha! There is disparity! Check to see if the player was paused, or started playing...
			if([iTunes playerState] == iTunesEPlSPlaying)
			{
				//The user hit "play" before our timer expired. Destroy it, and set iTunesIsPlaying back
				
				//Destroy timer
				
				//Set iTunesIsPlaying
				iTunesIsPlaying = [iTunes playerState];
			}
			else
			{
				//Looks like they've paused the music in the last 5 seconds, let's create our timer
				tuneTimer = [NSTimer scheduledTimerWithTimeInterval:TIMETOAUTOPLAY target:self selector:@selector(playMusic) userInfo:nil repeats:NO];
				
				//Set iTunesIsPlaying
				iTunesIsPlaying = [iTunes playerState];
			}
		}

	}
}

- (void)playMusic
{
	if(iTunesEPlSPaused)
	{
		[iTunes playpause];
	}
}

@end
