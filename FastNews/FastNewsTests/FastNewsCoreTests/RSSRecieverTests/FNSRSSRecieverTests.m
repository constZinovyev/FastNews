//
//  FNSRSSRecieverTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 06.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "FNSRSSRecieverImplementation.h"
#import "BNRSSFeedParser.h"
#import "BNPodcastFeed.h"

static const CGFloat kTestExpectationTimeout = 2.0f;

@interface FNSRSSRecieverTests : XCTestCase

@property (strong, nonatomic) FNSRSSRecieverImplementation *recieverRSS;
@property (strong, nonatomic) id feedParser;

@end

@implementation FNSRSSRecieverTests

- (void)setUp {
    [super setUp];
    
    self.feedParser = OCMClassMock([BNRSSFeedParser class]);
    self.recieverRSS = [[FNSRSSRecieverImplementation alloc] initWithFeedParser:self.feedParser];
    
}

- (void)tearDown {
    self.recieverRSS = nil;
    self.feedParser = nil;
    
    [super tearDown];
}

- (void)testFailureObtainNews{
    //    given
    XCTestExpectation *expectation = [self expectationWithDescription:@"Block not call"];
    NSError *errorParser = [NSError errorWithDomain:@"Some Error" code:0 userInfo:nil];
    __block NSError *obtainError = nil;
    
    OCMStub([self.feedParser parseFeedURL:OCMOCK_ANY withETag:OCMOCK_ANY untilPubDate:OCMOCK_ANY success:OCMOCK_ANY failure:OCMOCK_ANY]).andDo(^(NSInvocation *invocation) {
        void (^block)(NSHTTPURLResponse*, NSError*);
        [invocation getArgument:&block atIndex:6];
        block(nil,errorParser);
    });
    
    //    when
    [self.recieverRSS obtainRSSFeedFromURL:OCMOCK_ANY withCompletionBlock:^(NSArray *feed, NSError *error) {
        obtainError = error;
        [expectation fulfill];
    }];
    
    //    then
    [self waitForExpectationsWithTimeout:kTestExpectationTimeout handler:^(NSError * _Nullable error) {
               XCTAssertEqual(errorParser, obtainError);
    }];
    
}

- (void)testSuccessObtainNews{
//    given
    XCTestExpectation *expectation = [self expectationWithDescription:@"Block not call"];
    BNPodcastFeed *channel = OCMClassMock([BNPodcastFeed class]);
    NSArray *feed = @[@3, @1, @4, @2];
    __block NSArray *obtainFeed = nil;
    OCMStub([channel items]).andReturn(feed);
    
    OCMStub([self.feedParser parseFeedURL:OCMOCK_ANY withETag:OCMOCK_ANY untilPubDate:OCMOCK_ANY success:OCMOCK_ANY failure:OCMOCK_ANY]).andDo(^(NSInvocation *invocation) {
        void (^block)(NSHTTPURLResponse*, BNPodcastFeed*);
        [invocation getArgument:&block atIndex:5];
        block(nil,channel);
    });
    
//    when
    [self.recieverRSS obtainRSSFeedFromURL:OCMOCK_ANY withCompletionBlock:^(NSArray *feed, NSError *error) {
        obtainFeed = feed;
        [expectation fulfill];
    }];
    
//    then
    [self waitForExpectationsWithTimeout:kTestExpectationTimeout handler:^(NSError * _Nullable error) {
       XCTAssertEqual(feed, obtainFeed);
    }];
    
}


@end
