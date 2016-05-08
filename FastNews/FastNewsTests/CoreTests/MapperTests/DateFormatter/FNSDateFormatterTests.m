//
//  FNSDateFormatterTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FNSDateFormatterImplementation.h"

@interface FNSDateFormatterTests : XCTestCase

@property (strong, nonatomic) FNSDateFormatterImplementation *dateFormatter;

@end

@implementation FNSDateFormatterTests

- (void)setUp {
    [super setUp];
    
    self.dateFormatter = [[FNSDateFormatterImplementation alloc] init];
}

- (void)tearDown {
    self.dateFormatter = nil;
    
    [super tearDown];
}

- (void)testCorrectFortmatDate {
//    given
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:0];
    NSString *correctStringDate = @"03:00 01/01";
//    when
    NSString *stringDate = [self.dateFormatter stringFullTimeFromDate:date];
    
//    then
    XCTAssertEqualObjects(stringDate, correctStringDate);
}

@end
