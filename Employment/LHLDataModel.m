//
//  LHLDataModel.m
//  Employment
//
//  Created by Hirad Motamed on 2014-08-11.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LHLDataModel.h"

@interface LHLDataModel ()

@property (nonatomic, readwrite) NSManagedObjectContext* mainContext;
@property (nonatomic, readwrite) NSPersistentStoreCoordinator* psc;
@property (nonatomic, strong) NSManagedObjectModel* managedObjectModel;

@end

@implementation LHLDataModel

+(instancetype)sharedModel
{
    static LHLDataModel* __instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __instance = [[LHLDataModel alloc] init];
    });
    
    return __instance;
}

-(NSString *)pathToLocalStore
{
    NSString* documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [documentsDirectory stringByAppendingPathComponent:[self storeFilename]];
}

-(NSString*)storeFilename
{
    return [[self modelName] stringByAppendingPathExtension:@"sqlite"];
}

-(NSString *)modelName
{
    return @"EmploymentDataModel";
}

-(NSManagedObjectContext *)mainContext
{
    if (_mainContext == nil) {
        _mainContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        _mainContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    }
    return _mainContext;
}

-(NSManagedObjectModel*)managedObjectModel
{
    if (_managedObjectModel == nil) {
        NSString* modelPath = [[NSBundle mainBundle] pathForResource:[self modelName]
                                                              ofType:@"momd"];
        NSURL* modelURL = [NSURL fileURLWithPath:modelPath];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    }
    
    return _managedObjectModel;
}

-(NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_psc == nil) {
        _psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        NSURL* storeURL = [NSURL fileURLWithPath:[self pathToLocalStore]];
        NSError* error = nil;
        if (![_psc addPersistentStoreWithType:NSSQLiteStoreType
                                configuration:nil
                                          URL:storeURL
                                      options:@{NSMigratePersistentStoresAutomaticallyOption: @YES, NSInferMappingModelAutomaticallyOption: @YES}
                                        error:&error]) {
            NSLog(@"MAJOR ERROR: Could not create persistent store: %@; %@",
                  [error localizedDescription], [error userInfo]);
        }
    }
    return _psc;
}

@end
