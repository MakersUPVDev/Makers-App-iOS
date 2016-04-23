//
//  CommonModel.m
//  Makers UPV
//
//  Created by Pablo García-Nieto Rodríguez  on 23/4/16.
//  Copyright © 2016 makers. All rights reserved.
//

#import "CommonModel.h"
#import <Parse/PFObject.h>
#import <Parse/PFRelation.h>
#import <Parse/PFACL.h>

@implementation CommonModel

+ (NSString *)primaryKey {
    return @"objectId";
}



-(instancetype)initWithObject:(PFObject*)object{
    self = [super init];
    self.objectId = object.objectId;
    
    for(id key in [object allKeys]){
        if([[object objectForKey:key] class]==[PFRelation class] || [[object objectForKey:key] class]==[PFACL class]){
            
        }else{
            [self setValue:[object objectForKey:key] forKey:key];
        }
    }
    
    return self;
    
}
@end
