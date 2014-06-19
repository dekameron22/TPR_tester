//
//  ATMainQuestionTableViewCell.h
//  TPR_Tester
//
//  Created by Artem Tkachuk on 17.06.14.
//  Copyright (c) 2014 Artem Tkachuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATMainQuestionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answered;

@end
