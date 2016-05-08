//
//  FNSNewsDetailInteractorTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "FNSNewsDetailInteractor.h"
#import "FNSMapper.h"
#import "FNSNewsService.h"
#import "FNSNewsObject.h"

@interface FNSNewsDetailInteractorTests : XCTestCase

@property (strong, nonatomic) FNSNewsDetailInteractor *interactor;
@property (strong, nonatomic) id<FNSNewsService> mockNewsService;
@property (strong, nonatomic) id<FNSMapper> mockMapper;

@end

@implementation FNSNewsDetailInteractorTests

- (void)setUp {
    [super setUp];
    
    self.mockNewsService = OCMProtocolMock(@protocol(FNSNewsService));
    self.mockMapper = OCMProtocolMock(@protocol(FNSMapper));
    self.interactor = [[FNSNewsDetailInteractor alloc] initWithNewsService:self.mockNewsService andMapper:self.mockMapper];
}

- (void)tearDown {
    self.mockMapper = nil;
    self.mockNewsService = nil;
    self.interactor = nil;
    
    [super tearDown];
}

- (void)testObtainNewsObject {
    //given
    FNSNewsObject *newsObject = [[FNSNewsObject alloc] init];
    OCMStub([self.mockMapper mappingFromObject:OCMOCK_ANY]).andReturn(newsObject);
    
    //when
    id obtainObject = [self.interactor obtainNewsWithNewsId:OCMOCK_ANY];
    
    //then
    BOOL isNewsObject = [obtainObject isKindOfClass:[FNSNewsObject class]];
    OCMVerify([self.mockMapper mappingFromObject:OCMOCK_ANY]);
    OCMVerify([self.mockNewsService obtainNewsWithNewsId:OCMOCK_ANY]);
    XCTAssertTrue(isNewsObject);
    
    
}

@end
