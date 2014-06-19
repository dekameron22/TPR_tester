//
//  ATAnswersTableViewCell.m
//  TPR_Tester
//
//  Created by Artem Tkachuk on 17.06.14.
//  Copyright (c) 2014 Artem Tkachuk. All rights reserved.
//

#import "ATAnswersTableViewCell.h"

@implementation ATAnswersTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
