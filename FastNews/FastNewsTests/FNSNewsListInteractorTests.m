//
//  FNSNewsListInteractorTests.m
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
#import "FNSSourcesList.h"
#import "FNSReachability.h"
#import "FNSNewsObject.h"
#import <MagicalRecord/MagicalRecord.h>

static NSString *const kLinkLentaRSS = @"https://lenta.ru/rss";
static NSString *const kLinkGazetaRSS = @"http://www.gazeta.ru/export/rss/lenta.xml";
static const CGFloat kTestExpectationTimeout = 2.0f;

@interface FNSNewsListInteractorTests : XCTestCase

@property (strong, nonatomic) FNSNewsDetailInteractor *interactor;
@property (strong, nonatomic) id<FNSNewsService> mockNewsService;
@property (strong, nonatomic) id<FNSMapper> mockMapper;
@property (strong, nonatomic) id<FNSReachability> mockReachabilityInternetConnection;
@property (strong, nonatomic) id<FNSSourcesList> mockSourcesList;

@end

@implementation FNSNewsListInteractorTests

- (void)setUp {
    [super setUp];
    
    self.mockNewsService = OCMProtocolMock(@protocol(FNSNewsService));
    self.mockMapper = OCMProtocolMock(@protocol(FNSMapper));
    self.mockReachabilityInternetConnection = OCMProtocolMock(@protocol(FNSReachability));
    self.mockSourcesList = OCMProtocolMock(@protocol(FNSSourcesList));
    self.interactor = [[FNSNewsDetailInteractor alloc] initWithNewsService:self.mockNewsService
                                                                 andMapper:self.mockMapper
                                                           andReachability:self.mockReachabilityInternetConnection
                                                            andSourcesList:self.mockSourcesList];
}

- (void)tearDown {
    self.mockNewsService = nil;
    self.mockSourcesList = nil;
    self.mockReachabilityInternetConnection = nil;
    self.mockMapper = nil;
    self.interactor = nil;
    
    [super tearDown];
}

- (void)testObtainSortedNewsListFromInternet {
    //given
    XCTestExpectation *expectation = [self expectationWithDescription:@"Block not call"];
    NSURL *urlLenta = [NSURL URLWithString:kLinkLentaRSS];
    NSURL *urlGazeta = [NSURL URLWithString:kLinkGazetaRSS];
    NSArray *sourcesList = @[urlLenta, urlGazeta];
    FNSNewsObject *newsObject1 = [[FNSNewsObject alloc] init];
    newsObject1.date = [NSDate dateWithTimeIntervalSinceNow:0];
    FNSNewsObject *newsObject2 = [[FNSNewsObject alloc] init];
    newsObject2.date = [NSDate dateWithTimeIntervalSinceNow:5000];
    FNSNewsObject *newsObject3 = [[FNSNewsObject alloc] init];
    newsObject3.date = [NSDate dateWithTimeIntervalSinceNow:10000];
    
    NSArray *mappingFeed = @[newsObject1, newsObject3, newsObject2];
    NSArray *correctFeed = @[newsObject3, newsObject2, newsObject1];
    OCMStub([self.mockReachabilityInternetConnection connectedToInternet]).andReturn(YES);
    OCMStub([self.mockSourcesList sourcesList]).andReturn(sourcesList);
    OCMStub([self.mockMapper mappingFromObject:OCMOCK_ANY]).andReturn(mappingFeed);
    OCMStub([self.mockNewsService obtainNewsListFromSources:OCMOCK_ANY WithCompletionBlock:OCMOCK_ANY]).andDo(^(NSInvocation *invocation) {
        void (^block)(NSArray*, NSError*);
        [invocation getArgument:&block atIndex:3];
        block(nil,nil);
    });
    //when
    __block NSArray *obtainFeed;
    [self.interactor obtainNewsListWithCompletionBlock:^(NSArray *feed, NSError *error) {
        obtainFeed = feed;
        [expectation fulfill];
    }];
    //then
    [self waitForExpectationsWithTimeout:kTestExpectationTimeout handler:^(NSError * _Nullable error) {
        XCTAssertEqualObjects(obtainFeed, correctFeed);
    }];
}

- (void)testObtainSortedNewsListFromCoreData {
    //given
    XCTestExpectation *expectation = [self expectationWithDescription:@"Block not call"];
    
    FNSNewsObject *newsObject1 = [[FNSNewsObject alloc] init];
    newsObject1.date = [NSDate dateWithTimeIntervalSinceNow:0];
    FNSNewsObject *newsObject2 = [[FNSNewsObject alloc] init];
    newsObject2.date = [NSDate dateWithTimeIntervalSinceNow:5000];
    FNSNewsObject *newsObject3 = [[FNSNewsObject alloc] init];
    newsObject3.date = [NSDate dateWithTimeIntervalSinceNow:10000];
    
    NSArray *mappingFeed = @[newsObject1, newsObject3, newsObject2];
    NSArray *correctFeed = @[newsObject3, newsObject2, newsObject1];
    
    OCMStub([self.mockReachabilityInternetConnection connectedToInternet]).andReturn(NO);
    OCMStub([self.mockMapper mappingFromObject:OCMOCK_ANY]).andReturn(mappingFeed);
    //when
    __block NSArray *obtainFeed;
    [self.interactor obtainNewsListWithCompletionBlock:^(NSArray *feed, NSError *error) {
        obtainFeed = feed;
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:kTestExpectationTimeout handler:^(NSError * _Nullable error) {
        XCTAssertEqualObjects(obtainFeed, correctFeed);
    }];

}

@end
