//
//  TaskViewController.h
//  Due On Time
//
//  Created by Jonathan on 10/1/12.
//  Copyright (c) 2012 JDNorrod. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NewTaskDelegate <NSObject>

@required
-(void)eventDidSave:(NSString*)description withDate:(NSDate*)dueDate description:(NSString*)taskDescription;

@end

@interface TaskViewController : UIViewController <UITextViewDelegate, UITextFieldDelegate>
{
    IBOutlet UITextView*    textDetails;
    IBOutlet UITextField*   textDescription, *textDateField;
    CGRect                  textViewOrigin, datePickerOnScreen, datePickerOffScreen;
    IBOutlet UIDatePicker*  dateDueDate;
    id <NewTaskDelegate>    taskDelegate;
    NSString*               description, *details;
    NSDate*                 dueDate;
    IBOutlet UILabel*       responderLabel;
    IBOutlet UIButton*      responderButton;
}

-(IBAction)onClick:(id)sender;
-(IBAction)resignFirstResponder:(id)sender;

@property (strong) id <NewTaskDelegate> taskDelegate;
@property NSString* description;
@property NSString* details;
@property NSDate* dueDate;

@end
