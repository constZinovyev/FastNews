//
//  FNSMapperBNItemsToManagedObjectTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 07.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <MagicalRecord/MagicalRecord.h>
#import "FNSMapperBNItemsToManagedObject.h"
#import "BNRSSFeedItem.h"
#import "BNRSSFeedItemEnclosure.h"
#import "FNSNewsItemManagedObject.h"

static CGFloat const kTestExpectationTimeout = 2.0f;
@interface FNSMapperBNItemsToManagedObjectTests : XCTestCase

@property (strong, nonatomic) FNSMapperBNItemsToManagedObject *mapper;

@end

@implementation FNSMapperBNItemsToManagedObjectTests

- (void)setUp {
    [super setUp];
    
    self.mapper = [[FNSMapperBNItemsToManagedObject alloc] init];
    [MagicalRecord setupCoreDataStackWithInMemoryStore];
}

- (void)tearDown {
    self.mapper = nil;
    [MagicalRecord cleanUp];
    
    [super tearDown];
}

- (void)testSuccessMapperBNItemToManagedObject {
    //given
    NSString *title = @"title";
    NSString *description = @"description";
    NSString *author = @"author";
    NSURL *url = [NSURL URLWithString:@"url"];
    NSURL *imageURL = [NSURL URLWithString:@"url"];
    NSDate *date = [NSDate date];
    id enclosure = OCMClassMock([BNRSSFeedItemEnclosure class]);
    id feedItem = OCMClassMock([BNRSSFeedItem class]);
    
    OCMStub([feedItem title]).andReturn(title);
//    OCMStub([feedItem description]).andReturn(description);
    OCMStub([feedItem link]).andReturn(url);
    OCMStub([feedItem author]).andReturn(author);
    OCMStub([feedItem enclosure]).andReturn(enclosure);
    OCMStub([enclosure url]).andReturn(imageURL);
    OCMStub([feedItem pubDate]).andReturn(date);
    
    FNSNewsItemManagedObject *rightObject = [FNSNewsItemManagedObject MR_createEntity];
    rightObject.title = title;
//    rightObject.content = description;
    rightObject.author = author;
    rightObject.link = [url absoluteString];
    rightObject.date = date;
    rightObject.imageURL = [imageURL absoluteString];
    
    //when
    FNSNewsItemManagedObject *testObject = [self.mapper mappingFromObject:feedItem];
    
    //then
    BOOL isManagedObject = [testObject isKindOfClass:[FNSNewsItemManagedObject class]];
    XCTAssertTrue(isManagedObject);
    
    XCTAssertEqualObjects(rightObject.title, testObject.title);
    XCTAssertEqualObjects(rightObject.title, testObject.title);
    XCTAssertEqualObjects(rightObject.date, testObject.date);
    XCTAssertEqualObjects(rightObject.imageURL, testObject.imageURL);
    XCTAssertEqualObjects(rightObject.link, testObject.link);
    XCTAssertEqualObjects(rightObject.author, testObject.author);
//    XCTAssertEqualObjects(rightObject.content, testObject.content);
    
}

- (void)testCreateNewsInCoreData{
    //given
    BNRSSFeedItem *feedItem = [[BNRSSFeedItem alloc] init];
    
    //    when
    [self.mapper mappingFromObject:feedItem];

    //then
    OCMVerify([FNSNewsItemManagedObject MR_createEntity]);
    
}
@end
