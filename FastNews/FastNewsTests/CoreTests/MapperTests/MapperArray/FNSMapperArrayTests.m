//
//  FNSMapperArrayTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 07.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "FNSMapperArrayObjects.h"
#import "FNSMapper.h"

@interface FNSMapperArrayTests : XCTestCase

@property (strong, nonatomic) FNSMapperArrayObjects *mapper;
@property (strong, nonatomic) id singleMapper;

@end

@implementation FNSMapperArrayTests

- (void)setUp {
    [super setUp];
    self.singleMapper = OCMProtocolMock(@protocol(FNSMapper));
    self.mapper = [[FNSMapperArrayObjects alloc] initWithSigleObjectMapper:self.singleMapper];
}

- (void)tearDown {
    self.singleMapper = nil;
    self.mapper = nil;
    [super tearDown];
}

- (void)testSuccessMapperArray {
//    given
    NSArray *rightArray = @[@1, @1, @1, @1, @1, @1];
    OCMStub([self.singleMapper mappingFromObject:OCMOCK_ANY]).andReturn(@1);
    
//    when
    NSArray *testArray = [self.mapper mappingFromObject:rightArray];
    
//    then
    XCTAssertEqualObjects(rightArray, testArray);
}

- (void)testEmptyArrayMapper {
    //    given
    NSArray *rightArray = @[];
    OCMStub([self.singleMapper mappingFromObject:OCMOCK_ANY]).andReturn(nil);
    
    //    when
    NSArray *testArray = [self.mapper mappingFromObject:rightArray];
    
    //    then
    XCTAssertEqualObjects(@[], testArray);
}

- (void)testNilArrayMapper {
    //    given
    NSArray *rightArray = @[];
    OCMStub([self.singleMapper mappingFromObject:OCMOCK_ANY]).andReturn(nil);
    
    //    when
    NSArray *testArray = [self.mapper mappingFromObject:rightArray];
    
    //    then
    XCTAssertEqualObjects(@[], testArray);
}

@end
