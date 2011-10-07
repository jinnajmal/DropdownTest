//
//  DropdownControl.m
//  DropdownTest
//
//  Created by Muhammad Ajmal on 10/4/11.
//  Copyright 2011 Mutazo. All rights reserved.
//

#import "DropdownControl.h"
#import <QuartzCore/QuartzCore.h>

@implementation DropdownControl
@synthesize inputField = _inputField;
@synthesize items = _items;
@synthesize listTableview = _listTableview;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
 
        _origionalBounds = frame;
        _currentBounds = frame;
        isShowingList = NO;
        
        CGRect tablebounds = CGRectMake(CGRectGetMinX(self.bounds), CGRectGetMaxY(self.bounds), CGRectGetWidth(self.bounds), 0);
        self.listTableview = [[[UITableView alloc] initWithFrame:tablebounds style:UITableViewStylePlain] autorelease];
        [_listTableview setDelegate:self];
        [_listTableview setDataSource:self];
        [_listTableview setRowHeight:22];
        _listTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        [[_listTableview layer] setBorderWidth:2];
        [[_listTableview layer] setBorderColor:[UIColor lightGrayColor].CGColor];
        [self addSubview:_listTableview];
        
        self.inputField = [[[UITextField alloc] initWithFrame:self.bounds] autorelease];
        [_inputField setBorderStyle:UITextBorderStyleBezel];
        [_inputField setBackgroundColor:[UIColor whiteColor]];
        [_inputField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [_inputField setFont:[UIFont systemFontOfSize:12.0f]];
        [_inputField setDelegate:self];
        
        UIView *tRightView = [[[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_inputField.bounds) - 30,CGRectGetMinY(_inputField.bounds) + 1,
            30, CGRectGetHeight(_inputField.bounds) - 2)] autorelease];
        [[tRightView layer] setBorderWidth:1.0];
        [[tRightView layer] setBorderColor:[UIColor lightGrayColor].CGColor];
        [[tRightView layer] setShadowOffset:CGSizeMake(0,5)];
        [[tRightView layer] setShadowColor:[UIColor lightGrayColor].CGColor];
        [[tRightView layer] setShadowOpacity:1.0];
        [tRightView setBackgroundColor:[UIColor whiteColor]];
        
        UIButton *arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [arrowBtn setFrame:CGRectMake(2, 2, 26, 26)];
        [arrowBtn setImage:[UIImage imageNamed:@"arrow_skip_down"] forState:UIControlStateNormal];
        [arrowBtn addTarget:self action:@selector(arrowBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [tRightView addSubview:arrowBtn];
        [_inputField setRightView:tRightView];
        [_inputField setRightViewMode:UITextFieldViewModeUnlessEditing];
        [self addSubview:_inputField];
    }
    return self;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self showHideList];
    return NO;
}

- (void)arrowBtnAction
{
    [self showHideList];
}

- (void) showHideList
{
    if(!isShowingList)
    {
        isShowingList = YES;
        [UIView beginAnimations:@"testtt" context:nil];
        [UIView setAnimationDuration:.35];
        
        CGRect tablebounds = CGRectMake(CGRectGetMinX(self.bounds), CGRectGetMaxY(self.bounds), CGRectGetWidth(self.bounds), 120);
        [_listTableview setFrame:tablebounds];
        _currentBounds = CGRectMake(CGRectGetMinX(_origionalBounds), CGRectGetMinY(_origionalBounds), CGRectGetWidth(_origionalBounds), CGRectGetHeight(_origionalBounds) + 120);
        [self setFrame:_currentBounds];
        [UIView commitAnimations];
        [_listTableview reloadData];
    }
    else
    {
        isShowingList = NO;
        [UIView beginAnimations:@"testtt" context:nil];
        [UIView setAnimationDuration:.35];
        [self setFrame:_origionalBounds];
        _currentBounds = _origionalBounds;
        
        CGRect tablebounds = CGRectMake(CGRectGetMinX(self.bounds), CGRectGetMaxY(self.bounds), CGRectGetWidth(self.bounds), 0);
        [_listTableview setFrame:tablebounds];
        [UIView commitAnimations];
    }

}

- (void)dealloc {
    [_inputField release]; _inputField = nil;
    [_items release]; _items = nil;
    [_listTableview release]; _listTableview = nil;
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Option %d",indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:12];
    // Configure the cell...
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    isShowingList = NO;
    [UIView beginAnimations:@"testtt" context:nil];
    [UIView setAnimationDuration:.35];
    
    self.frame = _origionalBounds;
    _currentBounds = _origionalBounds;
    
    
    CGRect tablebounds = CGRectMake(CGRectGetMinX(self.bounds), CGRectGetMaxY(self.bounds), CGRectGetWidth(self.bounds), 0);
    [_listTableview setFrame:tablebounds];
    [_inputField setText:[NSString stringWithFormat:@"Option %d",indexPath.row]];
    [UIView commitAnimations];
    
}

@end
