//
//  CoreDataHelper.m
//  FMDB-Test
//
//  Created by wangwenbo on 2018/4/10.
//  Copyright © 2018年 wangwenbo. All rights reserved.
//

#import "CoreDataHelper.h"

@implementation CoreDataHelper

+ (instancetype)sharedInstance {
    static CoreDataHelper *coreDataHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        coreDataHelper = [[CoreDataHelper alloc] init];
        [coreDataHelper setupCoreData];
    });
    return coreDataHelper;
}

#define debug 1

#pragma mark - Files
NSString *storeFileName = @"CoreDataDemo.sqlite";

#pragma mark - Paths
- (NSString *)applicationDocumentDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

- (NSURL *)applicationStoresDirectory {
    NSURL *storesDirectory = [[NSURL fileURLWithPath:[self applicationDocumentDirectory]] URLByAppendingPathComponent:@"Stores"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:[storesDirectory path]]) {
        NSError *error = nil;
        [fileManager createDirectoryAtURL:storesDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    }
    NSLog(@"%@",storesDirectory);
    return storesDirectory;
}

- (NSURL *)storeUrl {
    return [[self applicationStoresDirectory] URLByAppendingPathComponent:storeFileName];
}

#pragma mark - Setup
- (id)init {
    self = [super init];
    if (!self) { return nil; }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataDemo" withExtension:@"momd"];
    _model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    _coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
    _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_context setPersistentStoreCoordinator:_coordinator];
    return self;
}

- (void)loadStore {
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:@(YES), NSMigratePersistentStoresAutomaticallyOption, @(YES), NSInferMappingModelAutomaticallyOption, nil];
    
    NSError *error = nil;
    _store = [_coordinator addPersistentStoreWithType:NSSQLiteStoreType
                                        configuration:nil
                                                  URL:[self storeUrl]
                                              options:options
                                                error:&error];
    if (!_store) {
        NSLog(@"%@",error);
    }
}

- (void)setupCoreData {
    [self loadStore];
}

#pragma mark - Saveing
- (void)saveContent {
    if ([_context hasChanges]) {
        NSError *error = nil;
        if ([_context save:&error]) {
//            NSLog(@"success");
        } else {
            NSLog(@"%@",error);
            abort();
        }
    } else {
        NSLog(@"has no change");
    }
}

@end
