//
//  ViewController.h
//  Music Search
//
//  Created by MCS on 8/18/15.
//  Copyright (c) 2015 MCS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property(strong,nonatomic) NSMutableArray* trackNameArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

//@property (nonatomic, weak) IBOutlet UITableView * tableView;
@property (nonatomic, weak) NSString * currentSelectedSong;

@property (weak, nonatomic) IBOutlet UITextField *textAreaSeachField;
@property (weak, nonatomic) IBOutlet UIButton *actionSeachButton;

@property (strong, nonatomic) NSMutableArray * playList;
@property(strong,nonatomic) NSMutableArray *trackNameArrayLittleCopy;

@end

