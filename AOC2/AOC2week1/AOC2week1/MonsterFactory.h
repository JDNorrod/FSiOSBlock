//
//  MonsterFactory.h
//  AOC2week1
//
//  Created by Jonathan Norrod on 8/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MonsterClass.h"

@interface MonsterFactory : NSObject

+(MonsterClass*)createMonster: (int)type name: (NSString*)name;

@end
