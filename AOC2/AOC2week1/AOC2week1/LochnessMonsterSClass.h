//
//  LochnessMonsterSClass.h
//  AOC2week1
//
//  Created by Jonathan Norrod on 8/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MonsterClass.h"

@interface LochnessMonsterSClass : MonsterClass{
    BOOL caughtOnTape;
    NSString *myString;
    NSString* didEatBaby;
}

-(void)setPicIsOfLochness: (int) numOfPics;
-(NSString*)getPicIsOfLochness;
-(NSString*)chanceOfAttack: (int)population;
-(NSString*)didEatBaby;

@end
