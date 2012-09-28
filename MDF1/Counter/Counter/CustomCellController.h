//
//  CustomCellController.h
//  Counter
//
//  Created by Jonathan on 9/26/12.
//  Copyright (c) 2012 JDNorrod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellController : UITableViewCell
{
    IBOutlet UILabel *countDescription, *count;
}

-(void)setText:(NSString *)text withCount: (NSString*)eventCount;

@end
