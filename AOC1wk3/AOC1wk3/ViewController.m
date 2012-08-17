//
//  ViewController.m
//  AOC1wk3
//
//  Created by Jonathan Norrod on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h" 

@interface ViewController ()

@end

@implementation ViewController


//*****************************************************
//add function ****************************************

-(int)addWholeNumber: (int)numA with: (int)numB{
    return(numA + numB);                                                                //return sum
}

//*****************************************************
//compare function ************************************

-(BOOL)compare: (int)numA withNum: (int)numB{
    return (numA == numB);                                                        //returns YES/NO depending on evaluation
}

//*****************************************************
//append function *************************************

-(NSString*)append: (NSString*)stringA withString: (NSString*)stringB{
    NSMutableString *temp = [[NSMutableString alloc] initWithString:stringA];          //append stringA
    return [[temp stringByAppendingString:@" "] stringByAppendingString:stringB];      //append space and stringb and returns as nsstring
}

//*****************************************************
//display alert function ******************************

-(void)displayAlertWithString: (NSString*)title andMessage: (NSString*)thisMessage cancelButton: (NSString*)cancel{
    UIAlertView *myView = [[UIAlertView alloc] initWithTitle:title message:thisMessage delegate:nil cancelButtonTitle:cancel otherButtonTitles: nil];

    if (myView != nil) {
        [myView show];
    }
    [super viewWillAppear:YES];
}




- (void)viewDidLoad
{
    [super viewDidLoad];
	firstName = [[NSString alloc] initWithString:@"Jay"];
    lastName = [[NSString alloc] initWithString:@"Norrod"];
    myAge = arc4random() % 100;
    awesomenessLevel = arc4random() % 16;
    NSNumber *awesomenessRatio = [[NSNumber alloc] initWithInt:[self addWholeNumber:myAge with:awesomenessLevel]];//nsnumber form...

    convAwesomeness = [[NSString alloc] initWithString:[[[NSNumber alloc]initWithInt: myAge] stringValue]];
    NSString *awesomeMessage = [[NSString alloc] initWithString: [self append:@"His awesome ratio is: " 
                                                                   withString:[awesomenessRatio stringValue]]]; //convert nsnumber to string and append
    
    
    //this is where the magic happens************
    //show comparison of two numbers
    NSString *notEqual = [[NSString alloc] initWithFormat:@"%d != %d", myAge, awesomenessLevel];
    NSString *isEqual = [[NSString alloc] initWithFormat:@"%d == %d", myAge, awesomenessLevel];
    NSString *message = [NSString stringWithFormat: [self compare:myAge withNum:awesomenessLevel] ? isEqual:notEqual];

    [self displayAlertWithString:@"Comparing statistics shows: " andMessage:message cancelButton:@"That's Amazing!"];
    
    //nsnumber to string display + an append
    [self displayAlertWithString:@"Combining age and awesomeness..." andMessage:awesomeMessage cancelButton:@"Do go on..."];
    
    //append and display two strings
    [self displayAlertWithString:[self append:firstName withString:lastName]
                      andMessage:@"is pretty freaking awesome..." 
                    cancelButton:@"Really?"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
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
