//
//  ViewController.m
//  AOC2week1
//
//  Created by Jonathan Norrod on 8/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "MonsterClass.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSLog(@"View did load");
    self.view.backgroundColor = [UIColor whiteColor];
    
    //create each object first
    LochnessMonsterSClass *nessie = (LochnessMonsterSClass*) [MonsterFactory createMonster:1 name:@"Nessie"];       //Incompatible pointer types mean we need to cast?
    ElChupaCabraSClass *chupa = (ElChupaCabraSClass*) [MonsterFactory createMonster:0 name:@"El Chupa Cabra"];      //need clarification on that
    BoogieManSClass *boogieMan = (BoogieManSClass*) [MonsterFactory createMonster:2 name:@"Boogie Man"];
    
    //set necessary values for each object's custom vars
    [nessie setPicIsOfLochness:4];
    [chupa setChickensLost:32];
    [boogieMan setSoulsCollected:4];
    
    //set necessary values for inherited vars
    //nessie
    [nessie setName:@"Nessie"];
    [nessie setNotorietyLevel:8];
    [nessie chanceOfAttack:60000];
    
    //chupa
    [chupa setName:@"Chupa Cabra"];
    [chupa setNotorietyLevel:4];
    [chupa chanceOfAttack:2500];
    
    //boogie
    [boogieMan setName:@"Boogie Man"];
    [boogieMan setNotorietyLevel:10];
    [boogieMan chanceOfAttack:500000];
    
    float yPos = 5.0f;                                                                                              //easy way to change y position of labels
    
    //show Nessie inherited label info
    UILabel* nessieLabel = [[UILabel alloc] initWithFrame:  CGRectMake(0.0f, yPos, 320.0f, 70.0f)];                   //displays inherited values
    UILabel* nessieLabel2 = [[UILabel alloc] initWithFrame: CGRectMake(0.0f, (yPos += 65),320.0f, 50.0f)];          //displays custom values/method
    nessieLabel.text = [NSString stringWithFormat:@"%@, notoriety: %d, Threat: %@", [nessie getName], [nessie getNotoriety], [nessie chanceOfAttack:60000]];
    nessieLabel2.text = [NSString stringWithFormat:@"%@ Valid Photo = %@", [nessie didEatBaby], [nessie getPicIsOfLochness]];
    [self.view addSubview:nessieLabel];
    
    //show chupa inherited label info
    UILabel* chupaLabel = [[UILabel alloc] initWithFrame:   CGRectMake(0.0f, (yPos += 65),320.0f, 50.0f)];           //displays inherited values
    UILabel* chupaLabel2 = [[UILabel alloc] initWithFrame:  CGRectMake(0.0f, (yPos += 50),320.0f, 50.0f)];          //displays custom values/method
    chupaLabel.text = [NSString stringWithFormat:@"%@, notoriety: %d, Threat: %@", [chupa getName], [chupa getNotoriety], [chupa chanceOfAttack:2500]];
    chupaLabel2.text = [NSString stringWithFormat:@"%@ Chickens Lost = %d", [chupa willBeBack], [chupa getChickensLost]];
    
    //show boogie inherited label info
    UILabel* boogieLabel = [[UILabel alloc] initWithFrame:  CGRectMake(0.0f, (yPos += 65),320.0f, 50.0f)];           //displays inherited values
    UILabel* boogieLabel2 = [[UILabel alloc] initWithFrame: CGRectMake(0.0f, (yPos += 50),320.0f, 50.0f)];          //displays custom values/method
    boogieLabel.text = [NSString stringWithFormat:@"%@, notoriety: %d, Threat: %@", [boogieMan getName], [boogieMan getNotoriety], [boogieMan chanceOfAttack:500000]];
    boogieLabel2.text = [NSString stringWithFormat:@"%@ Souls Eaten = %d", [boogieMan willComeFrom], [boogieMan getSoulsCollected]];
    
    //add all labels to view
    [self addLabel:nessieLabel bkgColor:[UIColor darkGrayColor]];
    [self addLabel:nessieLabel2 bkgColor:[UIColor darkGrayColor]];
    [self addLabel:chupaLabel bkgColor:[UIColor lightGrayColor]];
    [self addLabel:chupaLabel2 bkgColor:[UIColor lightGrayColor]];
    [self addLabel:boogieLabel bkgColor:[UIColor magentaColor]];
    [self addLabel:boogieLabel2 bkgColor:[UIColor magentaColor]];
}

-(void)addLabel: (UILabel*) labelToAdd bkgColor: (UIColor*)color{
    labelToAdd.backgroundColor = color;
    labelToAdd.numberOfLines = 3;
    [self.view addSubview:labelToAdd];
    
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
