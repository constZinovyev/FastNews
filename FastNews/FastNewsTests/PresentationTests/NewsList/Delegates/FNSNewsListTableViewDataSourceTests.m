//
//  FNSNewsListTableViewDataSourceTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "FNSNewsListTableViewDataSource.h"

@interface FNSNewsListTableViewDataSourceTests : XCTestCase

@property (strong, nonatomic) FNSNewsListTableViewDataSource *tableViewDataSource;

@end

@implementation FNSNewsListTableViewDataSourceTests

- (void)setUp {
    [super setUp];
    
    self.tableViewDataSource = [[FNSNewsListTableViewDataSource alloc] init];
}

- (void)tearDown {
    self.tableViewDataSource = nil;
    
    [super tearDown];
}

- (void)testSetData {
    //given
    NSArray *array = @[@1];
    
    //when
    [self.tableViewDataSource setFeed:array];
    
    XCTAssertEqualObjects(array, self.tableViewDataSource.feed);
    //then
}

- (void)testReturnCountCells {
    //given
    NSArray *array = @[@1, @2, @3, @4, @5];
    self.tableViewDataSource.feed = array;
    //when
    NSInteger count = [self.tableViewDataSource tableView:OCMOCK_ANY numberOfRowsInSection:0];
    
    XCTAssertEqual(count, [array count]);
    //then
}

@end
