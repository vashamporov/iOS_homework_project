//
//  ContListTableView.h
//  ios_homework_app
//
//  Created by Admin on 05/11/2016.
//  Copyright © 2016 vashamporov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewContactViewController.h"
#import "ContactLogData.h"

@interface ContactListTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, NewContactDelegate>
@property (strong, nonatomic) NSMutableArray *ContactDataArr;


@end
