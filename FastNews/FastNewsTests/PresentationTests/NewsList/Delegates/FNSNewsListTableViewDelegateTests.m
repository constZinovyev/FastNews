//
//  FNSNewsListTableViewDelegateTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "FNSNewsListTableViewDelegate.h"
#import "FNSNewsTableViewOutput.h"

@interface FNSNewsListTableViewDelegateTests : XCTestCase

@property (strong, nonatomic) FNSNewsListTableViewDelegate *tableViewDelegate;
@property (nonatomic, weak) id<FNSNewsTableViewOutput> delegate;

@end

@implementation FNSNewsListTableViewDelegateTests

- (void)setUp {
    [super setUp];
    self.delegate = OCMProtocolMock(@protocol(FNSNewsTableViewOutput));
    self.tableViewDelegate = [[FNSNewsListTableViewDelegate alloc] init];
    self.tableViewDelegate.delegate = self.delegate;
}

- (void)tearDown {
    self.delegate = nil;
    self.tableViewDelegate = nil;
    
    [super tearDown];
}

- (void)testDidSelectRowAtIndexPath {
    //given
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    //when
    [self.tableViewDelegate tableView:OCMOCK_ANY didSelectRowAtIndexPath:indexPath];
    
    OCMVerify([self.delegate didSelectCellWithNews:OCMOCK_ANY]);
    //then
}

- (void)testSetData {
    //given
    NSArray *array = @[@1];
    
    //when
    [self.tableViewDelegate setFeed:array];
    
    XCTAssertEqualObjects(array, self.tableViewDelegate.feed);
    //then
}

@end
