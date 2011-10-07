//
//  DropdownTestViewController.m
//  DropdownTest
//
//  Created by Muhammad Ajmal on 10/4/11.
//  Copyright 2011 Mutazo. All rights reserved.
//

#import "DropdownTestViewController.h"

@implementation DropdownTestViewController
@synthesize control;
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.control = [[[DropdownControl alloc] initWithFrame:CGRectMake(20, 50, 250, 31)] autorelease];
    [self.view addSubview:self.control];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    control = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
