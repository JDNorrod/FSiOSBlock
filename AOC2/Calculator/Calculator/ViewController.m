//
//  ViewController.m
//  Calculator
//
//  Created by Jonathan on 9/3/12.
//  Copyright (c) 2012 Jonathan. All rights reserved.
//

#import "ViewController.h"
#import "InfoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)powerOn{
    if (powerButton.on) {           //calc turns on
        [self clearScreen];         //clear to be safe
        infoScreen.hidden = false;  //hide both labels
        screen.hidden = false;
        colorControl.enabled = YES;
    }
    else{                           //calc turns off
        [self clearScreen];         //clear to be safe
        infoScreen.hidden = true;   //show both labels
        screen.hidden = true;
        colorControl.enabled = NO;
    }
}

-(NSString*)displayString: (long double)number andString: (NSString*)stringToShow{
    if (stringToShow.length > 10) {
        return [NSString stringWithFormat:@"%Le", number];

    }
    else{
        NSLog(@"%@", [NSString stringWithFormat:@"test: %.2LF", number]);
        return [NSString stringWithFormat:@"%.2LF", number];
        
    }
    return nil;
}

-(IBAction)numeralPressed:(id)sender{
    if (powerButton.on && (stringNumber.length < 11)) {
        
        if (resultIsDisplayed) {                    //the purpose of this is that if a result from an equation is showing and user
            [self clearScreen];                     //presses a number it will clear the result, but if they press an operator while
            resultIsDisplayed = NO;                 //the result is showing it will continue the calculation
        }
        
        //this will run on first number pressed and program init
        if (((stringNumber == nil) || (stringNumber == 0)) && ([sender tag] != 0)) {
            if ([sender tag] < 10) {                            //number 0-9 has been pressed, initialize with that number
                stringNumber = [[NSString alloc] initWithFormat:@"%d", [sender tag]];
            }
            else{                                               //decimal pressed first, init with decimal
                stringNumber = [[NSString alloc] initWithFormat:@"."];
            }
        }
        
        //this will run after a number has been pressed already
        else if (([sender tag] < 10) && stringNumber !=  0) {   //need to append newly pressed number onto existing number
            stringNumber = [stringNumber stringByAppendingFormat:@"%d", [sender tag]];
            }
        if ([sender tag] == 10 && (!isDecimal)) {
            stringNumber = [stringNumber stringByAppendingFormat:@"."];
            isDecimal = YES;                                    //prevent from adding another decimal to same #
        }
        else if (([sender tag] == 0) && stringNumber ==  0) {   //prevent pressing zero on zero already
            return;     //if zero is pressed on zero exit
        }
        NSLog(@"length: %d", stringNumber.length);
        screen.text = stringNumber;
    }
}

-(IBAction)operatorPressed:(id)sender{
    
    NSLog(@"Preconverted %.2LFl", currentNumber);
    currentNumber = [stringNumber doubleValue];
    NSLog(@"converted %.2LFl", currentNumber);
    
    if (resultIsDisplayed) {                                    //If the last result is displayed, turn off
        resultIsDisplayed = NO;
    }
    
    if ((currentNumber != 0) && ([sender tag] != 4)) {          //operator has been pressed (not =)
        [self setOperator:[sender tag]];                        //determine operator and append to string

        originalNumber = currentNumber;                         //store for calculation once new number is received
        operatorSelected = [sender tag];                        //store operator chosen
        infoScreen.text = stringNumber;                         //move operator + originalNumber to top label
        screen.text = @"";                                      //reset bottom label
        currentNumber = 0;                                      //reset currentNumber to receive new numbers
        stringNumber = @"";                                     //reset
        wasDecimal = isDecimal;                                 //Store if either # had decimal
        isDecimal = NO;                                         //allow decimal on new number about to be received
    }
    else{                                                       // = has been pressed
        NSLog(@"%d", operatorSelected);
        switch (operatorSelected) {
            case 0:
                //Division
                NSLog(@"%.2LFl / %.2LFl =", originalNumber, currentNumber);
                currentNumber = originalNumber / currentNumber;
                NSLog(@"%.2LFl", currentNumber);
                stringNumber = [NSString stringWithFormat:@"%.2Lf", currentNumber];
                break;
            case 1:
                //Multiplication
                currentNumber = currentNumber * originalNumber;
                stringNumber = [NSString stringWithFormat:@"%.2Lf", currentNumber];
                break;
            case 2:
                //subtraction
                currentNumber = originalNumber - currentNumber;
                stringNumber = [NSString stringWithFormat:@"%.2Lf", currentNumber];
                break;
            case 3:
                //addition
                currentNumber = currentNumber + originalNumber;
                NSLog(@"%.2LFl / %.2LFl =", originalNumber, currentNumber);
                stringNumber = [NSString stringWithFormat:@"%.2Lf", currentNumber];
                NSLog(@"%.2LFl", currentNumber);
                break;
        }
        resultIsDisplayed = YES;
        screen.text = [self displayString:[stringNumber doubleValue]
                                andString:stringNumber];       //update bottom label with result
        operatorSelected = [sender tag];                        //store operator chosen as =
        infoScreen.text = @"";                                  //reset top label
        isDecimal = ((isDecimal) || (wasDecimal));              //if either had decimal carry over to result
    }
}

-(void)setOperator: (int)sender{
    switch (sender) {
        case 0:
            //Division
            stringNumber = [stringNumber stringByAppendingString:@" ÷ "];
            NSLog(@"%@", stringNumber);
            break;
        case 1:
            //Multiplication
            stringNumber = [stringNumber stringByAppendingString:@" x "];
            NSLog(@"%@", stringNumber);
            break;
        case 2:
            //subtraction
            stringNumber = [stringNumber stringByAppendingString:@" - "];
            NSLog(@"%@ minus", stringNumber);
            break;
        case 3:
            //addition
            stringNumber = [stringNumber stringByAppendingString:@" + "];
            NSLog(@"%@", stringNumber);
            break;
    }
}

-(IBAction)clearScreen{
    currentNumber = originalNumber = 0;                              //reset each number and string
    stringNumber = @"";
    screen.text = [NSString stringWithFormat:@"%d", 0];
    infoScreen.text = @" ";
    operatorSelected = 4;
    isDecimal = NO;
}

-(IBAction)screenChange:(id)sender{
    
    if (powerButton.on) {

        if ([sender tag] == 1) {
            //modal view controller
            InfoViewController* infoView = [[InfoViewController alloc] initWithNibName:@"InfoView" bundle:nil];
            [self presentModalViewController:infoView animated:TRUE];
        }
        else{   //change color
            colorControl = (UISegmentedControl*)sender;
            int selectedIndex = colorControl.selectedSegmentIndex;
            if (selectedIndex == 0) {
                //color 1
                self.view.backgroundColor = [UIColor lightGrayColor];
            }
            else if (selectedIndex == 1){
                //color 2
            self.view.backgroundColor = [UIColor blueColor];
            }     
            else{
                //color 3
            self.view.backgroundColor = [UIColor greenColor];
            }
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    operatorSelected = 4;
    self.view.backgroundColor = [UIColor lightGrayColor];
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