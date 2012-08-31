//
//  MonsterClass.m
//  AOC2week1
//
//  Created by Jonathan Norrod on 8/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MonsterClass.h"

@implementation MonsterClass


-(id)initWithDetails: (int)notoriousLevel name: (NSString*)name{
    
    if (self = [super init]) {
        
    notoriety = notoriousLevel;
    monsterName  = name;
    }
    return self;
}

//accessor
-(int)getNotoriety{
    return notoriety;
}
//mutator
-(void)setNotorietyLevel: (int)difference{
    notoriety += difference;
}

-(NSString*)getName{
    return monsterName;
}

-(void)setName: (NSString*)newName{
    monsterName = newName;
}

//class to override
-(NSString*)chanceOfAttack: (int)population{

    int result = (notoriety * population)/2;
    NSString *myString;
    
    if (result > 100000) {
        myString = [[NSString alloc] initWithFormat:@"This monster has too much to lose... it won't attack."];
    }
    else {
        myString = [[NSString alloc] initWithFormat:@"This monster has little to lose... it will attack."];
    }
    return myString;
}

@end