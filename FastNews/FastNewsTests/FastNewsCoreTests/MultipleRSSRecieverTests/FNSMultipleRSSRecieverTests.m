//
//  FNSMultipleRSSRecieverTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 07.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "FNSMultipleRSSRecieverImplementation.h"
#import "FNSMultipleRSSReciever.h"
#import "FNSRSSRecieverImplementation.h"

static const CGFloat kTestExpectationTimeout = 5.0f;

@interface FNSMultipleRSSRecieverTests : XCTestCase

@property (strong, nonatomic) id <FNSMultipleRSSReciever> multipleRecieverRSS;
@property (strong, nonatomic) id recieverRSS;

@end

@implementation FNSMultipleRSSRecieverTests

- (void)setUp {
    [super setUp];
    
    self.recieverRSS = OCMClassMock([FNSRSSRecieverImplementation class]);
    self.multipleRecieverRSS = [[FNSMultipleRSSRecieverImplementation alloc] initWithRSSReciever:self.recieverRSS];
}

- (void)tearDown {
    self.recieverRSS = nil;
    self.multipleRecieverRSS = nil;
    [super tearDown];
}

- (void)testSuccessMultipleObtainNews{
    //    given
    XCTestExpectation *expectation = [self expectationWithDescription:@"Block not call"];
    NSArray *feed = @[@3, @1, @4, @2];
    NSArray *obtainCurrentFeed = @[@3, @1, @4, @2, @3, @1, @4, @2];
    __block NSArray *obtainFeed = nil;
    
    OCMStub([self.recieverRSS obtainRSSFeedFromURL:OCMOCK_ANY withCompletionBlock:OCMOCK_ANY]).andDo(^(NSInvocation *invocation) {
        void (^block)(NSArray*, NSError*);
        [invocation getArgument:&block atIndex:3];
        block(feed,nil);
    });
    
    
    
    //    when
    [self.multipleRecieverRSS obtainRSSFeedFromSources:@[@"", @""] withCompletionBlock:^(NSArray *feed, NSError *error) {
        obtainFeed = feed;
        [expectation fulfill];
    }];
    
    //    then
    [self waitForExpectationsWithTimeout:kTestExpectationTimeout handler:^(NSError * _Nullable error) {
        XCTAssertEqualObjects(obtainCurrentFeed, obtainFeed);
    }];
    
}

- (void)testFailureMultipleObtainNews{
    //    given
    XCTestExpectation *expectation = [self expectationWithDescription:@"Block not call"];
    NSError *errorNews = [NSError errorWithDomain:@"Some Error" code:0 userInfo:nil];
    __block NSError *obtainError = nil;
    
    OCMStub([self.recieverRSS obtainRSSFeedFromURL:OCMOCK_ANY withCompletionBlock:OCMOCK_ANY]).andDo(^(NSInvocation *invocation) {
        void (^block)(NSArray*, NSError*);
        [invocation getArgument:&block atIndex:3];
        block(nil,errorNews);
    });
    
    
    
    //    when
    [self.multipleRecieverRSS obtainRSSFeedFromSources:@[@"", @""] withCompletionBlock:^(NSArray *feed, NSError *error) {
        obtainError = error;
        [expectation fulfill];
    }];
    
    //    then
    [self waitForExpectationsWithTimeout:kTestExpectationTimeout handler:^(NSError * _Nullable error) {
        XCTAssertEqual(obtainError, errorNews);
    }];
    
}
@end
