//
//  BoogieManSClass.h
//  AOC2week1
//
//  Created by Jonathan Norrod on 8/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MonsterClass.h"

@interface BoogieManSClass : MonsterClass{
    int soulsCollected;
    NSString* attackStatement;
}

-(void)setSoulsCollected: (int) ageOfChild;
-(int)getSoulsCollected;
-(NSString*)chanceOfAttack: (int)population;
-(NSString*)willComeFrom;

@end
