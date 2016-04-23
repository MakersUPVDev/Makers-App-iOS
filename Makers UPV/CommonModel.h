//
//  CommonModel.h
//  Makers UPV
//
//  Created by Pablo García-Nieto Rodríguez  on 23/4/16.
//  Copyright © 2016 makers. All rights reserved.
//

#import <Realm/Realm.h>

@interface CommonModel : RLMObject
@property NSString* objectId;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<CommonModel>
RLM_ARRAY_TYPE(CommonModel)
