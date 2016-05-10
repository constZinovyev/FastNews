//
//  FNSNewsListViewController.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FNSNewsListViewInput.h"
#import "FNSNewsListViewOutput.h"
#import "FNSTableViewDataSource.h"
#import "FNSTableViewDelegate.h"
#import "FNSNewsTableViewOutput.h"

@interface FNSNewsListViewController : UITableViewController <FNSNewsListViewInput, FNSNewsTableViewOutput>

@property (nonatomic, strong) id<FNSNewsListViewOutput> output;
@property (nonatomic, strong) id<FNSTableViewDelegate> delegateTableView;
@property (nonatomic, strong) id<FNSTableViewDataSource> dataSourceTableView;

@end
