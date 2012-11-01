//
//  DetailViewController.h
//  DueOnTime2
//
//  Created by Jonathan on 10/31/12.
//  Copyright (c) 2012 Jay Norrod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
