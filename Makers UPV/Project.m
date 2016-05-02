//
//  Project.m
//  Makers UPV
//
//  Created by Pablo García-Nieto Rodríguez  on 23/4/16.
//  Copyright © 2016 makers. All rights reserved.
//

#import "Project.h"

@implementation Project

-(NSArray*)relations{
    return @[@{@"creator":@"User"}, @{@"images":@"Image"}, @{@"skills":@"Skill"}, @{@"members":@"User"}];
}
@end
