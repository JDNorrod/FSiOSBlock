//
//  MonsterClass.h
//  AOC2week1
//
//  Created by Jonathan Norrod on 8/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MonsterClass : NSObject{
    //String data member in base class
    NSString* monsterName;
    //numeric data in base class
    int notoriety;

}

//accessor
-(int)getNotoriety;
//mutator
-(void)setNotorietyLevel: (int)difference;
-(id)initWithDetails: (int)notoriousLevel name: (NSString*)name;
-(void)setName: (NSString*)newName;
-(NSString*)getName;

//calculation method, one argument, one data member -> This must differ in subclasses

@end
