//
//  SkillsViewController.m
//  Makers UPV
//
//  Created by Pablo García-Nieto Rodríguez  on 1/5/16.
//  Copyright © 2016 makers. All rights reserved.
//

#import "SkillsViewController.h"
#import "SkillCollectionViewCell.h"
#import "DataManager.h"

@interface SkillsViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation SkillsViewController

-(void)setSkills:(RLMArray<Skill> *)skills{
    _skills=skills;
    [self.collectionView reloadData];
}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(50, 50);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[SkillCollectionViewCell class] forCellWithReuseIdentifier:@"CellId"];
    UINib *cellNib = [UINib nibWithNibName:@"SkillCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"CellId"];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flow.minimumInteritemSpacing = 0;
    flow.minimumLineSpacing = 0;
    
    // Register cell classes
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_skills count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SkillCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellId" forIndexPath:indexPath];
    Skill* skill = [_skills objectAtIndex:[indexPath row]];
    [[DataManager sharedInstance] imageWithObjectId:skill.objectId andClassName:@"Skill" andImageKey:@"icon" successBlock:^(id responseObject) {
        cell.imageView.image = responseObject;
    }];
    /*
    [[DataManager sharedInstance] imagesFrom:@[skill.icon] successBlock:^(id responseObject) {
        cell.imageView.image=[responseObject objectAtIndex:0];
    }];
     */
    return cell;
}

@end
