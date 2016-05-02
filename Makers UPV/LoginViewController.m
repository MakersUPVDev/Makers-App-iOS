//
//  LoginViewController.m
//  Makers UPV
//
//  Created by Pablo García-Nieto Rodríguez  on 23/4/16.
//  Copyright © 2016 makers. All rights reserved.
//

#import "LoginViewController.h"
#import "DataManager.h"
#import <Parse/Parse.h>
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}



- (IBAction)clickLogin:(id)sender {
    [PFUser logInWithUsernameInBackground:_userField.text password:_passwordField.text
                                    block:^(PFUser *user, NSError *error) {
                if (user) {
                    
                } else {
                }
    }];

}
@end
