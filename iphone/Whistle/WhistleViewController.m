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

@synthesize startButton;
@synthesize endButton;
@synthesize bgm;


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
    
    //startButton
    UIButton *sButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [sButton setFrame:CGRectMake(35, 115, 250, 250)];
    [sButton setBackgroundImage:[UIImage imageNamed:SIMAGE] forState:UIControlStateNormal];
    //[sButton setTitle:NSLocalizedString(@"Start", @"Start") forState:UIControlStateNormal];
    [sButton addTarget:self action:@selector(startPushed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:sButton];
    self.startButton = sButton;
    
    //endButton
    UIButton *eButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [eButton setFrame:CGRectMake(35, 115, 250, 250)];
    [eButton setBackgroundImage:[UIImage imageNamed:EIMAGE] forState:UIControlStateNormal];
    //[eButton setTitle:NSLocalizedString(@"Stop", @"Stop") forState:UIControlStateNormal];
    [eButton addTarget:self action:@selector(stopPushed) forControlEvents:UIControlEventTouchUpInside];
    [eButton setHidden:YES];
    
    [self.view addSubview:eButton];
    self.endButton = eButton;
    
    
    //audio
    
    NSString* bgmpath = [[NSBundle mainBundle] pathForResource:MUSICNAME ofType:MUSICTYPE];
    NSURL* url = [NSURL fileURLWithPath:bgmpath];
    AVAudioPlayer* audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    audio.numberOfLoops = -1;
    self.bgm = audio;
    [audio release];
   
       
}


- (void)startPushed
{
    
    [self.startButton setHidden:YES];
    [self.endButton setHidden:NO];
    
    //ring
    NSDate *pFrom = [NSDate new];
    [self.bgm play];
    NSDate *pTo = [NSDate new];
    NSLog(@"elapsed time of day pushed %f", [pTo timeIntervalSinceDate:pFrom]);


}



- (void)stopPushed
{
    [self.endButton setHidden:YES];
    [self.startButton setHidden:NO];
    
    //ring
    [self.bgm stop];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    self.startButton = nil;
    self.endButton = nil;
    
}



@end
