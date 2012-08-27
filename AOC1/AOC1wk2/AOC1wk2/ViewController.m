//
//  ViewController.m
//  AOC1wk2
//
//  Created by Jonathan Norrod on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

-(void)setUpLabel: (UILabel*) myLabel withColor: (UIColor*) bkgColor textColor: (UIColor*) textColor{
    myLabel.backgroundColor = bkgColor;
    myLabel.textColor = textColor;
    [self.view addSubview:myLabel];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //get the size of the screen
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat quarterWidth = screenWidth / 4.0f + 10.0f;
    CGFloat threeQuartWidth = screenWidth - quarterWidth;
    
    //initialize all items and position the labels
    title           = [[UILabel alloc] initWithFrame: CGRectMake(  0.0f,    0.0f, screenWidth, 30.0f)];
    authorLabel     = [[UILabel alloc] initWithFrame: CGRectMake(  0.0f,   50.0f, quarterWidth, 30.0f)];
    author          = [[UILabel alloc] initWithFrame: CGRectMake(quarterWidth,   50.0f, threeQuartWidth, 30.0f)];
    publishedLabel  = [[UILabel alloc] initWithFrame: CGRectMake(  0.0f,   90.0f, quarterWidth, 30.0f)];
    published       = [[UILabel alloc] initWithFrame: CGRectMake(quarterWidth,  90.0f, threeQuartWidth, 30.0f)];
    summaryLabel    = [[UILabel alloc] initWithFrame: CGRectMake(  0.0f,  140.0f, screenWidth, 30.0f)];
    summary         = [[UILabel alloc] initWithFrame: CGRectMake(  0.0f,  170.0f, screenWidth, 160.0f)];
    listLabel       = [[UILabel alloc] initWithFrame: CGRectMake(  0.0f,  350.0f, screenWidth, 30.0f)];
    listItems       = [[UILabel alloc] initWithFrame: CGRectMake(  0.0f,  380.0f, screenWidth, 50.0f)];
    appendedList    = [[NSMutableString alloc] init];

    
    //setup arrays, first for labels; second for items
    labels = [[NSArray alloc] initWithObjects: title, authorLabel, author, publishedLabel, published, summaryLabel, summary, listLabel, listItems, nil];
    items = [[NSArray alloc] initWithObjects:@"Books", @"Fire", @"Control", @"Rebellion", @"Conspiracies", nil];
    
    //append the items to the mutable string
    for (int i = 0; i < [items count]; i++) {
        NSString *insert = @", ";
        
        if (i == ([items count] - 1)) {
        //last one, set insert to ...
        insert = @"...";
        }
        //add each item in the array to the mutable string followed by ', ' except the last one is '...'
        [appendedList insertString:[[items objectAtIndex:i] stringByAppendingString:insert] atIndex:[appendedList length]];
    }
    //set text then alignment
    title.text                  = @"Fahrenheit 451";
    title.textAlignment         = UITextAlignmentCenter;
    authorLabel.text            = @"Author: ";
    authorLabel.textAlignment   = UITextAlignmentRight;
    author.text                 = @"Ray Bradbury";
    author.textAlignment        = UITextAlignmentLeft;
    publishedLabel.text         = @"Published: ";
    publishedLabel.textAlignment= UITextAlignmentRight;
    published.text              = @"1953";
    published.textAlignment     = UITextAlignmentLeft;
    summaryLabel.text           = @"Summary: ";
    summaryLabel.textAlignment  = UITextAlignmentLeft;
    summary.text        = @"This book is about a future society where books have been made illegal and the purpose of firemen is not to extinguish fires, rather to start them.  Firemen scour the country burning books while a group of people struggles to memorize one book of great importance.";
    summary.numberOfLines = 8;
    listLabel.text              = @"List: ";
    listLabel.textAlignment     = UITextAlignmentLeft;
    listItems.text              = appendedList;
    listItems.textAlignment     = UITextAlignmentCenter;
    listItems.numberOfLines = 3;
    
    for (int i = 0; i<[labels count]; i++) {
        CGFloat red =  (CGFloat)random()/(CGFloat)RAND_MAX;
        CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
        CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
        UIColor* randColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
        UIColor* randColor2 = [UIColor colorWithRed:blue green:red blue:green alpha:1];
        //set random colors for each label
        [self setUpLabel:[labels objectAtIndex:i] withColor:randColor textColor:randColor2];
    }
}
          

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
