//
//  DropdownTestAppDelegate.h
//  DropdownTest
//
//  Created by Muhammad Ajmal on 10/4/11.
//  Copyright 2011 Mutazo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DropdownTestViewController;

@interface DropdownTestAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet DropdownTestViewController *viewController;

@end
