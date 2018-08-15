//
//  ViewController.m
//  CoreDataDemo
//
//  Created by wangwenbo on 2018/7/6.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataHelper.h"
#import "TableView.h"
#import "ViewController+CoreDataResetData.h"

@interface ViewController ()

@property (nonatomic, strong) TableView *mondayTableView;
@property (nonatomic, strong) TableView *tuesdayTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    __weak typeof(self) weakSelf = self;
    [CoreDataHelper sharedInstance];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    self.mondayTableView = [[TableView alloc] initWithFrame:CGRectMake(0, 20, screenWidth / 2, screenHeight - 20)];
    self.mondayTableView.didChangeBoolTypeToNo = ^{
        [weakSelf reloadTableView];
    };
    [self.view addSubview:self.mondayTableView];
    
    self.tuesdayTableView = [[TableView alloc] initWithFrame:CGRectMake(screenWidth / 2, 20, screenWidth / 2, screenHeight - 20)];
    self.tuesdayTableView.didChangeBoolTypeToNo = ^{
        [weakSelf reloadTableView];
    };
    [self.view addSubview:self.tuesdayTableView];
    
//    [self firstInsert];
    [self secondInsert];
    
    [self reloadTableView];
}

- (void)reloadTableView {
    self.mondayTableView.modelArray = [self fetchRequestForMondayNoBoolType];
    self.tuesdayTableView.modelArray = [self fetchRequestForTuesdayNoBoolType];

//    self.mondayTableView.modelArray = [self fetchRequestForMonday];
//    self.tuesdayTableView.modelArray = [self fetchRequestForTuesday];
}

@end
