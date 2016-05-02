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

#import "User.h"


@implementation CommonModel


+ (NSString *)primaryKey {
    return @"objectId";
}
-(NSArray*)relations{
    return @[];
}
-(NSArray*)exclude{
    return @[];
}
-(void)makeRelations:(PFObject*)object{
    for(id relation in [self relations]){
        NSArray *keys = [relation allKeys];
        NSArray *vals = [relation allValues];
        Class class = NSClassFromString([vals objectAtIndex:0]);
        if([object objectForKey:[keys objectAtIndex:0]]!=nil){
            if([[object objectForKey:[keys objectAtIndex:0]] isKindOfClass:[NSArray class]]){
                for(id r in [object objectForKey:[keys objectAtIndex:0]]){
                    id obj = [self getInstanceWithClass:class andObject:r];
                    [[self valueForKey:[keys objectAtIndex:0]] addObject:obj];
                    [obj makeRelations:r];
                }
        
            
        }else{
            CommonModel* obj = [self getInstanceWithClass:class andObject:[object objectForKey:[keys objectAtIndex:0]]];
            [self setValue:obj forKey:[keys objectAtIndex:0]];
            [obj makeRelations:[object objectForKey:[keys objectAtIndex:0]]];
        }
        }
    }
}
-(id)getInstanceWithClass:(Class)class andObject:(PFObject*)object{
    RLMObject* rlm_obj = [class objectForPrimaryKey:object.objectId];
    if(rlm_obj==nil){
        id obj = [[class alloc] initWithObject:object];
        return obj;
    }else{
        [self setKeysWithObject:object toInstance:rlm_obj];
    }
    return rlm_obj;
      

}
-(instancetype)initWithObject:(PFObject*)object{
    self = [super init];
    NSLog(@"Initializing %@", [self class]);
    self.objectId = object.objectId;
    [self setKeysWithObject:object toInstance:self];
    return self;

}
-(void)setKeysWithObject:(PFObject*)object toInstance:(CommonModel*)instance{
    for(id key in [object allKeys]){
        if([[object objectForKey:key] class]==[PFRelation class] || [[object objectForKey:key] class]==[PFACL class] || [[object objectForKey:key] class]==[PFUser class] || [[object objectForKey:key] isKindOfClass:[NSArray class]] || [[instance exclude] containsObject:key]){
            
        }else{
            if([instance respondsToSelector:NSSelectorFromString(key)]){
                if(![key isEqualToString:@"description"]){
                    [instance setValue:[object objectForKey:key] forKey:key];
                }else{
                    [instance setValue:[object objectForKey:key] forKey:@"desc"];
                }
            }
        }
    }
    
    
}
@end
