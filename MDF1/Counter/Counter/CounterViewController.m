//
//  CounterViewController.m
//  Counter
//
//  Created by Jonathan on 9/15/12.
//  Copyright (c) 2012 JDNorrod. All rights reserved.
//

#import "CounterViewController.h"

@interface CounterViewController ()

@end

@implementation CounterViewController

@synthesize countDelegate;
@synthesize counter;
@synthesize overwriteOnReturn;
@synthesize descriptionText;

-(IBAction)dismissKeyboard{
    
    [eventDescription resignFirstResponder];
}

-(IBAction)onClick:(id)sender{
    
    if ([sender tag] == 0) {
        //increment the count
        incrementer.text = [NSString stringWithFormat:@"%d", ++counter];
    }
    else if([sender tag] == 1){
        [countDelegate eventDidSave:eventDescription.text withCount:counter shouldOverwrite:overwriteOnReturn];
        NSLog(@"%@", eventDescription.text);
        NSLog(@"%d", counter);
        [self dismissModalViewControllerAnimated: YES];                    //close, delegate
    }
    else{
        [self dismissModalViewControllerAnimated:YES];                     //close view no save
    }
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
    //if we need to load from a selected cell
    if (overwriteOnReturn) {
        incrementer.text = [NSString stringWithFormat:@"%d", counter];
        eventDescription.text = descriptionText;
    }
    else{
    counter = 0;   
    }
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
