//
//  DropdownControl.h
//  DropdownTest
//
//  Created by Muhammad Ajmal on 10/4/11.
//  Copyright 2011 Mutazo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropdownControl : UIView <UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UITextField *_inputField;
    UITableView *_listTableview;
    CGRect _origionalBounds;
    CGRect _currentBounds;
    BOOL isShowingList;
    
    NSMutableArray *_items;
}
@property(nonatomic,retain) NSMutableArray *items;
@property(nonatomic,retain) UITextField *inputField;
@property(nonatomic,retain) UITableView *listTableview;

- (void) showHideList;
@end
