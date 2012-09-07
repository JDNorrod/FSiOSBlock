//
//  ViewController.h
//  Calculator
//
//  Created by Jonathan on 9/3/12.
//  Copyright (c) 2012 Jonathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UILabel* screen;
    IBOutlet UILabel* infoScreen;
    IBOutlet UISwitch* powerButton;
    long double originalNumber, currentNumber;
    int operatorSelected;
    NSString* stringNumber;
    BOOL isDecimal, wasDecimal, resultIsDisplayed;
}

-(IBAction)numeralPressed:(id)sender;
-(IBAction)operatorPressed:(id)sender;
-(IBAction)clearScreen;
-(IBAction)powerOn;
-(void)setOperator: (int)sender;
-(IBAction)screenChange:(id)sender;

@end
