//next step is to presentModelview when a selection is made.
//
//  ViewController.m
//  Epic Counter
//
//  Created by Jay Norrod on 9/15/12.
//  Copyright (c) 2012 JDNorrod. All rights reserved.
//

#import "ViewController.h"
#import "CounterViewController.h"
#import "CustomCellController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    totalCount = 0;
    eventListString = @"";
    isEditing = false;
    [tableViewEvents reloadData];
    
    countObjects = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < 20; i++) {
        [countObjects setObject:[NSString stringWithFormat:@"%d", i] forKey:[NSString stringWithFormat:@"%d", i]];
    }
    
    descriptionArray = [[NSMutableArray alloc] initWithArray:[countObjects allKeys]];
    [tableViewEvents reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark Table View


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@", [descriptionArray objectAtIndex:indexPath.row]);
    
    //set up counter view
    CounterViewController* detailedView = [[CounterViewController alloc]
                                           initWithNibName:@"counterView" bundle:nil];
    
    NSString* numberString =                                                    //use string to set to integer
    [countObjects objectForKey:[descriptionArray objectAtIndex:indexPath.row]]; //set count from selected cell
    detailedView.counter = [numberString intValue];
    detailedView.descriptionText = [descriptionArray                            //set description from selected cell
                                    objectAtIndex:indexPath.row];
    detailedView.overwriteOnReturn = YES;
    
    [self presentModalViewController:detailedView animated:TRUE];               //launch new view
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [countObjects count];
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellID = @"cell";
    
    CustomCellController* newCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (newCell == nil) {
        NSArray* cellViews = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:nil options:nil];
        for (UIView* view in cellViews){
            if ([view isKindOfClass:[CustomCellController class]]) {
                newCell = (CustomCellController*)view;
            }
        }
    }
    
    
    descriptionArray = (NSMutableArray*)[countObjects allKeys];                                     //use array for indexing keys
    
    [newCell setText:[descriptionArray objectAtIndex:indexPath.row]                                 //header set to key
           withCount:[countObjects objectForKey:[descriptionArray objectAtIndex:indexPath.row]]];   //number count is in the value
    
    return newCell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //delete from dictionary and tableView
    [countObjects removeObjectForKey:[descriptionArray objectAtIndex:indexPath.row]];               //remove from dictionary first using array
    
    [tableViewEvents deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]                     //remove from tableView
                           withRowAnimation:TRUE];
}

#pragma mark -
#pragma mark Delegates

-(void)eventDidSave:(NSString*)description withCount: (int) myNum shouldOverwrite:(BOOL)response
{
    [countObjects setObject:[NSString stringWithFormat:@"%d", myNum] forKey:description];   //add the event to the dictionary and array
    descriptionArray = (NSMutableArray*)[countObjects allKeys];
    
    totalCount += myNum;                                                                    //update new count
    totalCountLabel.text = [NSString stringWithFormat:@"Total Count = %d", totalCount];     //display new count
    [tableViewEvents reloadData];
}

#pragma mark -
#pragma mark Custom Methods
-(IBAction)onClick:(id)sender
{
    if ([sender tag] == 0) {
        //set up counter view
        addCountView = [[CounterViewController alloc]
                        initWithNibName:@"counterView" bundle:nil];
        
        addCountView.countDelegate = self;              //assign my delegate to viewController
        [self presentModalViewController:addCountView animated:TRUE];
        if (isEditing) {                                //check to see if editing is currently undergoing
            [tableViewEvents setEditing:FALSE];         //Remove delete buttons on tableview cells
            editButton.title = @"Edit";                 //change button text
            isEditing = FALSE;                          //change isEditing to reflect editing is off
        }
    }
    else{
        if (!isEditing) {                               //check to see if editing is currently undergoing
            [tableViewEvents setEditing:TRUE];          //present delete buttons on tableview cells
            editButton.title = @"Done";                 //change button text
            isEditing = TRUE;                           //change isEditing to reflect editing is on
        }
        else{
            editButton.title = @"Edit";                 //change button text back
            [tableViewEvents setEditing:FALSE];         //remove editing
            isEditing = FALSE;                          //revert condition to show not editing
        }
    }
}

@end