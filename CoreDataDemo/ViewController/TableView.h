//
//  TableView.h
//  CoreDataDemo
//
//  Created by wangwenbo on 2018/7/8.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^DidChangeBoolTypeToNo)(void);

@interface TableView : UITableView

@property (nonatomic, copy) NSArray *modelArray;
@property (nonatomic, copy) DidChangeBoolTypeToNo didChangeBoolTypeToNo;

@end

NS_ASSUME_NONNULL_END
