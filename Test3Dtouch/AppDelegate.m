//
//  AppDelegate.m
//  Test3Dtouch
//
//  Created by haoxiangfeng on 15/11/24.
//  Copyright © 2015年 artron. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "GuideViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self createItemsWithIcons];
    UIApplicationShortcutItem *item = [launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey];
    if (item) {
        NSLog(@"3D touch launched");
    } else {
        NSLog(@"3D touch not launched");
    }

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    HomeViewController *mainVC = [[HomeViewController alloc] init];
    self.navi = [[UINavigationController alloc] initWithRootViewController:mainVC];
    [self.window setRootViewController:self.navi];
    
    [self.window makeKeyAndVisible];
    
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


//3Dtouch事件
- (void)application:(UIApplication *)application
performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem
  completionHandler:(void(^)(BOOL succeeded))completionHandler{
    
     NSLog(@"according to your identification handler something");
    
    if([shortcutItem.type isEqualToString:@"com.artron.home"]){
        
        HomeViewController *homeVC = [[HomeViewController alloc] init];
        [self.navi pushViewController:homeVC animated:YES];
    
    }else if ([shortcutItem.type isEqualToString:@"com.artron.guide"]){
        
        GuideViewController *gudeVC = [[GuideViewController alloc] init];
        [self.navi pushViewController:gudeVC animated:YES];
        
    }
    
}

//create 3D touch
- (void)createItemsWithIcons {
    
    // make item icon
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"guide"];
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"collect"];
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"comment"];
    
    //make items
    UIMutableApplicationShortcutItem *item1 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.artron.guide" localizedTitle:@"guide" localizedSubtitle:@"the second item" icon:icon1 userInfo:nil];
    UIMutableApplicationShortcutItem *item2 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.test.collect" localizedTitle:@"collect something" localizedSubtitle:@"the third item" icon:icon2 userInfo:nil];
    UIMutableApplicationShortcutItem *item3 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.test.comment" localizedTitle:@"the last item" localizedSubtitle:@"make a comment" icon:icon3 userInfo:nil];
    
    // add item to an array
    NSArray *items = @[item1, item2, item3];
    
    //make new shortcutItems
    NSArray *oldItems = [UIApplication sharedApplication].shortcutItems;
    NSArray *newItems = [oldItems arrayByAddingObjectsFromArray:items];
    [UIApplication sharedApplication].shortcutItems = items;
    
    //3D touch只有在程序第一次运行的时候有效，如果想修改当前程序的item，需要mutableCopy。ShortcutItems最多显示4条item
    
    //mutableCopy make it muable
    id mutableItem = [newItems[0] mutableCopy];
    [mutableItem setLocalizedTitle: @"setting"];
    [mutableItem setLocalizedSubtitle:@"set what"];
    //get current shortcutItem list
    id currentShortcutItems = [[UIApplication sharedApplication] shortcutItems];
    id updatedShortcutItems = [currentShortcutItems mutableCopy];
    //replace
    [updatedShortcutItems replaceObjectAtIndex: 0 withObject: mutableItem];
    //set new shortcutItems
    [[UIApplication sharedApplication] setShortcutItems: updatedShortcutItems];
    
}

@end
