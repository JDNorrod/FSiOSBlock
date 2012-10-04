//
//  FirstViewController.h
//  Due On Time
//
//  Created by Jonathan on 10/1/12.
//  Copyright (c) 2012 JDNorrod. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskViewController.h"

@class TaskViewController;

@interface FirstViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, NewTaskDelegate>
{
    IBOutlet UITableView*       tableDueList;                   //table for list of tasks with deadlines
    NSMutableArray*             arryDeadLinesDesc;              //array for key values to dictionary
    NSMutableDictionary*        dicDeadLines;                   //key = task name, value = due date/time
    UIBarButtonItem*            editButton;                     //it is what it is
    UIBarButtonItem*            addButton;
}

@property (strong, nonatomic) TaskViewController* detailViewController;

@end
