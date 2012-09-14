//
//  EventViewController.h
//  TaskApp_wk3
//
//  Created by Jonathan on 9/10/12.
//  Copyright (c) 2012 JDNorrod. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EventViewDelegate <NSObject>          //custom delegate, will communicate back to parent view
@required
-(void)viewDidClose:(NSString*)eventString;

@end


@interface EventViewController : UIViewController <UITextFieldDelegate>{
    IBOutlet UITextField* eventDescription;
    NSString* eventString;
    IBOutlet UIDatePicker* eventDatePicker;
    NSDate* eventStartDate;
    id <EventViewDelegate> myDelegate;            //declare the delegate
    
}

-(IBAction)dismissKeyboard;
-(NSString*)appendStringWithDate;
-(IBAction)onChange:(id)sender;
-(IBAction)onClick:(id)sender;

@property (strong) id <EventViewDelegate> myDelegate;
@end