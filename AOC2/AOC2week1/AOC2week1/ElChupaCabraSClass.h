//
//  ElChupaCabraSClass.h
//  AOC2week1
//
//  Created by Jonathan Norrod on 8/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MonsterClass.h"

@interface ElChupaCabraSClass : MonsterClass{
    int chickensEaten;
    NSString* threatStatement;
}

-(void)setChickensLost: (int)ageOfFarmer;
-(int)getChickensLost;
-(NSString*)chanceOfAttack: (int)population;
-(NSString*)willBeBack;

@end
