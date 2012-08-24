//
//  ViewController.m
//  textField
//
//  Created by Jonathan Norrod on 8/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)onClick: (UIButton*) button{
    if (button.tag == 0) {
        NSString* newlabelText;
        NSString* userText = [inputField text];                                         //retrieve text from field
        if (userText.length > 0) {
            newlabelText = [[NSString alloc] initWithFormat:@"User: %@ has been logged in.", userText];
        }
        else {
            newlabelText = [[NSString alloc] initWithFormat:@"Username Cannot Be Empty", userText];
        }
        responseLabel.text = newlabelText;                                              //change text of label according to conditions
    }
    else if(button.tag == 1){
        NSDate* today = [NSDate date];
        NSDateFormatter *formatDate = [[NSDateFormatter alloc] init];                   //initialize as usual
        [formatDate setDateStyle:NSDateFormatterLongStyle];                             //sets contents of date
        [formatDate setTimeStyle:NSDateFormatterFullStyle];                             //changes display of set contents
        NSString* dateString;
        dateString = [formatDate stringFromDate:today]; 
        
        UIAlertView *dateView = [[UIAlertView alloc] initWithTitle:@"Date" message:dateString //display date in alert view
                                                          delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [dateView show];
    }
        else if(button.tag == 2){
            authorLabel.hidden = NO;                                                    //show author label
        }
}

- (void)textFieldShouldReturn:(UITextField *)textField{                                 //lower the keyboard
    [textField resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //******************************************input field
    //******************************************
    inputField = [[UITextField alloc] initWithFrame:CGRectMake(115, 10, 200, 30)];
    inputField.returnKeyType = UIReturnKeyDone; 
    inputField.borderStyle = UITextBorderStyleRoundedRect;
    inputField.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];
    [inputField addTarget:self action:@selector(textFieldShouldReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:inputField];
    
    //******************************************Labels
    //******************************************
    userLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 5.0f, 100.0f, 40.0f)];
    userLabel.text = @"Username: ";
    userLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:userLabel];
    
    responseLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 85.0f, 320.0f, 60.0f)];
    responseLabel.text = @"Please Enter Username";
    responseLabel.textColor = [UIColor blueColor];
    responseLabel.textAlignment = UITextAlignmentCenter;
    responseLabel.backgroundColor = [UIColor lightGrayColor];
    responseLabel.numberOfLines = 2;
    [self.view addSubview:responseLabel];
    
    authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 375.0f, 320.0f, 60.0f)];
    authorLabel.text = @"This application was awesomely coded by J. Norrod";
    authorLabel.textColor = [UIColor greenColor];
    authorLabel.textAlignment = UITextAlignmentCenter;
    authorLabel.backgroundColor = [UIColor clearColor];
    authorLabel.numberOfLines = 2;
    [self.view addSubview:authorLabel];
    authorLabel.hidden = YES;                                                           //hide this until info button press
    
    //******************************************Buttons
    //******************************************
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(240.0f, 50.0f, 75.0f, 25.0f);
    button.tag = 0;
    [button setTitle:@"Login" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    dateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    dateButton.frame = CGRectMake(10.0f, 250.0f, 90.0f, 50.0f);
    [dateButton setTitle:@"Show Date" forState:UIControlStateNormal];
    dateButton.tag = 1;
    [dateButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dateButton];
    
    infoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    infoButton.frame = CGRectMake(10.0f, 350.0f, 20.0f, 20.0f);
    infoButton.tag = 2;
    [infoButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:infoButton];                                       
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
