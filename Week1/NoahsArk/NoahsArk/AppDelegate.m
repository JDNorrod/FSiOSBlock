//
//  AppDelegate.m
//  NoahsArk
//
//  Created by Jonathan Norrod on 7/31/12.
//  Copyright (c) 2012 Jay Norrod All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    int boatCapacity = 20;
    int animalsCaught = 0;
    bool allCaptured = NO;
    bool raining = NO;
    float hippoWidth = 5.8f;
    NSArray *loadPhrases = [NSArray arrayWithObjects:@"Picking up the animal", @"Walking to the boat...", @"Throw it...err set it in the boat", nil];

    NSLog(@"God said He's going to flood the whole earth and I have to save all the animals in a boat...");
    
    while(!allCaptured && !raining){        //loop while it's not raining AND all animals aren't yet caught
        
        int randomNum = arc4random() % 6;   //generate random number for funzies (or to determine course of action)
        if (randomNum > 0) {
            NSLog(@"I think I'll go look over there for animals... ");
            NSLog(@"Oh, here's one!  I'll take it back to the pen.");
            animalsCaught++;                                            //increment happens here, sleeping doesn't find animals
        }
        else {
            NSLog(@"I think I'll go look... in my bedroom, yeah in my room.. zzzzZZZZZzzzzz");
            NSLog(@"Uhh... didn't find any in my room, looked REAL hard too.");
        }
        
        NSLog(@"There are %d animals in the pen so far.", animalsCaught);
        
        int chanceOfRain = (arc4random() % 101) % 10;                   //10% chance each loop for rain to start
        if (chanceOfRain == 0) {
            NSLog(@"Great it started raining, GET TO THE CHOPPA!");
            raining = YES;                                              //It started raining so end the loop
        }
        else if (animalsCaught == boatCapacity) {
            NSLog(@"Well, I guess that's as many as will fit on the boat... let's load em' up.");
            allCaptured = YES;                                          //no more space on boat so end loop
        }
        else if(chanceOfRain == 1){
            NSLog(@"You were mauled by a wild animal... God had to revive you");
        }
        else {
            NSLog(@"We still have more room!  No animals get left behind!  Except for cats... cats can be left behind.");
        }
        
    }//close while loop
    if (animalsCaught > 0) {
        for (int i = 1; i <= animalsCaught; i++) {
            for (int j = 0; j < 3; j++) {
                NSLog(@"%@", [loadPhrases objectAtIndex:j]);            //iterate through nssarray for loading phrases
            }
            
            if (i == animalsCaught) {                                   //casting to int rounds down so add 1
                NSLog(@"This freaking hippo is %.2f feet wide, I'll need to widen the door to %d feet", hippoWidth, (int)hippoWidth + 1);
            }
            NSLog(@"");
            NSLog(@"%d Animals into the boat", i);
        }
    }
        
    if (raining && allCaptured) {
        NSLog(@"We got them all just in time for the rain, good job I guess.");
    }
    else if (!raining && allCaptured) {
        NSLog(@"We caught them all with time to spare, guess we should've built a bigger boat.");
    }
    else if ((raining && !allCaptured) || animalsCaught == 0) {
        NSLog(@"We are some lazy slackers... guess unicorns and dinsoaurs are screwed.");
    }
    NSLog(@"Aaaaannnnnddd.... cue the flood!");
    
    return YES; //cause that's how we roll
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
