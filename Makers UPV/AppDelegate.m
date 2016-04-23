//
//  AppDelegate.m
//  Makers UPV
//
//  Created by Pablo García-Nieto Rodríguez  on 23/4/16.
//  Copyright © 2016 makers. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "DataManager.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [Parse initializeWithConfiguration:[ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {
        configuration.applicationId = @"MGj3CWWXtBenD6OhI4IkKIN8DcfFD8GprJmZKnw5";
        configuration.server = @"https://parseapi.back4app.com/";
        configuration.clientKey=@"03ZOM40IKIQrXVbQupsq77kreK0WcTRZcu2SvrDd";
    }]];
   
    self.window=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [LoginViewController new];
    [self.window makeKeyAndVisible];

    
    // Override point for customization after application launch.
    return YES;
}

@end
