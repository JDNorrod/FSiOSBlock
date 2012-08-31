//
//  LochnessMonsterSClass.m
//  AOC2week1
//
//  Created by Jonathan Norrod on 8/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LochnessMonsterSClass.h"


@implementation LochnessMonsterSClass : MonsterClass


//class to override
-(NSString*)getChanceOfAttack{
    
    return myString;
}

-(NSString*)chanceOfAttack: (int)population{
    
    int result = (notoriety * population)/2;            //same formula as parent class
    
    if (result > 4) {                                   //different conditions from parent
        myString = [[NSString alloc] initWithFormat:@"Lochness Monster has too much to lose... it won't attack."];
    }
    else {                                              //different response from parent
        myString = [[NSString alloc] initWithFormat:@"Lochness Monster will eat you all!"];
    }
    return myString;
}

-(NSString*)getPicIsOfLochness{

    if (caughtOnTape) {
        return @"Yes";
    }
    else {
        return @"No";
    }
}

-(void)setPicIsOfLochness: (int)numOfPics{                 //if numpics < 3 it was nessie otherwise no
    
    if(numOfPics < 3){
        caughtOnTape = YES;
    }
    else {
        caughtOnTape = NO;
    }
}

-(NSString*)didEatBaby{
    didEatBaby = @"Lochness ate your baby, no refunds.";
    return didEatBaby;
}

@end
