//
//  Comment.h
//  Makers UPV
//
//  Created by Pablo García-Nieto Rodríguez  on 23/4/16.
//  Copyright © 2016 makers. All rights reserved.
//

#import <Realm/Realm.h>
#import "User.h"
#import "Project.h"
#import "CommonModel.h"
@interface Comment : CommonModel
@property Project* project;
@property User* user;
@property Comment* reply_to;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Comment>
RLM_ARRAY_TYPE(Comment)
