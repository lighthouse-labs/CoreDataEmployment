//
//  LHLAppDelegate.m
//  Employment
//
//  Created by Hirad Motamed on 2014-08-11.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LHLAppDelegate.h"
#import <CoreData/CoreData.h>
#import "LHLDepartmentsViewController.h"

@implementation LHLAppDelegate

-(NSString*)documentsDirectory
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

-(void)setupCoreDataStack
{
    NSString* modelName = @"EmploymentModel";
    NSString* modelPath = [[NSBundle mainBundle] pathForResource:modelName ofType:@"momd"];
    NSURL* modelURL = [NSURL fileURLWithPath:modelPath];
    NSManagedObjectModel* mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    NSString* storeName = [modelName stringByAppendingPathExtension:@"sqlite"];
    NSString* storePath = [[self documentsDirectory] stringByAppendingPathComponent:storeName];
    NSURL* storeURL = [NSURL fileURLWithPath:storePath];
    
    NSError* error = nil;
    NSPersistentStoreCoordinator* psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    [psc addPersistentStoreWithType:NSSQLiteStoreType
                      configuration:nil
                                URL:storeURL
                            options:nil
                              error:&error];
    NSAssert(error == nil, @"Failed to create a persistent store.");
    
    _moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_moc setPersistentStoreCoordinator:psc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self setupCoreDataStack];
    
    UINavigationController* navController = (UINavigationController*)[self.window rootViewController];
    LHLDepartmentsViewController* departmentsController = (LHLDepartmentsViewController*)[navController topViewController];
    departmentsController.moc = self.moc;
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
