//
//  WhistleViewController.m
//  Whistle
//
//  Created by Yohei Okada on 3/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WhistleViewController.h"

#define MUSICNAME @"sei_ge_hoissuru01"
#define MUSICTYPE @"mp3"

#define SIMAGE @"btn_on.png"
#define EIMAGE @"btn_off.png"

@implementation WhistleViewController

@synthesize startButton;	// register startButton for XiB
@synthesize endButton;		// register
@synthesize bgm;			// register


// free memory automatically inserted.
- (void)dealloc
{
    [startButton release];
    [endButton release];
    [bgm release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    // make an instance of startButton
    UIButton *sButton = [UIButton buttonWithType:UIButtonTypeCustom];
	// draw sButton on given area.
    [sButton setFrame:CGRectMake(35, 115, 250, 250)];
	// set BG of sButton 
    [sButton setBackgroundImage:[UIImage imageNamed:SIMAGE] forState:UIControlStateNormal];
    //[sButton setTitle:NSLocalizedString(@"Start", @"Start") forState:UIControlStateNormal];
	// if pushed sButton, call startPushed()
    [sButton addTarget:self action:@selector(startPushed) forControlEvents:UIControlEventTouchUpInside];
    
	// put created sButton into actual view.
    [self.view addSubview:sButton];
    self.startButton = sButton; 
    
    // make an instance of endButton
    UIButton *eButton = [UIButton buttonWithType:UIButtonTypeCustom];
	// draw eButton on given area
    [eButton setFrame:CGRectMake(35, 115, 250, 250)];
	// set BG of eButton
    [eButton setBackgroundImage:[UIImage imageNamed:EIMAGE] forState:UIControlStateNormal];
    //[eButton setTitle:NSLocalizedString(@"Stop", @"Stop") forState:UIControlStateNormal];
    [eButton addTarget:self action:@selector(stopPushed) forControlEvents:UIControlEventTouchUpInside];
	// hidden the button unless the other button is pressed.
    [eButton setHidden:YES];
    
	// put created eButton into actual view.
    [self.view addSubview:eButton];
    self.endButton = eButton;
    
    
    //audio
    // NS: ???
	// AV: ???
	// create a path to bgm (whistle sound) as a string
    NSString* bgmpath = [[NSBundle mainBundle] pathForResource:MUSICNAME ofType:MUSICTYPE];
	// set the path into NSURL
    NSURL* url = [NSURL fileURLWithPath:bgmpath];
	// create an audio file with the given URL
    AVAudioPlayer* audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
	// it loops forever.
    audio.numberOfLoops = -1;
	// put the audio into actual variable, bgm. (deep copy)
    self.bgm = audio;
	// release the audio
    [audio release];
       
}


// when pressed the on btn, call this function.
- (void)startPushed
{
    // hide startButton
    [self.startButton setHidden:YES];
	// unveil endButton
    [self.endButton setHidden:NO];
    
    // ring
    NSDate *pFrom = [NSDate new];
	// play the whistle sound
    [self.bgm play];
	// measure the time ringing.
    NSDate *pTo = [NSDate new];
	// display the measured time.
    NSLog(@"elapsed time of day pushed %f", [pTo timeIntervalSinceDate:pFrom]);
}


// when pressed the off btn, call this function.
- (void)stopPushed
{
	// hide the endButton
    [self.endButton setHidden:YES];
	// unveil the startButton
    [self.startButton setHidden:NO];
    
    // stop ringing whistle sound
    [self.bgm stop];
}


// TODO: ???
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.startButton = nil;
    self.endButton = nil;
    
}

@end
