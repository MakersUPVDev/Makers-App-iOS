//
//  DataManager.h
//  Makers UPV
//
//  Created by Pablo García-Nieto Rodríguez  on 23/4/16.
//  Copyright © 2016 makers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "Image.h"


@interface DataManager : NSObject
- (void) saveUserWithId:(NSString*)objectId successBlock:(void (^)(id responseObject))successBlock failureblock:(void (^)(id responseObject))failureBlock;

-(void)getOpenProjects:(void (^)(id responseObject))successBlock failureblock:(void (^)(id responseObject))failureBlock;

-(void)imagesFrom:(RLMArray<Image*>*)images successBlock:(void (^)(id responseObject))successBlock;

-(void)imageWithObjectId:(NSString*)objectId andClassName:(NSString*)name andImageKey:(NSString*)key successBlock:(void (^)(id responseObject))successBlock;


@property RLMRealm * realm;
+ (id)sharedInstance;
@end
