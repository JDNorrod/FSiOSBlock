//
//  ViewController.h
//  TaskApp_wk3
//
//  Created by Jonathan on 9/10/12.
//  Copyright (c) 2012 JDNorrod. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventViewController.h"


@interface ViewController : UIViewController <EventViewDelegate> {   //alert view controller of the delegate
    NSString* allEventsString;
    IBOutlet UITextView* eventList;
    IBOutlet UILabel* headerLabel;
    
}



-(IBAction)onClick:(id)sender;

@end
