//
//  BoogieManSClass.m
//  AOC2week1
//
//  Created by Jonathan Norrod on 8/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoogieManSClass.h"
#import "MonsterClass.h"

@implementation BoogieManSClass : MonsterClass


//class to override
-(NSString*)chanceOfAttack: (int)population{
    
    NSString* myString = [[NSString alloc] initWithFormat:@"The Boogie Man comes tonight for your soul!"];
    return myString;
}

-(void)setSoulsCollected: (int) ageOfChild{
    soulsCollected = (1/(float)ageOfChild) * 100;                      //the younger the child, the more souls collected
}

-(int)getSoulsCollected{
    return soulsCollected;
}

-(NSString*)willComeFrom{
    attackStatement = @"He comes from EVERYWHERE!";
    return attackStatement;
}

@end
