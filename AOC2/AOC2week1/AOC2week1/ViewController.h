//
//  ViewController.h
//  AOC2week1
//
//  Created by Jonathan Norrod on 8/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MonsterFactory.h"
#import "LochnessMonsterSClass.h"
#import "ElChupaCabraSClass.h"
#import "BoogieManSClass.h"


@class MonsterClass; //better for header file, just let's know it's there

@interface ViewController : UIViewController{

    
}


-(void)addLabel: (UILabel*) labelToAdd bkgColor: (UIColor*)color;

@end
