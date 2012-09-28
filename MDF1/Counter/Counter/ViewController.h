//
//  ViewController.h
//  Counter
//
//  Created by Jonathan on 9/15/12.
//  Copyright (c) 2012 JDNorrod. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CounterViewController.h"

@interface ViewController : UIViewController <EventViewDelegate, UITableViewDataSource, UITableViewDelegate>
{
    unsigned int totalCount;
    NSString* eventListString;
    BOOL isEditing;
    IBOutlet UITextView* eventList;
    IBOutlet UILabel* totalCountLabel;
    IBOutlet UITableView* tableViewEvents;
    IBOutlet UIBarButtonItem* editButton;
    NSMutableArray* descriptionArray;
    NSMutableDictionary* countObjects;
    CounterViewController* addCountView;
}

-(IBAction)onClick:(id)sender;


@end
