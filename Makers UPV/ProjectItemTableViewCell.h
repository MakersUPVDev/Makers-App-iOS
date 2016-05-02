//
//  ProjectItemTableViewCell.h
//  Makers UPV
//
//  Created by Pablo García-Nieto Rodríguez  on 27/4/16.
//  Copyright © 2016 makers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectItemTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *skillsView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
