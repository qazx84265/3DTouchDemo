//
//  AppDelegate.m
//  iOS3DTouchDemo
//
//  Created by 123 on 16/4/21.
//  Copyright © 2016年 com.pureLake. All rights reserved.
//

#import "AppDelegate.h"
#import "SubViewController.h"

const NSString* item1 = @"item1";
const NSString* item2 = @"item2";
const NSString* item3 = @"item3";


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*-- home screen shortcut items --*/
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {
        
        if (application.shortcutItems.count == 0) {
            
            UIApplicationShortcutItem *it1 = [[UIApplicationShortcutItem alloc] initWithType:@"item1" localizedTitle:@"Item1" localizedSubtitle:@"Item1 desc" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypePlay] userInfo:nil];
            UIApplicationShortcutItem *it2 = [[UIApplicationShortcutItem alloc] initWithType:@"item2" localizedTitle:@"Item2" localizedSubtitle:@"Item2 desc" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypePause] userInfo:nil];
            UIApplicationShortcutItem *it3 = [[UIApplicationShortcutItem alloc] initWithType:@"item3" localizedTitle:@"Item3" localizedSubtitle:@"Item3 desc" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch] userInfo:nil];
            [[UIApplication sharedApplication] setShortcutItems:@[it1, it2, it3]];
        }
        
    }
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark -- shortcut items callbacks
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    UINavigationController *nav = (UINavigationController*)application.keyWindow.rootViewController;
    SubViewController *svc = [[SubViewController alloc] init];
    svc.navTitle = shortcutItem.type;
    
    [nav pushViewController:svc animated:YES];
    
}


@end
