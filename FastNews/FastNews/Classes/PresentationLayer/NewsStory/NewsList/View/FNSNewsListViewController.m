//
//  FNSNewsListViewController.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSNewsListViewController.h"

static NSString *const kDetailRSSNewsSegue = @"NewsDetailSegue";

@implementation FNSNewsListViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.output setupView];
    [self startSetupView];
    
};

- (void)startSetupView{
    self.title = @"RSS NEWS";
    self.tableView.delegate = self.delegateTableView;
    self.tableView.dataSource = self.dataSourceTableView;
    [self.delegateTableView setDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}
- (void)setupViewWithNewsList:(NSArray *)feed{
    
    [self.dataSourceTableView setDataForTableViewDataSource:feed];
    [self.delegateTableView setDataForTableViewDelegate:feed];
    [self.tableView reloadData];
}

- (void)didSelectCellWithNews:(id)news{
    [self.output didSelectCellWithNews:news];
}


@end
