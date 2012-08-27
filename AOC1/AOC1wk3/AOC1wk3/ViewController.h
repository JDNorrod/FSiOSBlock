//
//  ViewController.h
//  AOC1wk3
//
//  Created by Jonathan Norrod on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    int myAge, awesomenessLevel;
    NSString *firstName, *lastName, *convAge, *convAwesomeness;
}




-(int)addWholeNumber: (int)numA with: (int) numB;
-(BOOL)compare: (int)numA withNum: (int)numB;
-(NSMutableString*)append: (NSString*) stringA withString: (NSString*) stringB;
-(void)displayAlertWithString: (NSString*)title andMessage: (NSString*)thisMessage cancelButton: (NSString*)cancel;


@end
