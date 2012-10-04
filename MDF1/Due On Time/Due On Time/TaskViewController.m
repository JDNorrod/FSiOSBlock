//
//  TaskViewController.m
//  Due On Time
//
//  Created by Jonathan on 10/1/12.
//  Copyright (c) 2012 JDNorrod. All rights reserved.
//

#import "TaskViewController.h"

@interface TaskViewController ()

@end

@implementation TaskViewController

@synthesize taskDelegate;
@synthesize description;
@synthesize details;
@synthesize dueDate;

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
    dateDueDate.minimumDate = [NSDate date];                    //cannot create due dates in the past
    if (description != nil) {                       //if initializing with selected info from prev. view
        textDescription.text = description;
        textDetails.text = details;
        dateDueDate.date = dueDate;
    }
    
    responderButton.hidden = YES;                           //responder bar and button start as hidden
    responderLabel.hidden = YES;
    
    textViewOrigin = textDetails.frame;
    dateDueDate = [[UIDatePicker alloc] init];
    textDateField.inputView = dateDueDate;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Text View

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    //change the size of the textview on editing
    textDetails.bounds = CGRectMake(textViewOrigin.origin.x, textViewOrigin.origin.y, textViewOrigin.size.width, textViewOrigin.size.height + 90);
    
    [self toggleResponderBar];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    int six = 3;
}

#pragma mark - Custom Methods

-(IBAction)onClick:(id)sender
{
    if ([sender tag] == 1) {                    //background pressed, dismiss keyboard
        if ([textDetails isFirstResponder]) {
            [textDetails resignFirstResponder];
            textDetails.bounds = textViewOrigin;
            [self toggleResponderBar];
        }
        else if ([textDescription isFirstResponder]){
            [textDescription resignFirstResponder];
            [self toggleResponderBar];
        }
        else if ([textDateField isFirstResponder]){
            [textDateField resignFirstResponder];
            [self toggleResponderBar];
        }
    }
    else if ([sender tag] == 0) {
                                                                //save the info and pass back to firstView
        NSCharacterSet* spaces = [NSCharacterSet whitespaceAndNewlineCharacterSet];     //create a set with space and return
        NSString* trimmedEvent = [textDescription.text stringByTrimmingCharactersInSet:spaces];
        
        if (trimmedEvent.length == 0) {        //description is empty, use date/time as description
            NSDate *today = [NSDate date];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            
            [dateFormatter setDateStyle:NSDateFormatterShortStyle];
            [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
            NSString *currentTime = [dateFormatter stringFromDate:today];
            
            [taskDelegate eventDidSave:currentTime withDate:dateDueDate.date description:textDetails.text];
        }
        else{
            [taskDelegate eventDidSave:textDescription.text withDate:dateDueDate.date description:textDetails.text];
        }
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)toggleResponderBar
{
    if ([responderButton isHidden]) {
        responderButton.hidden = NO;
        responderLabel.hidden = NO;
    }
    else{
        responderButton.hidden = YES;
        responderLabel.hidden = YES;
    }
}

-(IBAction)resignFirstResponder:(id)sender
{
    [sender resignFirstResponder];
    responderLabel.hidden = YES;
    responderButton.hidden = YES;
}
@end