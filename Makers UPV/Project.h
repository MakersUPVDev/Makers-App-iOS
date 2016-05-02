//
//  Project.h
//  Makers UPV
//
//  Created by Pablo García-Nieto Rodríguez  on 23/4/16.
//  Copyright © 2016 makers. All rights reserved.
//

#import <Realm/Realm.h>
#import "User.h"
#import "Skill.h"
#import "Image.h"
#import "CommonModel.h"

@interface Project : CommonModel
@property NSString* name;
@property User* creator;
@property NSDate* date_end_join;
@property NSNumber<RLMInt>* duration;
@property RLMArray<Skill>* skills;
@property NSNumber<RLMInt>* members_limit;
@property RLMArray<Image>* images;
@property RLMArray<User>* members;
@property NSString* video;
@property NSString* desc;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Project>
RLM_ARRAY_TYPE(Project)
