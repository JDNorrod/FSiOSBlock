//
//  ViewController.h
//  AOC1wk2
//
//  Created by Jonathan Norrod on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    UILabel *title, *authorLabel, *author, *publishedLabel, *published, *summaryLabel, *summary, *listLabel, *listItems;
    NSArray *labels, *items;
    NSMutableString *appendedList;
}

@end
