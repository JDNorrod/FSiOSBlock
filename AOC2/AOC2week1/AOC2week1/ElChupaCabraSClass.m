//
//  ElChupaCabraSClass.m
//  AOC2week1
//
//  Created by Jonathan Norrod on 8/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ElChupaCabraSClass.h"

@implementation ElChupaCabraSClass : MonsterClass


//class to override
-(NSString*)chanceOfAttack: (int)population{
    
    int result = (notoriety * population)/8;            //different formula from parent
    NSString *myString;
    
    if (result > 100000) {                              //same responses and conditions
        myString = [[NSString alloc] initWithFormat:@"This monster has too much to lose... it won't attack."];
    }
    else {
        myString = [[NSString alloc] initWithFormat:@"This monster has little to lose... it will attack."];
    }
    return myString;
}

-(void)setChickensLost: (int)ageOfFarmer{               //old people lose more chickens, that's just the way it is
    chickensEaten = ageOfFarmer / 3;
}

-(int)getChickensLost{                                  //returns the chickens lost to chupa
    return chickensEaten;
}

-(NSString*)willBeBack{
    threatStatement = @"Chupa will be back, mark my words...";
    return threatStatement;
}
@end
