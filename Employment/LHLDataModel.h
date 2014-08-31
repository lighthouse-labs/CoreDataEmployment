//
//  LHLDataModel.h
//  Employment
//
//  Created by Hirad Motamed on 2014-08-11.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface LHLDataModel : NSObject

+(instancetype)sharedModel;

@property (nonatomic, readonly) NSManagedObjectContext* mainContext;
@property (nonatomic, readonly) NSPersistentStoreCoordinator* psc;

-(NSString*)modelName;
-(NSString*)storeFilename;
-(NSString*)pathToLocalStore;

@end
