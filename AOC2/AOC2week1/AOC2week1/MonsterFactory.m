//
//  MonsterFactory.m
//  AOC2week1
//
//  Created by Jonathan Norrod on 8/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MonsterFactory.h"
#import "LochnessMonsterSClass.h"
#import "ElChupaCabraSClass.h"
#import "BoogieManSClass.h"

@implementation MonsterFactory

+(MonsterClass*)createMonster: (int)type name: (NSString*)name{
    
    //created using initWithDetails using default values and will use setter/getters later
    
    if (type == 0) {
        //return El Chupa Cabra
        return [[ElChupaCabraSClass alloc] initWithDetails:0 name:@"Monster"];
    }
    else if (type == 1) {
        //return Lochness monster
        return [[LochnessMonsterSClass alloc] initWithDetails:0 name:@"Monster"];
    }
    else if (type == 2) {
        //return Boogie Man
        return [[BoogieManSClass alloc] initWithDetails:0 name:@"Monster"];
    }
    return nil;
}

@end
