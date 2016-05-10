//
//  FNSNewsListViewControllerTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "FNSNewsListViewController.h"
#import "FNSNewsListViewOutput.h"
#import "FNSTableViewDelegate.h"
#import "FNSTableViewDataSource.h"

@interface FNSNewsListViewControllerTests : XCTestCase

@property (strong, nonatomic) FNSNewsListViewController *viewController;
@property (strong, nonatomic) id<FNSNewsListViewOutput> output;
@property (nonatomic, strong) id<FNSTableViewDelegate> delegateTableView;
@property (nonatomic, strong) id<FNSTableViewDataSource> dataSourceTableView;

@end

@implementation FNSNewsListViewControllerTests

- (void)setUp {
    [super setUp];
    self.output = OCMProtocolMock(@protocol(FNSNewsListViewOutput));
    self.delegateTableView = OCMProtocolMock(@protocol(FNSTableViewDelegate));
    self.dataSourceTableView = OCMProtocolMock(@protocol(FNSTableViewDataSource));
    self.viewController = [[FNSNewsListViewController alloc] init];
    self.viewController.output = self.output;
    self.viewController.dataSourceTableView = self.dataSourceTableView;
    self.viewController.delegateTableView = self.delegateTableView;
}

- (void)tearDown {
    self.output = nil;
    self.delegateTableView = nil;
    self.dataSourceTableView = nil;
    self.viewController = nil;
    [super tearDown];
}

- (void)testSuccessViewDidLoadOutputSetup {
    // given
    
    // when
    [self.viewController viewDidLoad];
    
    // then
    OCMVerify([self.output setupView]);
}

- (void)testSuccessViewDidLoadStartSetting {
    // given
    
    // when
    [self.viewController viewDidLoad];
    
    // then
    XCTAssertNotNil(self.viewController.title);
    XCTAssertNotNil(self.viewController.tableView.delegate);
    XCTAssertNotNil(self.viewController.tableView.dataSource);
}

- (void)testSuccessSetupTableViewNews {
    // given
    NSArray *news = @[];
    
    // when
    [self.viewController setupViewWithNewsList:news];
    
    // then
    OCMVerify([self.dataSourceTableView setDataForTableViewDataSource:news]);
    OCMVerify([self.delegateTableView setDataForTableViewDelegate:news]);
}
@end
