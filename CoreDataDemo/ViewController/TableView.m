//
//  TableView.m
//  CoreDataDemo
//
//  Created by wangwenbo on 2018/7/8.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import "TableView.h"
#import "CoreDataHelper.h"
#import "A_Monday+CoreDataProperties.h"
#import "B_Tuesday+CoreDataProperties.h"

@interface TableView() <UITableViewDelegate, UITableViewDataSource>

@end

@implementation TableView

- (void)setModelArray:(NSArray *)modelArray {
    _modelArray = modelArray;
    [self reloadData];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        self.dataSource = self;
        self.rowHeight = 50;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.rowHeight)];
    label.font = [UIFont systemFontOfSize:10];
    label.numberOfLines = 0;
    [cell addSubview:label];
    
    NSMutableString *string = [[NSMutableString alloc] init];
    id model = self.modelArray[indexPath.row];
    if ([model isKindOfClass:[A_Monday class]]) {
        A_Monday *monday = (A_Monday *)model;
        [string appendString:[NSString stringWithFormat:@"stringType:%@\n",monday.stringType]];
        [string appendString:[NSString stringWithFormat:@"dataType:%@\n",monday.dateType]];
        [string appendString:[NSString stringWithFormat:@"intType:%d\n",monday.intType]];
//        [string appendString:[NSString stringWithFormat:@"boolType:%@\n",monday.boolType ? @"YES":@"NO"]];
    } else if ([model isKindOfClass:[B_Tuesday class]]) {
        cell.backgroundColor = [UIColor colorWithRed:240.0 / 255.0 green:240.0 / 255.0 blue:240.0 / 255.0 alpha:1];
        B_Tuesday *tuesday = (B_Tuesday *)model;
        [string appendString:[NSString stringWithFormat:@"stringType:%@\n",tuesday.stringType]];
        [string appendString:[NSString stringWithFormat:@"dataType:%@\n",tuesday.dateType]];
        [string appendString:[NSString stringWithFormat:@"intType:%d\n",tuesday.intType]];
//        [string appendString:[NSString stringWithFormat:@"boolType:%@\n",tuesday.boolType ? @"YES":@"NO"]];
    }
    label.text = [string copy];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = self.modelArray[indexPath.row];
    if ([model isKindOfClass:[A_Monday class]]) {
        A_Monday *monday = (A_Monday *)model;
        A_Monday *object = [[CoreDataHelper sharedInstance].context objectWithID:monday.objectID];
//        object.boolType = NO;
        [[CoreDataHelper sharedInstance] saveContent];
    } else if ([model isKindOfClass:[B_Tuesday class]]) {
        B_Tuesday *tuesday = (B_Tuesday *)model;
        B_Tuesday *object = [[CoreDataHelper sharedInstance].context objectWithID:tuesday.objectID];
//        object.boolType = NO;
        [[CoreDataHelper sharedInstance] saveContent];
    }
    if (self.didChangeBoolTypeToNo) {
        self.didChangeBoolTypeToNo();
    }
}

@end
