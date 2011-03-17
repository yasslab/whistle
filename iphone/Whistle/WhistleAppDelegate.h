//
//  WhistleAppDelegate.h
//  Whistle
//
//  Created by Yohei Okada on 3/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WhistleViewController;

@interface WhistleAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet WhistleViewController *viewController;

@end
