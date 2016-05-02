//
//  ProjectViewController.m
//  Makers UPV
//
//  Created by Pablo García-Nieto Rodríguez  on 26/4/16.
//  Copyright © 2016 makers. All rights reserved.
//

#import "ProjectsViewController.h"
#import "DataManager.h"
#import "Project.h"
#import "ProjectItemTableViewCell.h"
#import <Parse/Parse.h>
#import "SkillsViewController.h"
#import "ProjectViewController.h"

@interface ProjectsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic)RLMResults* projects;
@end

@implementation ProjectsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Proyectos";
    [self loadData];
    [[DataManager sharedInstance] getOpenProjects:^(id responseObject) {
        [self loadData];
    } failureblock:^(id responseObject) {
    }];
    
}
-(void)loadData{
    _projects = [Project allObjects];
    [_tableView reloadData];
    
}



//Table View

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 239;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath
{
    ProjectViewController*pj = [ProjectViewController new];
    pj.project = [_projects objectAtIndex:[indexPath row]];
    [self.navigationController pushViewController:pj animated:YES];
  
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_projects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"cell";
    
    ProjectItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ProjectItemTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    Project* project = [_projects objectAtIndex:[indexPath row]];
    cell.titleLabel.text = project.name;
    cell.descriptionLabel.text = project.desc;
    [cell.descriptionLabel sizeToFit];
    SkillsViewController* svc = [SkillsViewController new];
    [self addChildViewController:svc];
    svc.view.frame = CGRectMake(0, 0, cell.skillsView.frame.size.width, cell.skillsView.frame.size.height);
    [cell.skillsView addSubview:svc.view];
    svc.skills=project.skills;
    [svc didMoveToParentViewController:self];
    
   
    if([project.images count]>0){
    [[DataManager sharedInstance] imagesFrom:project.images successBlock:^(id responseObject) {
        for(id image in responseObject){
            UIImageView*imageView = [[UIImageView alloc] initWithFrame:CGRectMake(cell.scrollView.frame.size.width*([[cell.scrollView subviews] count]-2), 0, cell.scrollView.frame.size.width, cell.scrollView.frame.size.height)];
            [imageView setContentMode:UIViewContentModeScaleAspectFill];
            [cell.scrollView addSubview:imageView];
            imageView.alpha=0;
            [UIView transitionWithView:imageView
                              duration:1.0f
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{
                            imageView.image = image;
                                imageView.alpha=1;
                            } completion:nil];
            


        }
        [cell.scrollView setContentSize:CGSizeMake(cell.scrollView.frame.size.width*[project.images count], cell.scrollView.frame.size.height)];
    }];
    }
    
    return cell;
}



//
@end
