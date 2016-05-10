//
//  FNSNewsDetailViewControllerTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "FNSNewsDetailViewController.h"
#import "FNSNewsDetailViewOutput.h"
#import "FNSDateFormatter.h"
#import "FNSNewsObject.h"

@interface FNSNewsDetailViewControllerTests : XCTestCase

@property (strong, nonatomic) FNSNewsDetailViewController *viewController;
@property (strong, nonatomic) id<FNSNewsDetailViewOutput> output;
@property (strong, nonatomic) id<FNSDateFormatter> dateFormatter;

@end

@implementation FNSNewsDetailViewControllerTests

- (void)setUp {
    [super setUp];
    self.output = OCMProtocolMock(@protocol(FNSNewsDetailViewOutput));
    self.dateFormatter = OCMProtocolMock(@protocol(FNSDateFormatter));
    self.viewController = [[FNSNewsDetailViewController alloc] init];
    self.viewController.output = self.output;
    self.viewController.dateFormatter = self.dateFormatter;
}

- (void)tearDown {
    self.output = nil;
    self.dateFormatter = nil;
    self.viewController = nil;

    [super tearDown];
}

- (void)testSuccessViewDidLoad {
    // given
    
    // when
    [self.viewController viewDidLoad];
    
    // then
    OCMVerify([self.output setupView]);
}

- (void)testSuccessSetupViewWithNewsObject {
    //given
    FNSNewsObject *newsObject = [[FNSNewsObject alloc] init];
    newsObject.title = @"title";
    newsObject.author = @"author";
    newsObject.content = @"content";
    newsObject.date = [NSDate dateWithTimeIntervalSince1970:0];
    NSString *stringDate = @"03:00 01/01";
    OCMStub([self.dateFormatter stringFullTimeFromDate:OCMOCK_ANY]).andReturn(stringDate);
    UITextView *textViewContent = [[UITextView alloc] init];
    UITextView *textViewTitle = [[UITextView alloc] init];
    UILabel *labelAuthor = [[UILabel alloc] init];
    UILabel *labelPubDate = [[UILabel alloc] init];
    self.viewController.newsContent = textViewContent;
    self.viewController.newsTitle = textViewTitle;
    self.viewController.newsPubDate = labelPubDate;
    self.viewController.newsAuthor = labelAuthor;
    NSString *content = [newsObject.content stringByReplacingCharactersInRange:NSMakeRange(0,0) withString:@"    "];
    
    //when
    [self.viewController setupViewWithNewsObject:newsObject];
    
    //then
    XCTAssertEqualObjects(newsObject.title, self.viewController.newsTitle.text);
    XCTAssertEqualObjects(newsObject.author, self.viewController.newsAuthor.text);
    XCTAssertEqualObjects(content, self.viewController.newsContent.text);
    XCTAssertEqualObjects(stringDate, self.viewController.newsPubDate.text);
}

@end
