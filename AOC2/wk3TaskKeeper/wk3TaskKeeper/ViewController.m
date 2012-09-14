//
//  ViewController.m
//  wk3TaskKeeper
//
//  Created by Jonathan on 9/10/12.
//  Copyright (c) 2012 JDNorrod. All rights reserved.
//

#import "ViewController.h"
#import "AddEventViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)onClick:(id)sender{
    AddEventViewController* infoView = [[AddEventViewController alloc] initWithNibName:@"AddEventView" bundle:nil];
    [self presentModalViewController:infoView animated:TRUE];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
