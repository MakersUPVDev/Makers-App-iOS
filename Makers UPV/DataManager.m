//
//  DataManager.m
//  Makers UPV
//
//  Created by Pablo García-Nieto Rodríguez  on 23/4/16.
//  Copyright © 2016 makers. All rights reserved.
//

#import "DataManager.h"
#import <Parse/Parse.h>
#import "User.h"

@implementation DataManager

- (void) saveUserWithId:(NSString*)objectId successBlock:(void (^)(id responseObject))successBlock failureblock:(void (^)(id responseObject))failureBlock{
    
    PFQuery *query = [PFQuery queryWithClassName:@"_User"];
    [query getObjectInBackgroundWithId:objectId block:^(PFObject *user, NSError *error) {
        User* user_o = [[User alloc] initWithObject:user];
        [_realm beginWriteTransaction];
        [_realm addOrUpdateObject:user_o];
        [_realm commitWriteTransaction];
            
        NSLog(@"%@", user);
    }];
    
 //   PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    
}



+ (instancetype)sharedInstance
{
    static DataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DataManager alloc] init];
        sharedInstance.realm = [RLMRealm defaultRealm];
    });
    return sharedInstance;
}


@end
