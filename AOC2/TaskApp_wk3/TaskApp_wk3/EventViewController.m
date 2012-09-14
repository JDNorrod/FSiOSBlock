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

-(IBAction)dismissKeyboard{
    
    [eventDescription resignFirstResponder];
}

-(IBAction)onClick:(id)sender{
    
    if ([sender tag] == 0) {
        //dismiss keyboard
        [self dismissKeyboard];
    }
    else if([sender tag] == 1){
        //dismiss modal and store string with date
        eventString = eventDescription.text;
        NSLog(@"%@", eventString);
        [myDelegate viewDidClose:[self appendStringWithDate]];              //send the string via delegate to viewController
        [self dismissModalViewControllerAnimated: YES];                    //close delegate
    }
    else{
        [self dismissModalViewControllerAnimated:YES];
    }
}

-(IBAction)onChange:(id)sender{
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
