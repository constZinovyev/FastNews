//
//  FNSNewsListTableViewCellTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FNSNewsListTableViewCell.h"
#import "FNSDateFormatter.h"

@interface FNSNewsListTableViewCellTests : XCTestCase

@property (nonatomic, strong) FNSNewsListTableViewCell *cell;

@end

@implementation FNSNewsListTableViewCellTests

- (void)setUp {
    [super setUp];
    
    self.cell = [[FNSNewsListTableViewCell alloc] init];
}

- (void)tearDown {
    self.cell = nil;
    self.cell.newsDate = nil;
    self.cell.newsAuthor = nil;
    self.cell.newsTitle = nil;
    
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testSuccessSetupViewWithNewsObject {
    //given
    FNSNewsObject *newsObject = [[FNSNewsObject alloc] init];
    newsObject.title = @"title";
    newsObject.author = @"author";
    newsObject.content = @"content";
    newsObject.date = [NSDate dateWithTimeIntervalSince1970:0];
    NSString *stringDate = @"03:00 01/01";
    UITextView *textTitle = [[UITextView alloc] init];
    UILabel *labelAuthor = [[UILabel alloc] init];
    UILabel *labelDate = [[UILabel alloc] init];
    self.cell.newsTitle = textTitle;
    self.cell.newsAuthor = labelAuthor;
    self.cell.newsDate = labelDate;
    
    //when
    [self.cell fillWithObject:newsObject];
    
    //then
    XCTAssertEqualObjects(newsObject.title, self.cell.newsTitle.text);
    XCTAssertEqualObjects(newsObject.author, self.cell.newsAuthor.text);
    XCTAssertEqualObjects(stringDate, self.cell.newsDate.text);
}
@end
