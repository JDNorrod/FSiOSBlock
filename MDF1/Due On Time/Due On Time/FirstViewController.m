//
//  FirstViewController.m
//  Due On Time
//
//  Created by Jonathan on 10/1/12.
//  Copyright (c) 2012 JDNorrod. All rights reserved.
//

#import "FirstViewController.h"
#import "TaskViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Deadlines", @"Deadlines");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        
        editButton = [[UIBarButtonItem alloc]                                   //create the nav bar edit button
                      initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                      target:self action:@selector(editTable)];
        self.navigationItem.leftBarButtonItem = editButton;                     //add the button to the nav bar
        
        addButton = [[UIBarButtonItem alloc]                                    //add the add item button, seems a bit redundant
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                      target:self action:@selector(insertNewObject:)];
        
        self.navigationItem.rightBarButtonItem = addButton;
        
        NSArray* defaultOne = [[NSArray alloc] initWithObjects:[NSDate date], @"This is a task for the future, you can change its details.", nil];
        NSArray* defaultTwo = [[NSArray alloc] initWithObjects:[NSDate date], @"This is a past due task", nil];
        
        //initialize with default dictionary and array
        dicDeadLines = [[NSMutableDictionary alloc] init];
        [dicDeadLines setObject:defaultOne forKey:@"MDF1 Week 2 Project"];         //set one object due five days from ()today
        [dicDeadLines setObject:defaultTwo forKey:@"This is a past due task"];     //set one object in the past
        
        arryDeadLinesDesc = [[NSMutableArray alloc] initWithArray:[dicDeadLines allKeys]];
        
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dicDeadLines count];                //set number of table view cells to size of the dictionary
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellID = @"deadLine";
    
    UITableViewCell* newCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (newCell == nil) {
        newCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    
    newCell.textLabel.font = [UIFont fontWithName:@"Marion" size:16];
    newCell.detailTextLabel.font = [UIFont fontWithName:@"Marion" size:10];
    
    newCell.textLabel.text = [arryDeadLinesDesc objectAtIndex:indexPath.row];           //Description is the dic key/array value
    NSArray* arrDateDetails = [dicDeadLines objectForKey:[arryDeadLinesDesc objectAtIndex:indexPath.row]];
    
    NSDateFormatter* dateFormatted = [[NSDateFormatter alloc] init];
    [dateFormatted setDateFormat:@"EEE MMM d, yyyy hh:mm a"];
    NSString* dateString = [NSString stringWithFormat:@"\n%@ \n\n", [dateFormatted stringFromDate:[arrDateDetails objectAtIndex:0]]];
    
    newCell.detailTextLabel.text = dateString;   //detail is the date in the dictionary value
    
    return newCell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [dicDeadLines removeObjectForKey:[arryDeadLinesDesc objectAtIndex:indexPath.row]];
        arryDeadLinesDesc = (NSMutableArray*)[dicDeadLines allKeys];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } 
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    TaskViewController* detailViewController = [[TaskViewController alloc] initWithNibName:@"TaskView" bundle:nil];
    detailViewController.taskDelegate = self;
    
    detailViewController.description = [arryDeadLinesDesc objectAtIndex:indexPath.row];
    NSArray* arrDateDetails = [dicDeadLines objectForKey:[arryDeadLinesDesc objectAtIndex:indexPath.row]];
    
    detailViewController.dueDate = [arrDateDetails objectAtIndex:0];
    detailViewController.details = [arrDateDetails objectAtIndex:1];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark - Custom Methods

-(void)editTable{
    
    if ([tableDueList isEditing]) {
        [tableDueList setEditing:FALSE];
    }
    else{
        [tableDueList setEditing:true];
    }
}

- (void)insertNewObject:(id)sender
{
    TaskViewController* newItemView = [[TaskViewController alloc] initWithNibName:@"TaskView" bundle:nil];
    newItemView.taskDelegate = self;
    
    [self.navigationController pushViewController:newItemView animated:YES];
}

# pragma mark - New Task Delegate

-(void)eventDidSave:(NSString*)description withDate:(NSDate*)dueDate description:(NSString*)taskDescription
{
    NSLog(@"eventDidSAve");
    NSArray* arrDateDetails = [[NSArray alloc] initWithObjects:dueDate, taskDescription, nil];
    
    if ([dicDeadLines objectForKey:description] == nil) {               //means it's a new task
        [dicDeadLines setObject:arrDateDetails forKey:description];     //add the date/details array as value
        arryDeadLinesDesc = (NSMutableArray*)[dicDeadLines allKeys];    //add description key to array
    }
    else{                                                               //task exists
        [dicDeadLines setObject:arrDateDetails forKey:description];     //update dictionary value
    }
    [tableDueList reloadData];                                          //update the table cells
}


@end
