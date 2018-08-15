//
//  CoreDataHelper.h
//  FMDB-Test
//
//  Created by wangwenbo on 2018/4/10.
//  Copyright © 2018年 wangwenbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataHelper : NSObject

@property (nonatomic, readonly, strong) NSManagedObjectContext       *context;

@property (nonatomic, readonly, strong) NSManagedObjectModel         *model;

@property (nonatomic, readonly, strong) NSPersistentStoreCoordinator *coordinator;

@property (nonatomic, readonly, strong) NSPersistentStore            *store;

+ (instancetype)sharedInstance;

- (void)setupCoreData;

- (void)saveContent;

@end
