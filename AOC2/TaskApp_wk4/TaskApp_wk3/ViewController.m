//
//  ViewController.m
//  TaskApp_wk3
//
//  Created by Jonathan on 9/10/12.
//  Copyright (c) 2012 JDNorrod. All rights reserved.
//

#import "ViewController.h"
#import "EventViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewDidClose:(NSString*)eventString{         //this is a delegated method from the addEventView
    if (allEventsString != nil) {                   //if string is !nil append new string
        allEventsString = [allEventsString stringByAppendingString:eventString];
    }
    else{                                           //if string is nil create new string
        allEventsString = [NSString stringWithFormat:@"%@", eventString];
    }
    eventList.text = allEventsString;
}

-(void)onSwipe:(UIGestureRecognizer*)swipe
{
    EventViewController* addEventView = [[EventViewController alloc] initWithNibName:@"AddEventView" bundle:nil];
    addEventView.myDelegate = self;                             //assign my delegate to viewController
    [self presentModalViewController:addEventView animated:TRUE];
}

-(IBAction)onClick:(id)sender{
    //save the events to userDefaults
    [storedEvents setObject:allEventsString forKey:@"eventList"];
    [storedEvents synchronize];

    //show alert to notify user of save
    UIAlertView* saveAlert = [[UIAlertView alloc] initWithTitle:@"Saved!"
                                                       message:@"Your events have been saved" delegate:nil
                                             cancelButtonTitle:@"Okay" otherButtonTitles: nil];
    [saveAlert show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [swiperLabel addGestureRecognizer:rightSwipe];
    storedEvents = [NSUserDefaults standardUserDefaults];
    allEventsString = [storedEvents objectForKey:@"eventList"];
    if (allEventsString != nil) {
        eventList.text = allEventsString;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
