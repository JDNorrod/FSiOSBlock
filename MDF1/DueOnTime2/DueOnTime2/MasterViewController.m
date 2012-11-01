//
//  MasterViewController.m
//  DueOnTime2
//
//  Created by Jonathan on 10/31/12.
//  Copyright (c) 2012 Jay Norrod. All rights reserved.
//

#import "MasterViewController.h"
#import "NewTaskViewController.h"
#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Deadlines", @"Deadlines");
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    NewTaskViewController* newTask = [[NewTaskViewController alloc] initWithNibName:@"NewTaskViewController" bundle:nil];
    //UINavigationController* navControl = [[UINavigationController alloc] initWithRootViewController:self];
    [self.navigationController pushViewController:newTask animated:YES];
    
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }
    else return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString* cellID = @"deadLine";
    
    UITableViewCell* newCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (newCell == nil) {
        newCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    //set the default for the labels
    
    newCell.textLabel.font = [UIFont fontWithName:@"Courier-Bold" size:12.0f];
    newCell.detailTextLabel.font = [UIFont fontWithName:@"Courier" size:10.0f];
    newCell.detailTextLabel.numberOfLines = 2;
    newCell.imageView.image = [UIImage imageNamed:@"due.png"];
    
    if (indexPath.section == 0) {
        //first block, create task
        //CustomObject* thisCellInfo = [thisDiction objectForKey: [thisArray objectAtIndex: indexPath.row]];
        //newCell.textLabel.text = thisCellInfo.textLabelText;
        //newCell.detailTextLabel.text = thisCellInfo.dateAsText;
        //duplicate for each block with corresponding dictionary
        
        switch (indexPath.row) {
            case 0:
                newCell.textLabel.text = @"Read Chapters 1-2";
                newCell.detailTextLabel.text = @"Fri Nov 20, 2012 12am";
                break;
                
            case 1:
                newCell.textLabel.text = @"Questions 1-4 pg. 36";
                newCell.detailTextLabel.text = @"Sat Nov 21, 2012 9pm";
                break;
                
            default:
                break;
        }
    }
    else{
        //second block, pull from separate array
        switch (indexPath.row) {
            case 0:
                newCell.textLabel.text = @"Read Chapters 3-5";
                newCell.detailTextLabel.text = @"Fri Nov 20, 2012 12am";
                break;
                
            case 1:
                newCell.textLabel.text = @"Tab Bar Application";
                newCell.detailTextLabel.text = @"Sat Nov 21, 2012 9pm";
                break;
                
            default:
                break;
        }
    }
    
    return newCell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Finite Math";
    }
    else return @"MUX 1";
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    }
    
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
