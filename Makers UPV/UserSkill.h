//
//  UserSkill.h
//  Makers UPV
//
//  Created by Pablo García-Nieto Rodríguez  on 23/4/16.
//  Copyright © 2016 makers. All rights reserved.
//

#import <Realm/Realm.h>
#import "CommonModel.h"

@class User;
@class Skill;

@interface UserSkill : CommonModel
@property Skill* skill;
@property User *user;
@property NSNumber<RLMInt>* level;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<UserSkill>
RLM_ARRAY_TYPE(UserSkill)
