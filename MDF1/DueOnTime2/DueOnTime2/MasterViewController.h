//
//  MasterViewController.h
//  DueOnTime2
//
//  Created by Jonathan on 10/31/12.
//  Copyright (c) 2012 Jay Norrod. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
