//
//  Skill.h
//  Makers UPV
//
//  Created by Pablo García-Nieto Rodríguez  on 23/4/16.
//  Copyright © 2016 makers. All rights reserved.
//

#import <Realm/Realm.h>
#import "CommonModel.h"
@class Image;

@interface Skill : CommonModel
@property NSString* name;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Skill>
RLM_ARRAY_TYPE(Skill)
