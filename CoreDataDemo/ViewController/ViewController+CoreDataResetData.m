//
//  ViewController+CoreDataResetData.m
//  CoreDataDemo
//
//  Created by wangwenbo on 2018/7/7.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import "ViewController+CoreDataResetData.h"
#import "CoreDataHelper.h"

@implementation ViewController (CoreDataResetData)

- (void)firstInsert {
    NSDate *currentDate = [NSDate date];
    for (int i = 0; i < 5; i++) {
        A_Monday *mondayModel = [NSEntityDescription insertNewObjectForEntityForName:@"A_Monday"
                                                        inManagedObjectContext:[CoreDataHelper sharedInstance].context];
        mondayModel.intType = i;
        mondayModel.stringType = [NSString stringWithFormat:@"Moday First Insert %d",i];
        mondayModel.dateType = [currentDate dateByAddingTimeInterval:10 * i];
        
        B_Tuesday *tuesdayModel = [NSEntityDescription insertNewObjectForEntityForName:@"B_Tuesday"
                                                        inManagedObjectContext:[CoreDataHelper sharedInstance].context];
        tuesdayModel.intType = i;
        tuesdayModel.stringType = [NSString stringWithFormat:@"Tuesday First Insert %d",i];
        tuesdayModel.dateType = [currentDate dateByAddingTimeInterval:10 * i];
        
        [[CoreDataHelper sharedInstance] saveContent];
    }
}

- (void)secondInsert {
    NSDate *currentDate = [NSDate date];
    for (int i = 0; i < 5; i++) {
        A_Monday *mondayModel = [NSEntityDescription insertNewObjectForEntityForName:@"A_Monday"
                                                              inManagedObjectContext:[CoreDataHelper sharedInstance].context];
        mondayModel.intType = i;
        mondayModel.stringType = [NSString stringWithFormat:@"Moday Second Insert %d",i];
        mondayModel.dateType = [currentDate dateByAddingTimeInterval:10 * i];
        
        B_Tuesday *tuesdayModel = [NSEntityDescription insertNewObjectForEntityForName:@"B_Tuesday"
                                                                inManagedObjectContext:[CoreDataHelper sharedInstance].context];
        tuesdayModel.intType = i;
        tuesdayModel.stringType = [NSString stringWithFormat:@"Tuesday Second Insert %d",i];
        tuesdayModel.dateType = [currentDate dateByAddingTimeInterval:10 * i];
        
        [[CoreDataHelper sharedInstance] saveContent];
    }
}

- (NSArray<A_Monday *> *)fetchRequestForMondayNoBoolType {
    NSError *error;
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"A_Monday"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"dateType" ascending:NO]];
    NSArray<A_Monday *> *fetchedObjects = [[CoreDataHelper sharedInstance].context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"fetchRequest Monday error:%@",error);
    }
    return fetchedObjects;
}

- (NSArray<B_Tuesday *> *)fetchRequestForTuesdayNoBoolType {
    NSError *error;
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"B_Tuesday"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"dateType" ascending:NO]];
    NSArray<B_Tuesday *> *fetchedObjects = [[CoreDataHelper sharedInstance].context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"fetchRequest Tuesday error:%@",error);
    }
    return fetchedObjects;
}

- (NSArray<A_Monday *> *)fetchRequestForMonday {
    NSError *error;
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"A_Monday"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"boolType" ascending:NO],
                                     [NSSortDescriptor sortDescriptorWithKey:@"dateType" ascending:NO]];
    NSArray<A_Monday *> *fetchedObjects = [[CoreDataHelper sharedInstance].context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"fetchRequest Monday error:%@",error);
    }
    return fetchedObjects;
}

- (NSArray<B_Tuesday *> *)fetchRequestForTuesday {
    NSError *error;
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"B_Tuesday"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"boolType" ascending:NO],
                                     [NSSortDescriptor sortDescriptorWithKey:@"dateType" ascending:NO]];
    NSArray<B_Tuesday *> *fetchedObjects = [[CoreDataHelper sharedInstance].context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"fetchRequest Tuesday error:%@",error);
    }
    return fetchedObjects;
}

@end
