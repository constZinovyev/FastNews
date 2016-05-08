//
//  FNSNewsServiceTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <MagicalRecord/MagicalRecord.h>
#import "FNSNewsServiceImplementation.h"
#import "FNSMultipleRSSRecieverImplementation.h"
#import "FNSMultipleRSSReciever.h"
#import "FNSMapper.h"
#import "FNSNewsItemManagedObject.h"
#import "BNRSSFeedItem.h"

static const CGFloat kTestExpectationTimeout = 2.0f;

@interface FNSNewsServiceTests : XCTestCase

@property (strong, nonatomic) FNSNewsServiceImplementation *newsService;
@property (strong, nonatomic) id <FNSMultipleRSSReciever> multipleRSSReciever;
@property (strong, nonatomic) id <FNSMapper> mapper;

@end

@implementation FNSNewsServiceTests

- (void)setUp {
    [super setUp];
    
    self.multipleRSSReciever = OCMProtocolMock(@protocol(FNSMultipleRSSReciever));
    self.mapper = OCMProtocolMock(@protocol(FNSMapper));
    self.newsService = [[FNSNewsServiceImplementation alloc] initWithMultipleRSSReciever:self.multipleRSSReciever
                                                                               andMapper:self.mapper];
    [MagicalRecord setupCoreDataStackWithInMemoryStore];
}

- (void)tearDown {
    [MagicalRecord cleanUp];
    self.mapper = nil;
    self.multipleRSSReciever = nil;
    self.newsService = nil;
    
    [super tearDown];
}

- (void)testSuccessCountObtainNewsObjects {
    //given
    NSInteger countObjectsInCoreData = 5;
    NSManagedObjectContext *managedObjectContext = [NSManagedObjectContext MR_rootSavingContext];
    [managedObjectContext MR_saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
        FNSNewsItemManagedObject *newsItem;
        for (int i = 0; i < countObjectsInCoreData; ++i){
            newsItem = [FNSNewsItemManagedObject MR_createEntity];
        }
    }];
    
    //when
    NSArray *objects = [self.newsService obtainAllNewsListLocal];
    
    //then
    XCTAssertEqual(countObjectsInCoreData, [objects count]);
}

- (void)testSuccessObtainNewsObjectWithLink {
    //given
    NSString *newsItemLink = @"http://ya.ru";
    
    NSManagedObjectContext *managedObjectContext = [NSManagedObjectContext MR_rootSavingContext];
    [managedObjectContext MR_saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
        FNSNewsItemManagedObject *newsItem = [FNSNewsItemManagedObject MR_createEntity];
        newsItem.link = newsItemLink;
    }];
    
    //when
    FNSNewsItemManagedObject *testObject = [self.newsService obtainNewsWithNewsId:newsItemLink];
    
    //then
    XCTAssertNotNil(testObject);
}


- (void)testReturnManagedObjects{
    //  given
    XCTestExpectation *expectation = [self expectationWithDescription:@"Block not call"];
    
    BNRSSFeedItem *feedItem = [[BNRSSFeedItem alloc] init];
    NSArray *feed = @[feedItem];
    
    FNSNewsItemManagedObject *newsManagedObject = [FNSNewsItemManagedObject MR_createEntity];
    NSArray *feedManagedObjects = @[newsManagedObject];
    
    OCMStub([self.multipleRSSReciever obtainRSSFeedFromSources:OCMOCK_ANY withCompletionBlock:OCMOCK_ANY]).andDo(^(NSInvocation *invocation) {
        void (^block)(NSArray*, NSError*);
        [invocation getArgument:&block atIndex:3];
        block(feed,nil);
    });
    
    OCMStub([self.mapper mappingFromObject:feed]).andReturn(feedManagedObjects);
    //    when
    __block NSArray *obtainFeed = nil;
    [self.newsService obtainNewsListFromSources:@[@"", @""] WithCompletionBlock:^(NSArray *feed, NSError *error) {
        obtainFeed = feed;
        [expectation fulfill];
    }];
    
    //    then
    [self waitForExpectationsWithTimeout:kTestExpectationTimeout handler:^(NSError * _Nullable error) {
        id object = obtainFeed[0];
        BOOL isManagedObject = [object isKindOfClass:[NSManagedObject class]];
        XCTAssertTrue(isManagedObject);
    }];
}

- (void)testSuccessCountObtainNewsFromSources{
    //    given
    XCTestExpectation *expectation = [self expectationWithDescription:@"Block not call"];
    BNRSSFeedItem *feedItem1 = [[BNRSSFeedItem alloc] init];
    BNRSSFeedItem *feedItem2 = [[BNRSSFeedItem alloc] init];
    NSArray *feed = @[feedItem1, feedItem2];
    FNSNewsItemManagedObject *newsManagedObject1 = [FNSNewsItemManagedObject MR_createEntity];
    FNSNewsItemManagedObject *newsManagedObject2 = [FNSNewsItemManagedObject MR_createEntity];
    NSArray *feedManagedObjects = @[newsManagedObject1, newsManagedObject2];
    
    
    OCMStub([self.multipleRSSReciever obtainRSSFeedFromSources:OCMOCK_ANY withCompletionBlock:OCMOCK_ANY]).andDo(^(NSInvocation *invocation) {
        void (^block)(NSArray*, NSError*);
        [invocation getArgument:&block atIndex:3];
        block(feed,nil);
    });
    
    OCMStub([self.mapper mappingFromObject:feed]).andReturn(feedManagedObjects);
    //    when
    __block NSArray *obtainFeed = nil;
    [self.newsService obtainNewsListFromSources:@[@"", @""] WithCompletionBlock:^(NSArray *feed, NSError *error) {
        obtainFeed = feed;
        [expectation fulfill];
    }];
    
    //    then
    [self waitForExpectationsWithTimeout:kTestExpectationTimeout handler:^(NSError * _Nullable error) {
        XCTAssertEqual([feed count], [obtainFeed count]);
    }];

}

- (void)testErrorNewsService{
    //    given
    XCTestExpectation *expectation = [self expectationWithDescription:@"Block not call"];
    NSError *errorService = [NSError errorWithDomain:@"Some error" code:0 userInfo:nil];
    
    OCMStub([self.multipleRSSReciever obtainRSSFeedFromSources:OCMOCK_ANY withCompletionBlock:OCMOCK_ANY]).andDo(^(NSInvocation *invocation) {
        void (^block)(NSArray*, NSError*);
        [invocation getArgument:&block atIndex:3];
        block(nil,errorService);
    });
    
    //    when
    __block NSError *obtainError = nil;
    [self.newsService obtainNewsListFromSources:@[@"", @""] WithCompletionBlock:^(NSArray *feed, NSError *error) {
        obtainError = error;
        [expectation fulfill];
    }];
    
    //    then
    [self waitForExpectationsWithTimeout:kTestExpectationTimeout handler:^(NSError * _Nullable error) {
        XCTAssertEqual(obtainError, errorService);
    }];
    
}
@end
