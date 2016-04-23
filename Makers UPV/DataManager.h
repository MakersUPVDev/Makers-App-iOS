//
//  DataManager.h
//  Makers UPV
//
//  Created by Pablo García-Nieto Rodríguez  on 23/4/16.
//  Copyright © 2016 makers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/RLMRealm.h>

@interface DataManager : NSObject
- (void) saveUserWithId:(NSString*)objectId successBlock:(void (^)(id responseObject))successBlock failureblock:(void (^)(id responseObject))failureBlock;

@property RLMRealm * realm;
+ (id)sharedInstance;
@end
