//
//  SkillsViewController.h
//  Makers UPV
//
//  Created by Pablo García-Nieto Rodríguez  on 1/5/16.
//  Copyright © 2016 makers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Realm/Realm.h"
#import "Skill.h"

@interface SkillsViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property(strong, nonatomic)RLMArray<Skill*> *skills;

@end
