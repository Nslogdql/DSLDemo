//
//  AppDelegate.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/9.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    ViewController *control = [[ViewController alloc]init];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:control] ;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}



@end
