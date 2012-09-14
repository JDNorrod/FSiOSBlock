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
    if (allEventsString != nil) {
    allEventsString = [allEventsString stringByAppendingString:eventString];
    }
    else{
        allEventsString = [NSString stringWithFormat:@"%@", eventString];
    }
    eventList.text = allEventsString;
}


-(IBAction)onClick:(id)sender{
    EventViewController* addEventView = [[EventViewController alloc] initWithNibName:@"AddEventView" bundle:nil];
    addEventView.myDelegate = self;                             //assign my delegate to viewController
    [self presentModalViewController:addEventView animated:TRUE];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
