//
//  LoginViewController.m
//  Makers UPV
//
//  Created by Pablo García-Nieto Rodríguez  on 23/4/16.
//  Copyright © 2016 makers. All rights reserved.
//

#import "LoginViewController.h"
#import "DataManager.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[DataManager sharedInstance] saveUserWithId:@"5ELnmryB2g" successBlock:^(id responseObject) {
    } failureblock:^(id responseObject) {
    }];
    
    }



@end
