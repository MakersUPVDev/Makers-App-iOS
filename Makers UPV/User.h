//
//  User.h
//  Makers UPV
//
//  Created by Pablo García-Nieto Rodríguez  on 23/4/16.
//  Copyright © 2016 makers. All rights reserved.
//

#import <Realm/Realm.h>
#import "Image.h"
#import "UserSkill.h"
#import <Parse/PFObject.h>
#import "CommonModel.h"

@class UserSkill;
@interface User : CommonModel
@property NSString* email;
@property NSDate* birthdate;
@property NSString* name;
@property NSString* username;
@property NSString* surname;
@property Image* avatar;
@property NSDate* register_date;
@property NSString* degree;
@property NSString* interests;
@property NSDate* last_access;
@property BOOL active;
@property RLMArray<UserSkill *><UserSkill> *skills;


@end

// This protocol enables typed collections. i.e.:
// RLMArray<User>
RLM_ARRAY_TYPE(User)
