//
//  FNSSourcesListTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FNSSourcesListImplementation.h"

static NSString *const kLinkLentaRSS = @"https://lenta.ru/rss";
static NSString *const kLinkGazetaRSS = @"http://www.gazeta.ru/export/rss/lenta.xml";


@interface FNSSourcesListTests : XCTestCase

@property (strong, nonatomic) FNSSourcesListImplementation *sourcesList;

@end

@implementation FNSSourcesListTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCorrectDefaultSources {
    //given
    self.sourcesList = [[FNSSourcesListImplementation alloc] initWithDefaultSources];
    NSString *linkLenta = kLinkLentaRSS;
    NSString *linkGazeta = kLinkGazetaRSS;
    //when
    NSArray *array = [self.sourcesList sourcesList];
    NSURL *lentaURL = array[0];
    NSURL *gazetaURL = array[1];
    NSString *testLinkLenta = [lentaURL absoluteString];
    NSString *testLinkGazeta = [gazetaURL absoluteString];
    //then
    XCTAssertEqualObjects(testLinkLenta, linkLenta);
    XCTAssertEqualObjects(testLinkGazeta, linkGazeta);
    
}


@end
