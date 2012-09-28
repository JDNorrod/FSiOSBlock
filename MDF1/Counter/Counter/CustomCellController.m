//
//  CustomCellController.m
//  Counter
//
//  Created by Jonathan on 9/26/12.
//  Copyright (c) 2012 JDNorrod. All rights reserved.
//

#import "CustomCellController.h"

@implementation CustomCellController

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setText:(NSString *)descriptionText withCount: (NSString *)eventCount
{
    countDescription.text = descriptionText;
    count.text = eventCount;
}

@end
