//
//  NewTaskViewController.m
//  DueOnTime2
//
//  Created by Jonathan on 10/31/12.
//  Copyright (c) 2012 Jay Norrod. All rights reserved.
//

#import "NewTaskViewController.h"

@interface NewTaskViewController ()

@end

@implementation NewTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)returnToMaster
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonSystemItemDone target:self action:@selector(returnToMaster)];
    self.navigationItem.rightBarButtonItem = saveButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
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
    newCell.textLabel.font = [UIFont fontWithName:@"System Bold" size:20.0f];
    
    if (indexPath.section == 0) {
        //first block, create task
        switch (indexPath.row) {
            case 0:
                newCell.textLabel.text = @"Name";
                break;
                
            case 1:
                newCell.textLabel.text = @"Questions 1-4";
                break;
                
            default:
                break;
        }
    }
    else{
        //second block 
        
    }

    return newCell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"New Deadline";
    }
    else return @"Checklist";
}

@end
