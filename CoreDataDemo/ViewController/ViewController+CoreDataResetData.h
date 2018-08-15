//
//  ViewController+CoreDataResetData.h
//  CoreDataDemo
//
//  Created by wangwenbo on 2018/7/7.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import "ViewController.h"
#import "A_Monday+CoreDataProperties.h"
#import "B_Tuesday+CoreDataProperties.h"
#import "C_Wednesday+CoreDataProperties.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewController (CoreDataResetData)

- (void)firstInsert;
- (void)secondInsert;

- (NSArray<A_Monday *> *)fetchRequestForMondayNoBoolType;
- (NSArray<B_Tuesday *> *)fetchRequestForTuesdayNoBoolType;

- (NSArray<A_Monday *> *)fetchRequestForMonday;
- (NSArray<B_Tuesday *> *)fetchRequestForTuesday;

@end

NS_ASSUME_NONNULL_END
