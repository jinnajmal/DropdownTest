//
//  DropdownTestViewController.h
//  DropdownTest
//
//  Created by Muhammad Ajmal on 10/4/11.
//  Copyright 2011 Mutazo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropdownControl.h"

@interface DropdownTestViewController : UIViewController
{
    DropdownControl *control;
}
@property(nonatomic,retain) DropdownControl *control;
@end
