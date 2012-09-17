//
//  EventViewController.m
//  TaskApp_wk3
//
//  Created by Jonathan on 9/10/12.
//  Copyright (c) 2012 JDNorrod. All rights reserved.
//

#import "EventViewController.h"

@interface EventViewController ()

@end

@implementation EventViewController

@synthesize myDelegate;                 //syntheseize my delegate to be used

-(NSString*)appendStringWithDate{            //append the date to the event description
    NSDateFormatter* dateFormatted = [[NSDateFormatter alloc] init];
    [dateFormatted setDateFormat:@"EEE, MMM d, yyyy hh:mm a"];
    eventString = [eventString stringByAppendingFormat:@"\n%@ \n\n", [dateFormatted stringFromDate:eventStartDate]];
    return eventString;
}

-(IBAction)dismissKeyboard
{
    [eventDescription resignFirstResponder];
}

-(void)onSwipe:(UIGestureRecognizer*)swipe
{
    NSCharacterSet* spaces = [NSCharacterSet whitespaceAndNewlineCharacterSet];     //create a set with space and return
    NSString* trimmedEvent = [eventDescription.text stringByTrimmingCharactersInSet:spaces];       //eliminate whitespace from string
    
    if (trimmedEvent.length > 0) {                                                  //if string is empty it means no valid characters
        eventString = eventDescription.text;
        [myDelegate viewDidClose:[self appendStringWithDate]];        //send the string via delegate to viewController
        [self dismissModalViewControllerAnimated: YES];               //return to main view
    }
    else{
        //show alert to prompt description
        UIAlertView* errorAlert = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                            message:@"Please enter a description" delegate:nil
                                                  cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [errorAlert show];
    }
}

-(IBAction)onClick:(id)sender
{
    if ([sender tag] == 0) {
        //dismiss keyboard
        [self dismissKeyboard];
    }
    else if([sender tag] == 1){
        //dismiss modal and do not store string with date
        [self dismissModalViewControllerAnimated:YES];
    }
}

-(IBAction)onChange:(id)sender
{
    eventStartDate = eventDatePicker.date;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    eventDatePicker.minimumDate = [NSDate date];
    eventStartDate = eventDatePicker.date;                                  //initialize date with default in case
    leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [swipeLabel addGestureRecognizer:leftSwipe];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
