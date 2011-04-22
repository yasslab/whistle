//
//  WhistleViewController.h
//  Whistle
//
//  Created by Yohei Okada on 3/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <AVFoundation/AVFoundation.h>

@interface WhistleViewController : UIViewController {
    
	// declare the variables used in this whistle application.
    UIButton *startButton;
    UIButton *endButton;
    
    AVAudioPlayer* bgm;
    
    
    
}

@property(retain,nonatomic) UIButton *startButton;
@property(retain,nonatomic) UIButton *endButton;

@property(retain,nonatomic) AVAudioPlayer* bgm;
 

- (void)startPushed;
- (void)stopPushed;

@end
