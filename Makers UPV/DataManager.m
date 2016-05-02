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
#import "Project.h"

@implementation DataManager

- (void) saveUserWithId:(NSString*)objectId successBlock:(void (^)(id responseObject))successBlock failureblock:(void (^)(id responseObject))failureBlock{
    
    PFQuery *query = [PFQuery queryWithClassName:@"_User"];
    [query getObjectInBackgroundWithId:objectId block:^(PFObject *user, NSError *error) {
        User* user_o = [[User alloc] initWithObject:user];
        [_realm beginWriteTransaction];
        [_realm addOrUpdateObject:user_o];
        
        NSLog(@"%@", user);
    }];
    
 //   PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    
}
-(void)getOpenProjects:(void (^)(id responseObject))successBlock failureblock:(void (^)(id responseObject))failureBlock{
    PFQuery *query = [PFQuery queryWithClassName:@"Project"];
    [query includeKey:@"creator"];
    [query includeKey:@"images"];
    [query includeKey:@"skills"];
    [query includeKey:@"members"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        [_realm beginWriteTransaction];
        for(id project in objects){
            Project* project_o = [[Project alloc] initWithObject:project];
            [_realm addOrUpdateObject:project_o];
            [project_o makeRelations:project];
   
        }
        [_realm commitWriteTransaction];
        successBlock(@YES);
    }];
    
    
}
-(void)imageWithObjectId:(NSString*)objectId andClassName:(NSString*)name andImageKey:(NSString*)key successBlock:(void (^)(id responseObject))successBlock{
    PFQuery* query = [PFQuery queryWithClassName:name];
    [query getObjectInBackgroundWithId:objectId block:^(PFObject *object, NSError *error) {
        PFFile* file = [object objectForKey:key];
        [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if (!error) {
                UIImage *image = [UIImage imageWithData:data];
                    successBlock(image);
            }
        }];

    }];
    
    
}
-(void)imagesFrom:(RLMArray<Image*>*)images successBlock:(void (^)(id responseObject))successBlock{
    NSMutableArray* imageQueries = [NSMutableArray new];
    NSMutableArray*final = [NSMutableArray new];
    for(Image* image in images){
        PFQuery *q = [PFQuery queryWithClassName:@"Image"];
        [q whereKey:@"objectId" equalTo:image.objectId];
        [imageQueries addObject:q];
    }
    PFQuery *query = [PFQuery orQueryWithSubqueries:[imageQueries copy]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error) {
        for(PFObject* result in results){
            PFFile* file = [result objectForKey:@"image"];
            [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                if (!error) {
                    UIImage *image = [UIImage imageWithData:data];
                    [final addObject:image];
                    if([final count]==[imageQueries count]){
                        successBlock(final);
                    }
                }
            }];
        }
    }];

    
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
