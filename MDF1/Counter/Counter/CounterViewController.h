//
//  CounterViewController.h
//  Counter
//
//  Created by Jonathan on 9/15/12.
//  Copyright (c) 2012 JDNorrod. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EventViewDelegate <NSObject>              //custom delegate, will communicate back to parent view
@required
-(void)eventDidSave:(NSString*)description withCount: (int) myNum shouldOverwrite:(BOOL)response;

@end                                               //close of delegate methods/properties

@interface CounterViewController : UIViewController <UITextFieldDelegate>
{
    id <EventViewDelegate> countDelegate;
    IBOutlet UILabel* incrementer;
    unsigned int counter;                       //holds individual count for this item
    NSString* descriptionText;                  //used for initializing textField on detail view
    BOOL overwriteOnReturn;                     //set to YES if in detail view to overwrite dictionary in main view
    IBOutlet UITextField* eventDescription;
}


@property (strong) id <EventViewDelegate> countDelegate;  //necessary for access to delegate
@property unsigned int counter;
@property NSString* descriptionText;
@property BOOL overwriteOnReturn;

-(IBAction)onClick:(id)sender;
    
@end
